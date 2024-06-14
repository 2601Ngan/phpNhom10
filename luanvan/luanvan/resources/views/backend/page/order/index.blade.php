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
                    <h1>Danh sách danh mục</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="{{route('admin')}}">Trang chủ</a></li>
                        <li class="breadcrumb-item active">Đơn hàng</li>
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
                            {{--                            <button type="button" class="btn btn-secondary ml-auto mx-4" data-toggle="modal"--}}
                            {{--                                    data-target="#addCategoryModal">--}}
                            {{--                                <i class="fas fa-plus"></i> Thêm danh mục--}}
                            {{--                            </button>--}}
                            <!-- Modal Thêm danh mục mới -->
                            <div class="modal fade" id="addCategoryModal" tabindex="-1" role="dialog"
                                 aria-labelledby="addCategoryModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="addCategoryModalLabel">Thêm đơn hàng mới</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="{{ route('order.store') }}" method="POST">
                                                @csrf
                                                <div class="form-group">
                                                    <label for="categoryName">Tên danh mục</label>
                                                    <input type="text" class="form-control" id="categoryName"
                                                           placeholder="Nhập tên danh mục mới"
                                                           name="categoryName">
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
                                    <th>Mã đơn hàng</th>
                                    <th>Khách hàng</th>
                                    <th>Email</th>
                                    <th>Tổng đơn hàng</th>
                                    <th>Trạng thái</th>
                                    <th>Thanh toán</th>
                                    <th>Ngày tạo</th>
                                    <th>Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($order as $item)
                                    <tr>
                                        <td>{{$item->code}}</td>
                                        <td>{{$item->customer}}</td>
                                        <td>{{$item->email}}</td>
                                        <td> {{number_format($item->total, 0, '.', ',') . ' đ'}}</td>
                                        <td>
                                            @if($item->status=='ordered')
                                                <strong class="text-secondary"> Chờ xác nhận</strong>
                                            @elseif($item->status=='confirmed')
                                                <strong class="text-warning"> Đã xác nhận</strong>
                                            @elseif($item->status=='completed')
                                                <strong class="text-success">Hoàn thành</strong>
                                            @endif
                                        </td>
                                        <td>{{$item->payment_status}}</td>
                                        <td>{{ $item->created_at->format('d/m/Y') }}</td>
                                        <td>
                                            <!-- Button mở modal -->
                                            <button type="button" class="mx-2 btn btn-warning" data-toggle="modal"
                                                    data-target="#update{{$item->id}}">
                                                <i class="fas fa-edit"></i></button>
                                            <!-- Modal -->
                                            <div class="modal fade" id="update{{$item->id}}" tabindex="-1" role="dialog"
                                                 aria-labelledby="updateCategoryModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="update{{$item->id}}">Cập
                                                                nhật trạng thái đơn hàng</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <!-- Form cập nhật danh mục -->
                                                            <form action="{{ route('order.update', $item->id) }}"
                                                                  method="POST">
                                                                @csrf
                                                                @method('PUT')
                                                                <div class="form-group">
                                                                    <label for="updatedCategoryName">Cập nhật đơn
                                                                        hàng</label>
                                                                    <select name="status" class="form-control">
                                                                        <option value="ordered">Chờ xác nhận</option>
                                                                        <option value="confirmed">Đã xác nhận</option>
                                                                        <option value="completed">Hoàn thành</option>
                                                                    </select>
                                                                </div>
                                                                <!-- Button đóng modal -->
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary"
                                                                            data-dismiss="modal">Đóng
                                                                    </button>
                                                                    <!-- Button gửi form -->
                                                                    <button type="submit" class="btn btn-primary">Cập
                                                                        nhật
                                                                    </button>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Delete -->
                                            <button type="button" class="mx-2 btn btn-danger" data-toggle="modal"
                                                    data-target="#deleteModal{{ $item->id }}">
                                                <i class="fas fa-trash-alt"></i>
                                            </button>
                                            <div class="modal fade" id="deleteModal{{ $item->id }}" tabindex="-1"
                                                 role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa
                                                                danh mục</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            Bạn có chắc chắn muốn xóa danh mục này không?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                    data-dismiss="modal">Hủy
                                                            </button>
                                                            <form
                                                                action="{{ route('category.delete', ['id' => $item->id]) }}"
                                                                method="POST">
                                                                @csrf
                                                                @method('DELETE')
                                                                <button type="submit" class="btn btn-danger">Xóa
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
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
