@extends('frontend.layouts.app')
@section('content')
    <!-- BREADCRUMB -->
    <div id="breadcrumb" class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12">
                    <ul class="breadcrumb-tree">
                        <li><a href="{{\Illuminate\Support\Facades\URL::to('/')}}">Trang chủ</a></li>
                        <li><a href="#" class="active">Tất cả sản phẩm</a></li>
                    </ul>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /BREADCRUMB -->

    <!-- SECTION -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- ASIDE -->
                <div id="aside" class="col-md-3">
                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Danh mục sản phẩm</h3>
                        <div class="checkbox-filter">
                            @foreach($category as $item)
                                @if(count($item->products)>0)
                                    <div class="input-checkbox">
                                        <input type="checkbox" id="category_{{$item->id}}">
                                        <label for="category_{{$item->id}}">
                                            <span></span>
                                            {{$item->category_name}}
                                            <small>({{count($item->products)}})</small>
                                        </label>
                                    </div>
                                @endif
                            @endforeach
                        </div>
                    </div>
                    <!-- /aside Widget -->
                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Top Selling</h3>
                        @foreach($sell as $item)
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="{{asset($item->image)}}" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">{{$item->category->category_name}}</p>
                                    <h3 class="product-name"><a
                                            href="#">{{\Illuminate\Support\Str::limit($item->name,30)}}</a></h3>
                                    <h4 class="product-price">{{number_format($item->unit_prices, 0, '.', ',') . ' VND'}}
                                        <del class="product-old-price">$990.00</del>
                                    </h4>
                                </div>
                            </div>
                        @endforeach

                    </div>
                    <!-- /aside Widget -->
                </div>
                <!-- /ASIDE -->

                <!-- STORE -->
                <div id="store" class="col-md-9">
                    <!-- store products -->
                    <div class="row">
                        @foreach($product as $item)
                            <!-- product -->
                            <div class="col-md-4 col-xs-6">
                                <div class="product">
                                    <div class="product-img">
                                        <img src="{{$item->image}}" alt="">
                                        <div class="product-label">
                                            <span class="sale">-30%</span>
                                            <span class="new">NEW</span>
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">{{$item->category->category_name}}</p>
                                        <h3 class="product-name"><a href="#">{{$item->name}}</a></h3>
                                        <h4 class="product-price">{{ number_format($item->unit_prices, 0, '.', ',') . ' VND'}}
                                            <del class="product-old-price">$990.00</del>
                                        </h4>
                                        <div class="product-btns">
                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
                                                    class="tooltipp">add to wishlist</span></button>
                                            <button class="quick-view"
                                                    onclick="redirectToDetailPage({{ $item->id }})">
                                                <i class="fa fa-eye"></i>
                                                <span class="tooltipp">Chi tiết</span>
                                            </button>
                                            <script>
                                                function redirectToDetailPage(productId) {
                                                    window.location.href = 'details_product/' + productId;
                                                }
                                            </script>
                                        </div>
                                    </div>
                                    <div class="add-to-cart">
                                        <input type="hidden" name="quantity" id="quantity" value="1">
                                        <button class="add-to-cart-btn"
                                                onclick="addToCart_{{$item->id}}({{ $item->id }})">
                                            <i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng
                                        </button>
                                    </div>
                                    <script>
                                        function addToCart_{{$item->id}}(productId) {
                                            var quantity = document.getElementById('quantity').value;
                                            $.ajax({
                                                url: '{{ route('cart.add', $item->id) }}',
                                                type: 'POST',
                                                data: {
                                                    _token: '{{ csrf_token() }}',
                                                    quantity: quantity
                                                },
                                                success: function (response) {
                                                    console.log(response);
                                                    alert('Sản phẩm đã được thêm vào giỏ hàng');
                                                    location.reload();
                                                },
                                                error: function (xhr) {
                                                    console.error(xhr.responseText);
                                                    alert('Đã xảy ra lỗi khi thêm sản phẩm vào giỏ hàng');
                                                }
                                            });
                                        }
                                    </script>

                                </div>
                            </div>
                            <!-- /product -->
                        @endforeach
                    </div>
                    <!-- /store products -->
                    <!-- Hiển thị các nút phân trang -->
                    {{ $product->links() }}
                    <style>
                        ul.pagination {
                            list-style-type: none;
                            margin: 0;
                            padding: 0;
                        }

                        ul.pagination li {
                            display: inline;
                        }

                        ul.pagination li a {
                            color: black;
                            float: left;
                            padding: 8px 16px;
                            text-decoration: none;
                            transition: background-color .3s;
                        }

                        ul.pagination li.active {
                            background-color: #4CAF50;
                        }

                        ul.pagination li a:hover:not(.active) {
                            background-color: #ddd;
                        }

                    </style>
                </div>
                <!-- /STORE -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /SECTION -->
@endsection
