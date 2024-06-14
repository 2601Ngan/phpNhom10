@extends('frontend.layouts.app')
@section('content')
    <!-- BREADCRUMB -->
    <div id="breadcrumb" class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12">
                    <h3 class="breadcrumb-header">Đặt hàng</h3>
                    <ul class="breadcrumb-tree">
                        <li><a href="#">Trang chủ</a></li>
                        <li class="active">Thanh toán đơn hàng</li>
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
                <form action="{{route('ordered')}}" method="post">
                    @csrf
                    <div class="col-md-7">
                        <!-- Billing Details -->
                        <div class="billing-details">
                            <div class="section-title">
                                <h3 class="title">Thông tin đơn hàng</h3>
                            </div>
                            <div class="form-group">
                                <input class="input {{ $errors->has('first_name') ? 'is-invalid' : '' }}" type="text"
                                       name="first_name" placeholder="Họ" value="{{ old('first_name') }}">
                                @if ($errors->has('first_name'))
                                    <span class="invalid-feedback" role="alert">
                                    <small class="text-danger">{{ $errors->first('first_name') }}</small>
                                </span>
                                @endif
                            </div>
                            <div class="form-group">
                                <input class="input {{ $errors->has('last_name') ? 'is-invalid' : '' }}" type="text"
                                       name="last_name" placeholder="Tên" value="{{ old('last_name') }}">
                                @if ($errors->has('last_name'))
                                    <span class="invalid-feedback" role="alert">
                                    <small class="text-danger">{{ $errors->first('last_name') }}</small>
                                </span>
                                @endif
                            </div>
                            <div class="form-group">
                                <input class="input {{ $errors->has('email') ? 'is-invalid' : '' }}" type="email"
                                       name="email" placeholder="Địa chỉ email" value="{{ old('email') }}">
                                @if ($errors->has('email'))
                                    <span class="invalid-feedback" role="alert">
                                    <small class="text-danger">{{ $errors->first('email') }}</small>
                                </span>
                                @endif
                            </div>
                            <div class="form-group">
                                <input class="input {{ $errors->has('address') ? 'is-invalid' : '' }}" type="text"
                                       name="address" placeholder="Địa chỉ giao hàng" value="{{ old('address') }}">
                                @if ($errors->has('address'))
                                    <span class="invalid-feedback" role="alert">
                                    <small class="text-danger">{{ $errors->first('address') }}</small>
                                </span>
                                @endif
                            </div>
                            <div class="form-group">
                                <input class="input" id="tel-input" type="tel" name="tel"
                                       placeholder="Số điện thoại nhận hàng" value="{{ old('tel') }}">
                                <span id="tel-error" class="invalid-feedback" style="display: none;" role="alert">
                                    <small class="text-danger">Số điện thoại không hợp lệ - Vui lòng nhập đúng định dạng 09xxxx hoặc 03xxxx</small>
                                </span>
                            </div>
                        </div>
                        <!-- /Billing Details -->
                        <!-- Order notes -->
                        <div class="order-notes">
                            <textarea class="input {{ $errors->has('notes') ? 'is-invalid' : '' }}"
                                      placeholder="Ghi chú đơn hàng" name="notes"></textarea>
                            @if ($errors->has('notes'))
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $errors->first('tel') }}</strong>
                                </span>
                            @endif
                        </div>
                        <!-- /Order notes -->
                    </div>
                    @if(\Illuminate\Support\Facades\Session::get('cart'))
                        <!-- Order Details -->
                        <div class="col-md-5 order-details">
                            <div class="section-title text-center">
                                <h3 class="title">Đơn hàng</h3>
                            </div>
                            <div class="order-summary">
                                <div class="order-col">
                                    <div><strong>Sản phẩm</strong></div>
                                    <div><strong>Tổng</strong></div>
                                </div>
                                <div class="order-products">

                                    @foreach($cart as $item)
                                        <div class="order-col">
                                            <div>{{$item['quantity']}}x {{$item['name']}}</div>
                                            <div> {{  number_format($item['price'], 0, '.', ',') . ' đ'}}</div>
                                        </div>
                                    @endforeach

                                </div>
                                <div class="order-col">
                                    <div>Vận chuyển</div>
                                    <div><strong>Miễn phí</strong></div>
                                </div>
                                <div class="order-col">
                                    <div><strong>Tổng đơn hàng</strong></div>
                                    <div><strong
                                            class="order-total">{{  number_format($total, 0, '.', ',') . ' đ'}}</strong>
                                    </div>
                                </div>
                            </div>
                            <div class="payment-method">
                                <div class="input-radio">
                                    <input type="radio" class="input {{ $errors->has('payment') ? 'is-invalid' : '' }}"
                                           name="payment" id="payment-1" value="vnpay">
                                    <label for="payment-1">
                                        <span></span>
                                        Thanh toán VNPay
                                    </label>
                                    <div class="caption">
                                        <p>Thanh toán tiện lợi bằng ví điện tử VNPay
                                            <br>Hỗ trợ thanh toán bằng nhiều ngân hàng và tất cả loại thẻ</p>
                                    </div>
                                </div>
                                <div class="input-radio">
                                    <input type="radio" name="payment"
                                           class="input {{ $errors->has('payment') ? 'is-invalid' : '' }}"
                                           id="payment-3" value='cod'>
                                    <label for="payment-3">
                                        <span></span>
                                        Thanh toán khi nhận hàng (COD)
                                    </label>
                                    <div class="caption">
                                        <p>Thanh toán khi nhận hàng tại nhà
                                            <br>Kiểm tra đơn hàng trước khi thanh toán</p>
                                    </div>
                                </div>
                                @if ($errors->has('payment'))
                                    <span class="invalid-feedback" role="alert">
                                    <small class="text-danger">{{ $errors->first('payment') }}</small>
                                </span>
                                @endif
                            </div>
                            <button type="submit" class="primary-btn order-submit" id="order_btn">Thanh toán đơn
                                hàng
                            </button>
                            <script>
                                document.getElementById('tel-input').addEventListener('input', function () {
                                    var telInput = this.value.trim();
                                    var telError = document.getElementById('tel-error');
                                    var submitBtn = document.getElementById('order_btn');

                                    if (!/^(09|03)\d{8}$/.test(telInput)) {
                                        telError.style.display = 'block';
                                        submitBtn.setAttribute('disabled', 'true');
                                    } else {
                                        telError.style.display = 'none';
                                        submitBtn.removeAttribute('disabled');
                                    }
                                });
                            </script>

                        </div>
                    @endif
                    <!-- /Order Details -->
                </form>

            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /SECTION -->
@endsection
