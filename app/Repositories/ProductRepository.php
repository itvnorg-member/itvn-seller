<?php
/**
 * Created by PhpStorm.
 * User: Dinh Thien Phuoc
 * Date: 7/26/2018
 * Time: 12:04 AM
 */

namespace App\Repositories;

use App\Models\Product;
use Illuminate\Support\Facades\Cache;
use Yajra\DataTables\Facades\DataTables;
use App\Libraries\Photo;
use Illuminate\Support\Facades\Storage;

Class ProductRepository
{
	const CACHE_NAME_PRODUCTS = 'products';

	public function dataTable($request)
	{
		$products = Product::select(['products.id', 'products.photo', 'products.code','products.name', 'products.active', 'products.created_at']);

		$dataTable = DataTables::eloquent($products)
		->filter(function ($query) use ($request) {
			if (trim($request->get('status')) !== "") {
				$query->where('products.active', $request->get('status'));
			}

			if (trim($request->get('keyword')) !== "") {
				$query->where(function ($sub) use ($request) {
					$sub->where('products.name', 'like', '%' . $request->get('keyword') . '%');
				});

			}
		}, true)
		->addColumn('action', function ($product) {
			$html = '';
			$html .= '<a href="' . route('admin.products.view', ['id' => $product->id]) . '" class="btn btn-xs btn-primary" style="margin-right: 5px"><i class="glyphicon glyphicon-edit"></i> Sửa</a>';
			$html .= '<a href="#" class="bt-delete btn btn-xs btn-danger" data-id="' . $product->id . '" data-name="' . $product->name . '">';
			$html .= '<i class="fa fa-trash-o" aria-hidden="true"></i> Xóa</a>';
			return $html;
		})
        ->addColumn('status', function ($product) {
            $active = '';
            $disable = '';
            if ($product->active === ACTIVE) {
                $active  = 'checked';
            }
            $html = '<input type="checkbox" '.$disable.' data-name="'.$product->name.'" data-id="'.$product->id.'" name="social' . $product->active . '" class="js-switch" value="' . $product->active . '" ' . $active . ' ./>';
            return $html;
        })
		->addColumn('photo', function ($product) {
                if ($product->photo) {
                    $html = '<img style="width: 80px; height: 60px;" class="img-thumbnail" src="' . asset('storage/' . $product->photo). '" />';
                } else {
                    $html = ' <img alt="No Photo" style="width: 80px; height: 60px;" class="img-thumbnail" src="'.asset(NO_PHOTO).'" >';
                }
                return $html;
            })
		->rawColumns(['photo', 'status', 'action'])
		->toJson();

		return $dataTable;
	}

	public function getProduct($id)
	{
		$data = Product::find($id);
		return $data;
	}

	public function createOrUpdate($data, $id = null)
	{
		if ($id) {
			$model = Product::find($id);
		} else {
			$model = new Product;
		}
		
		$model->name = $data['name'];
		$model->active = $data['active']; 
		$model->order = $data['order'];
		$model->description = $data['description'];
		if(isset($data['photo'])) {

            if ($model->photo) {
                Storage::delete($model->photo);
            }
            $upload = new Photo($data['photo']);
            $model->photo = $upload->uploadTo('products');
            $model->code = "";
        }else{
        	$model->code = $data['code'];
        	$model->photo = "";
        }

		$model->save();

		return $model;
	}

	public function delete($ids)
	{
		$result = [
			'success' => true,
			'errors' => []
		];
		foreach ($ids as $id) {
			$product = Product::find($id);
			if ($product === null) {
				$result['errors'][] = 'ID sản phẩm: ' . $id . ' không tồn tại';
				$result['success'] = false;
				continue;
			}
			if ($product->photo) {
                Storage::delete($user->photo);
            }
			$product->delete();
		}

		return $result;
	}

    public function changeStatus($productID, $status)
    {
        $model = Product::find($productID);
        $model->active = $status;
        return $model->save();
    }
}