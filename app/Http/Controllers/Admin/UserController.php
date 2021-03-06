<?php

namespace App\Http\Controllers\Admin;

use App\Repositories\RoleRepository;
use App\Repositories\UserRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class UserController extends AdminController
{
    public function __construct(Request $request)
    {
        parent::__construct($request);

        $this->_pushBreadCrumbs('Danh sách nhân viên', route('admin.users.index'));
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(UserRepository $user, RoleRepository $role)
    {
        if ($this->_request->ajax()) {
            return $user->dataTable($this->_request);
        }

        $this->_data['title'] = 'Danh sách nhân viên';
        $this->_data['roles'] = $role->all();

        return view('admin.users.index', $this->_data);
    }

    public function view(UserRepository $user, RoleRepository $role)
    {
        $id = $this->_request->get('id');
        $this->_data['title'] = 'Thêm nhân viên';
        if ($id) {
            $this->_data['title'] = 'Sửa thông tin nhân viên';
            $this->_data['data'] = $user->getUser($id);
        }

        $this->_data['roles'] = $role->all();

        $this->_pushBreadCrumbs($this->_data['title']);
        return view('admin.users.view', $this->_data);
    }

    public function store(UserRepository $user)
    {
        $input = $this->_request->all();
        $id = $input['id'] ?? null;
        $rules = [
            'full_name' => 'required|string|max:100',
            'email' => 'required|email|max:100|unique:users',
            'password' => 'required|min:3|confirmed',
            'password_confirmation' => 'required|min:3',
            'role_id' => 'required',
            'active' => 'required'
        ];
        $message = 'Nhân viên có email '.$input['email'].' đã được tạo.';

        if ($id) {
            $rules['email'] = 'required|email|max:100|unique:users,email,' . $input['id'];
            $message = 'Thông tin nhân viên '.$input['email'].' đã được cập nhật.';
        }

        if ($id && $id == Auth::id()) {
            return redirect()->back()
                ->withErrors(['Không thể tự sửa thông tin của chính bạn!'])
                ->withInput();
        }

        $validator = Validator::make($input, $rules, [
            'full_name.required' => 'Vui lòng tên của bạn.',
            'email.required' => 'Vui lòng nhập email.',
            'email.unique' => 'Email '.$input['email'].' này đã được sử dụng!',
            'password.required' => 'Vui lòng nhập password cho tài khoản này!',
            'password_confirmation' => 'Mật khẩu xác nhận không chính xác!'
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
        $data = $user->createOrUpdate($input, $id);

        if($input['action'] === 'save') {
            return redirect()->route('admin.users.view', ['id' => $data->id])->withSuccess($message);
        }
        return redirect()->route('admin.users.index')->withSuccess($message);
    }

    public function delete(UserRepository $user)
    {
        $ids = $this->_request->get('ids');
        $result = $user->delete($ids);

        return response()->json($result);
    }

    public function changeStatus(UserRepository $user)
    {
        $userID = $this->_request->get('id');
        $status = $this->_request->get('status');
        $status = filter_var($status, FILTER_VALIDATE_BOOLEAN);
        $user->changeStatus($userID, $status);

        return response()->json([
            'success' => true
        ]);
    }
}
