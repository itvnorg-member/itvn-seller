<?php
/**
 * Created by PhpStorm.
 * User: Dinh Thien Phuoc
 * Date: 7/23/2018
 * Time: 9:11 PM
 */

namespace App\Repositories;

use App\Models\Category;
use Illuminate\Support\Facades\Cache;
use Yajra\DataTables\Facades\DataTables;

Class CategoryRepository
{
    const CACHE_NAME_CATEGORIES = 'categories';

    public function dataTable($request)
    {
        $categories = Category::select(['categories.id', 'categories.name', 'categories.level', 'categories.active', 'categories.created_at']);

        $dataTable = DataTables::eloquent($categories)
        ->filter(function ($query) use ($request) {
            if (trim($request->get('status')) !== "") {
                $query->where('categories.active', $request->get('status'));
            }

            if (trim($request->get('keyword')) !== "") {
                $query->where(function ($sub) use ($request) {
                    $sub->where('categories.name', 'like', '%' . $request->get('keyword') . '%');
                });

            }
        }, true)
        ->addColumn('numbers', function ($category) {
            $html = '';
            $html .= '<a href="javascript:;">10</a>';
            return $html;
        })
        ->addColumn('action', function ($category) {
            $html = '';
            $html .= '<a href="' . route('admin.categories.view', ['id' => $category->id]) . '" class="btn btn-xs btn-primary" style="margin-right: 5px"><i class="glyphicon glyphicon-edit"></i> Sửa</a>';
            $html .= '<a href="#" class="bt-delete btn btn-xs btn-danger" data-id="' . $category->id . '" data-name="' . $category->name . '">';
            $html .= '<i class="fa fa-trash-o" aria-hidden="true"></i> Xóa</a>';
            return $html;
        })
        ->addColumn('status', function ($category) {
            $checked = ($category->active === ACTIVE) ? 'checked' : '';
            $html = '<label class="switch">
            <input type="checkbox" '.$checked.' class="switch-checkbox" data-name="' . $category->name . '" data-id="'.$category->id.'">
            <span class="slider round"></span>';
            return $html;
        })
        ->rawColumns(['status', 'action', 'numbers'])
        ->toJson();

        return $dataTable;
    }

    public function addCategory($category)
    {
        $categories = $this->getCategories();
        array_push($categories, $category);
        Cache::forever(self::CACHE_NAME_CATEGORIES, $categories);

        return $category;
    }

    public function getCategories()
    {
        return Cache::get(self::CACHE_NAME_CATEGORIES, []);
    }

    public function getCategory($id)
    {
        $data = Category::find($id);
        return $data;
    }

    public function createOrUpdate($data, $id = null)
    {
        if ($id) {
            $model = Category::find($id);
            $old_level = $model->level;
        } else {
            $model = new Category;
        }

        $model->name = $data['name'];
        if ($data['parent_id']) {
            $parent = Category::find($data['parent_id']);
        }
        $model->parent_id = ($data['parent_id']) ? $data['parent_id'] : null;
        $model->level = ($data['parent_id']) ? $parent->level + 1 : 0;
        $model->description = $data['description'];
        $model->active = $data['active'];
        $model->order = $data['order'];

        $model->save();

        // Check if have old level then reset categories hyerarchy
        if (isset($old_level) && $old_level != $model->level) {
            CategoryRepository::resetHierarchy($id, $id);
        }

        return $model;
    }

    public function delete($ids)
    {
        $result = [
            'success' => true,
            'errors' => []
        ];
        foreach ($ids as $id) {
            $category = Category::find($id);
            if ($category === null) {
                $result['errors'][] = 'ID danh mục: ' . $id . ' không tồn tại';
                $result['success'] = false;
                continue;
            }

            // Check category has products or not

            // Reset level and parent for children categories
            CategoryRepository::resetHierarchy($id, $category->parent_id);

            $category->delete();
        }

        return $result;
    }

    public function getCategoriesTree(){
        $categories = Category::select(['categories.id', 'categories.name', 'categories.level', 'categories.parent_id'])->get();
        $result = make_tree($categories);

        return $result;
    }

    public function changeStatus($request){
        if (trim($request->get('id')) !== "" && trim($request->get('status')) !== "") {
            $model = Category::find($request->get('id'));
            $model->active = $request->get('status');

            $model->save();
        }else{
            $result['errors'][] = 'Phải truyền vào id và trạng thái của danh mục';
            $result['success'] = false;
        }

        $result = [
            'success' => true,
            'errors' => []
        ];

        return $result;
    }

    public static function resetHierarchy($id, $parent_id){
        $children = Category::select(['categories.id', 'categories.level', 'categories.active'])->where('categories.parent_id', $id)->get();
        if (count($children) > 0) {
            $parent = Category::find($parent_id);
            foreach ($children as $child) {
                $child->parent_id = $parent_id;
                $child->level = $parent->level + 1;

                $child->save();

                CategoryRepository::resetHierarchy($child->id, $child->parent_id);
            }
        }
    }

}