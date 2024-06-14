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
                        <li class="breadcrumb-item active">Sản phẩm</li>
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
                                    data-target="#addCategoryModal">
                                <i class="fas fa-plus"></i> Thêm sản phẩm
                            </button>
                            <!-- Modal Thêm danh mục mới -->
                            <div class="modal fade" id="addCategoryModal" tabindex="-1" role="dialog"
                                 aria-labelledby="addCategoryModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="addCategoryModalLabel">Thêm sản phẩm mới</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="{{ route('product.store') }}" method="POST"
                                                  enctype="multipart/form-data">
                                                @csrf
                                                <div class="form-group">
                                                    <label for="productName">Tên sản phẩm</label>
                                                    <input type="text" class="form-control" id="productName"
                                                           placeholder="Nhập tên sản phẩm mới" name="name">
                                                </div>
                                                <div class="form-group">
                                                    <label for="category">Danh mục</label>
                                                    <select class="form-control" id="category" name="id_category">
                                                        @foreach($category as $cat)
                                                            <option
                                                                    value="{{ $cat->id }}">{{ $cat->category_name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label for="productImage">Hình ảnh</label>
                                                    <input type="file" class="form-control-file" id="productImage"
                                                           name="image">
                                                </div>
                                                <div class="form-group">
                                                    <label for="productInfo">Thông tin</label>
                                                    <textarea class="form-control ckeditor" id="productInfo" rows="3"
                                                              name="info"></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <label for="productDescription">Mô tả</label>
                                                    <textarea class="form-control ckeditor" id="productDescription"
                                                              rows="3" name="des"></textarea>
                                                </div>
                                                <!-- Plugin CKEditor -->
                                                <script
                                                        src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
                                                <script>
                                                    document.addEventListener("DOMContentLoaded", function () {
                                                        var textareas = document.querySelectorAll('.ckeditor');
                                                        textareas.forEach(function (textarea) {
                                                            ClassicEditor
                                                                .create(textarea)
                                                                .catch(error => {
                                                                    console.error(error);
                                                                });
                                                        });
                                                    });
                                                </script>

                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="productQuantity">Số lượng</label>
                                                            <input type="number" class="form-control"
                                                                   id="productQuantity" name="quantity">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="productUnitPrice">Đơn giá (VNĐ)</label>
                                                            <input type="number" class="form-control"
                                                                   id="productUnitPrice" name="unit_prices"
                                                                   placeholder="Nhập đơn giá" min="1000">
                                                        </div>
                                                    </div>
                                                    <script>
                                                        document.addEventListener("DOMContentLoaded", function () {
                                                            var input = document.getElementById('productUnitPrice');
                                                            input.addEventListener('change', function (e) {
                                                                var value = parseFloat(e.target.value);
                                                                if (value < 1000 || isNaN(value)) {
                                                                    e.target.value = 1000;
                                                                }
                                                            });
                                                        });
                                                    </script>
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
                                    <th>Tên sản phẩm</th>
                                    <th>Hình ảnh</th>
                                    <th>Đơn giá</th>
                                    <th>Số lượng</th>
                                    <th>Ngày tạo</th>
                                    <th>Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($product as $item)
                                    <tr>
                                        <td class="text-bold">{{ \Illuminate\Support\Str::limit($item->name, 50) }}</td>
                                        <td>
                                            @if($item->image)
                                                <img src="{{ asset($item->image) }}" alt="Product Image"
                                                     style="max-width: 100px; max-height: 50px; border-radius:5px">
                                            @else
                                                Chưa cập nhật
                                            @endif
                                        </td>
                                        <td>{{ number_format($item->unit_prices, 0, ',', '.') }} đ</td>
                                        <td>{{ $item->quantity }} </td>
                                        <td>{{ $item->created_at->format('d/m/Y H:i:s') }}</td>
                                        <td>
                                            <!-- Button mở modal -->
                                            <button type="button" class="mx-2 btn btn-warning" data-toggle="modal"
                                                    data-target="#update{{$item->id}}">
                                                <i class="fas fa-edit"></i></button>
                                            <!-- Modal -->
                                            <div class="modal fade" id="update{{$item->id}}" tabindex="-1" role="dialog"
                                                 aria-labelledby="updateCategoryModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-lg" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="update{{$item->id}}">Cập
                                                                nhật danh mục</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <form action="{{ route('product.update', $item->id) }}"
                                                                  method="POST" enctype="multipart/form-data">
                                                                @csrf
                                                                @method('PUT')
                                                                <div class="form-group">
                                                                    <label for="productName">Tên sản phẩm</label>
                                                                    <input type="text" class="form-control"
                                                                           id="productName" value="{{$item->name}}"
                                                                           placeholder="Nhập tên sản phẩm mới"
                                                                           name="name">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="category">Danh mục</label>
                                                                    <select class="form-control" id="category"
                                                                            name="id_category">
                                                                        <option>Chọn danh mục sản phẩm</option>
                                                                        @foreach($category as $cat)
                                                                            <option value="{{$cat->id }}"
                                                                                    @if($item->id_category === $cat->id) selected
                                                                                    @endif>{{ $cat->category_name }}</option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="productImage">Hình ảnh</label>
                                                                    @if($item->image)
                                                                        <img src="{{ asset($item->image) }}"
                                                                             alt="Product Image"
                                                                             style="max-width: 150px; max-height: 100px;">
                                                                    @endif
                                                                    <input type="file" class="form-control-file"
                                                                           id="productImage" name="image">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="productInfo">Thông tin</label>
                                                                    <textarea class="form-control ckeditor"
                                                                              value="{{$item->info}}"
                                                                              id="productInfo_update" rows="3"
                                                                              name="info">{!! $item->info !!}</textarea>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="productDescription_update">Mô tả</label>
                                                                    <textarea class="form-control ckeditor"
                                                                              id="productDescription"
                                                                              value="{{$item->des}}"
                                                                              rows="3"
                                                                              name="des">{!! $item->des !!}</textarea>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <label for="productQuantity">Số
                                                                                lượng</label>
                                                                            <input type="number" class="form-control"
                                                                                   value="{{$item->quantity}}"
                                                                                   id="productQuantity" name="quantity">
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="form-group">
                                                                            <label for="productUnitPrice">Đơn giá
                                                                                (VNĐ)</label>
                                                                            <input type="number" class="form-control"
                                                                                   id="productUnitPrice"
                                                                                   name="unit_prices"
                                                                                   value="{{$item->unit_prices}}"
                                                                                   placeholder="Nhập đơn giá"
                                                                                   min="1000">
                                                                        </div>
                                                                    </div>
                                                                    <script>
                                                                        document.addEventListener("DOMContentLoaded", function () {
                                                                            var input = document.getElementById('productUnitPrice');
                                                                            input.addEventListener('change', function (e) {
                                                                                var value = parseFloat(e.target.value);
                                                                                if (value < 1000 || isNaN(value)) {
                                                                                    e.target.value = 1000;
                                                                                }
                                                                            });
                                                                        });
                                                                    </script>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-secondary"
                                                                            data-dismiss="modal">Đóng
                                                                    </button>
                                                                    <button type="submit" class="btn btn-primary">Lưu
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
                                                                sản phẩm</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            Bạn có chắc chắn muốn xóa sản phẩm này không?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                    data-dismiss="modal">Hủy
                                                            </button>
                                                            <form
                                                                    action="{{ route('product.delete', ['id' => $item->id]) }}"
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
