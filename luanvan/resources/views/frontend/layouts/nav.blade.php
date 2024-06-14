<!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
                <li><a href="#"><i class="fa fa-envelope-o"></i> email@email.com</a></li>
                <li><a href="#"><i class="fa fa-map-marker"></i> 1734 Stonecoal Road</a></li>
            </ul>
            <ul class="header-links pull-right">
                <li><a href="#"><i class="fa fa-dollar"></i> VND</a></li>
            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->
    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="#" class="logo">
                            <img src="{{asset('guest/img/logo.png')}}" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form action="{{route('search')}}" method="POST">
                            @csrf
                            <select class="input-select">
                                <option value="all">Tất cả</option>
                            </select>
                            <input class="input" placeholder="Nhập từ khóa" name="key">
                            <button class="search-btn" type="submit">Tìm kiếm</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Wishlist -->
                        <div>
                            <a href="#">
                                <i class="fa fa-heart-o"></i>
                                <span>Yêu thích</span>
                                <div class="qty">2</div>
                            </a>
                        </div>
                        <!-- /Wishlist -->
                        @if(\Illuminate\Support\Facades\Session::get('cart'))
                            <!-- Cart -->
                            <div class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                    <i class="fa fa-shopping-cart"></i>
                                    <span>Giỏ hàng</span>
                                    <div class="qty">{{$count}}</div>
                                </a>
                                <div class="cart-dropdown">
                                    <div class="cart-list">
                                        @foreach($cart as $item)
                                            <div class="product-widget">
                                                <div class="product-img">
                                                    <img src="{{ asset($item['image']) }}" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a
                                                            href="#">{{\Illuminate\Support\Str::limit($item['name'],30) }}</a>
                                                    </h3>
                                                    <h4 class="product-price">
                                                        <span class="qty">{{$item['quantity']}}x</span>
                                                        {{  number_format($item['price'], 0, '.', ',') . ' VND'}}
                                                    </h4>
                                                </div>
                                                <form action="{{ route('cart.remove', $item['id']) }}" method="POST">
                                                    @csrf
                                                    <button class="delete"><i class="fa fa-close"></i></button>
                                                </form>
                                            </div>
                                        @endforeach

                                    </div>
                                    <div class="cart-summary">
                                        <small>{{ count($cart) }} sản phẩm</small>
                                        <h5>Tổng: {{  number_format($total, 0, '.', ',') . ' VND'}}</h5>
                                    </div>
                                    <div class="cart-btns">
                                        <a href="{{\Illuminate\Support\Facades\URL::to('/checkout')}}">Thanh toán <i
                                                class="fa fa-arrow-circle-right"></i></a>
                                    </div>
                                </div>

                            </div>
                            <!-- /Cart -->
                    </div>

                </div>
                <!-- /Cart -->
                <script>
                    // Xử lý sự kiện xóa sản phẩm
                    document.querySelectorAll('.delete').forEach(button => {
                        button.addEventListener('click', function () {
                            if (confirm('Bạn có chắc muốn xóa sản phẩm này khỏi giỏ hàng không?')) {
                                const form = this.parentNode;
                                fetch(form.action, {
                                    method: 'POST',
                                    headers: {
                                        'Content-Type': 'application/json',
                                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                                    }
                                })
                                    .then(response => response.json())
                                    .then(data => {

                                    })
                                    .catch(error => {
                                        console.error('Error:', error);
                                    });
                            }
                        });
                    });
                </script>
                @endif
            </div>
        </div>
        <!-- /ACCOUNT -->
    </div>
</header>
<!-- /HEADER -->
<!-- NAVIGATION -->
<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav">
                <li class="active"><a href="{{\Illuminate\Support\Facades\URL::to('/')}}">Trang chủ</a></li>
                <li><a href="{{\Illuminate\Support\Facades\URL::to('products')}}">Sản phẩm</a></li>
                <li><a href="#">Bài viết</a></li>
                <li><a href="#">Liên hệ</a></li>
            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!-- /NAVIGATION -->
