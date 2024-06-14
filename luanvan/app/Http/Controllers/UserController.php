<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $user = User::all();
        return view('backend/page/user/index', compact('user'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $userData = [
            'name' => $request->input('username'),
            'email' => $request->input('email'),
            'password' => Hash::make($request->input('password')),
            'role' => $request->input('role_name')
        ];
        $existingUser = User::where('email', $userData['email'])->first();
        if ($existingUser) {
            return redirect()->back()->with('toast_error', 'Địa chỉ email đã được sử dụng');
        }
        $user = User::create($userData);
        if ($user) {
            return redirect()->back()->with('toast_success', 'Tạo tài khoản thành công');
        } else {
            return redirect()->back()->with('toast_error', 'Tạo tài khoản thất bại');
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $user = User::find($id);
        if ($user) {
            return view('backend/page/user/edit', compact('user'));
        } else {
            return back()->with('error', 'Fails');
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $user = User::findOrFail($id);
        $user->name = $request->input('username');
        $user->email = $request->input('email');
        $user->role = $request->input('role_name');
        $user->status = $request->input('status');
        $user->save();
        return redirect()->route('user.index')->with('toast_success', 'Thông tin người dùng đã được cập nhật thành công.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $user = User::findOrFail($id);
        if ($user->role === 'admin') {
            return redirect()->back()->with('toast_error', 'Bạn không thể xóa người dùng quản trị viên.');
        }
        $user->delete();
        return redirect()->route('user.index')->with('toast_success', 'Người dùng đã được xóa thành công.');
    }
}
