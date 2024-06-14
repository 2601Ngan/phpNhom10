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
                    <h1>Cập nhật tài khoản</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{route('admin')}}">Trang chủ</a></li>
                        <li class="breadcrumb-item"><a href="{{route('user.index')}}">Tài khoản</a></li>
                        <li class="breadcrumb-item active">Cập nhật tài khoản</li>
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
                        </div>
                        <div class="card-body">
                            <form action="{{ route('user.update', ['id' => $user->id]) }}" method="POST"
                                  enctype="multipart/form-data">
                                @csrf
                                @method('PUT')
                                <input type="hidden" name="user_id" value="{{ $user->id }}">
                                <div class="form-group">
                                    <div class="form-group">
                                        <label for="userName">Họ tên</label>
                                        <input type="text" class="form-control" id="userName"
                                               placeholder="Nhập họ và tên" value="{{$user->name}}"
                                               name="username">
                                    </div>
{{--                                    <div class="form-group">--}}
{{--                                        <label for="address">Địa chỉ</label>--}}
{{--                                        <input type="text" class="form-control" id="address"--}}
{{--                                               placeholder="Nhập địa chỉ" value="{{$user->address}}"--}}
{{--                                               name="address">--}}
{{--                                    </div>--}}
{{--                                    <div class="form-group">--}}
{{--                                        <label for="phoneNumInput">Số điện thoại</label>--}}
{{--                                        <input type="text" class="form-control" id="phoneNumInput"--}}
{{--                                               placeholder="Nhập số điện thoại" value="{{$user->phone_num}}"--}}
{{--                                               name="phone_num">--}}
{{--                                        <small id="phoneNumError" class="text-danger" style="display: none;">Số điện--}}
{{--                                            thoại không hợp lệ.</small>--}}
{{--                                    </div>--}}

{{--                                    <script>--}}
{{--                                        document.getElementById("phoneNumInput").addEventListener("input", function () {--}}
{{--                                            var phoneNumInput = document.getElementById("phoneNumInput");--}}
{{--                                            var phoneNumError = document.getElementById("phoneNumError");--}}

{{--                                            if (phoneNumInput.value.length === 10 && /^\d+$/.test(phoneNumInput.value)) {--}}
{{--                                                phoneNumInput.classList.remove("is-invalid");--}}
{{--                                                phoneNumError.style.display = "none";--}}
{{--                                            } else {--}}
{{--                                                phoneNumInput.classList.add("is-invalid");--}}
{{--                                                phoneNumError.style.display = "block";--}}
{{--                                            }--}}
{{--                                        });--}}
{{--                                    </script>--}}

                                    <div class="form-group">
                                        <label for="email">Địa chỉ email</label>
                                        <input type="email" class="form-control" id="email"
                                               placeholder="Nhập địa chỉ email" value="{{$user->email}}"
                                               name="email">
                                    </div>
                                    <div class="form-group">
                                        <label for="status">Trạng thái</label>
                                        <select class="form-control" id="status"
                                                name="status" required>
                                            <option value="">Chọn trạng thái</option>
                                            @if($user->status==='active')
                                                <option value="active" selected>Hoạt động</option>
                                                <option value="inactive">Ngưng hoạt động</option>
                                            @else
                                                <option value="active">Hoạt động</option>
                                                <option value="inactive" selected>Ngưng hoạt động</option>
                                            @endif

                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="role">Phân quyền</label>
                                        <select class="form-control" id="role"
                                                name="role_name" required>
                                            @if($user->role=='admin')
                                                <option value="">Chọn quyền hạn</option>
                                                <option value="admin" selected>Quản trị viên</option>
                                                <option value="customer">Khách</option>
                                            @else
                                                <option value="">Chọn quyền hạn</option>
                                                <option value="admin">Quản trị viên</option>
                                                <option value="customer" selected>Khách</option>
                                            @endif
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                                </div>
                            </form>
                        </div>
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
