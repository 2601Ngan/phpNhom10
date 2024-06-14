<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
<script src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
@extends('backend.layouts.app')
@section('content')
    <script>
        @if(session('toast_success'))
        Toastify({
            text: "{{ session('toast_success') }}",
            duration: 5000,
            gravity: "top", // Vị trí hiển thị: top, bottom, left, right
            backgroundColor: "linear-gradient(to right, #00b09b, #96c93d)"
        }).showToast();
        @elseif(session('toast_error'))
        Toastify({
            text: "{{ session('toast_error') }}",
            duration: 5000,
            gravity: "top",
            backgroundColor: "linear-gradient(to right, #ff416c, #ff4b2b)"
        }).showToast();
        @endif
    </script>
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Danh sách tài khoản</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{route('admin')}}">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Tài khoản người dùng</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header d-flex">
                            <h3 class="card-title flex-grow-1">
                            </h3>
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-secondary ml-auto mx-4" data-toggle="modal"
                                    data-target="#addUserModal">
                                <i class="fas fa-plus"></i> Thêm tài khoản
                            </button>
                            <!-- Modal Thêm danh mục mới -->
                            <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog"
                                 aria-labelledby="addUserModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="addUserModalLabel">Thêm tài khoản mới</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="{{ route('user.store') }}" method="POST">
                                                @csrf
                                                <div class="form-group">
                                                    <label for="userName">Họ tên</label>
                                                    <input type="text" class="form-control" id="userName"
                                                           placeholder="Nhập họ và tên"
                                                           name="username" autocomplete="off">
                                                </div>
                                                <div class="form-group">
                                                    <label for="email">Địa chỉ email</label>
                                                    <input type="email" class="form-control" id="email"
                                                           placeholder="Nhập địa chỉ email" autocomplete="off"
                                                           name="email">
                                                </div>
                                                <div class="form-group">
                                                    <label for="password">Mật khẩu</label>
                                                    <input type="password" class="form-control" id="password"
                                                           placeholder="Nhập mật khẩu" autocomplete="off"
                                                           name="password">
                                                    <small id="passwordError" class="text-danger"
                                                           style="display: none;">Mật khẩu phải có ít nhất 8 ký
                                                        tự.</small>
                                                </div>
                                                <script>
                                                    document.getElementById("password").addEventListener("input", function () {
                                                        var passwordInput = document.getElementById("password");
                                                        var passwordError = document.getElementById("passwordError");

                                                        if (passwordInput.value.length >= 8) {
                                                            passwordInput.classList.remove("is-invalid");
                                                            passwordError.style.display = "none";
                                                        } else {
                                                            passwordInput.classList.add("is-invalid");
                                                            passwordError.style.display = "block";
                                                        }
                                                    });
                                                </script>

                                                <div class="form-group">
                                                    <label for="role">Phân quyền</label>
                                                    <select class="form-control" id="role"
                                                            name="role_name" required>
                                                        <option value="">Chọn quyền hạn</option>
                                                        <option value="admin">Quản trị viên</option>
                                                        <option value="customer">Khách</option>
                                                    </select>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                            data-dismiss="modal">Đóng
                                                    </button>
                                                    <button type="submit" class="btn btn-primary">Lưu</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Họ tên</th>
                                    <th>Quyền hạn</th>
                                    <th>Email</th>
                                    <th>Trạng thái</th>
                                    <th>Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($user as $item)
                                    <tr>
                                        <td>{{$item->id}}</td>
                                        <td>{{$item->name}}</td>
                                        @if($item->role==='admin')
                                            <td class="text-lightblue"><strong>Quản trị viên</strong></td>
                                        @elseif($item->role==='customer')
                                            <td class="text-lightblue"><strong>Khách hàng</strong></td>
                                        @endif
                                        <td>{{$item->email}}</td>
                                        @if($item->status=='active')
                                            <td class="text-success"><strong> <i class="fas fa-dot-circle"></i> Đang
                                                    hoạt động</strong></td>
                                        @else
                                            <td class="text-danger"><strong><i class="fas fa-dot-circle"></i> Ngưng hoạt
                                                    động</strong></td>
                                        @endif
                                        <td>
                                            <a class="mx-2 btn btn-warning"
                                               href="{{ route('user.edit', ['id' => $item->id]) }}"><i
                                                    class="fas fa-edit"></i></a>
                                            <button type="button" class="mx-2 btn btn-danger" data-toggle="modal"
                                                    data-target="#deleteModal{{ $item->id }}">
                                                <i class="fas fa-trash-alt"></i>
                                            </button>
                                        </td>
                                        <div class="modal fade" id="deleteModal{{ $item->id }}" tabindex="-1"
                                             role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa người
                                                            dùng</h5>
                                                        <button type="button" class="close" data-dismiss="modal"
                                                                aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        Bạn có chắc chắn muốn xóa người dùng này không?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary"
                                                                data-dismiss="modal">Hủy
                                                        </button>
                                                        <form action="{{ route('user.delete', ['id' => $item->id]) }}"
                                                              method="POST">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit" class="btn btn-danger">Xóa</button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </tr>
                                @endforeach
                                </tbody>
                            </table>
                        </div>
                        <!-- /.card-body -->
                    </div>
                    <!-- /.card -->
                </div>
                <!-- /.col -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
@endsection
