<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Item;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;

class GuestController extends Controller
{
    //
    public function index(): \Illuminate\Contracts\View\Factory|\Illuminate\Foundation\Application|\Illuminate\Contracts\View\View|\Illuminate\Contracts\Foundation\Application
    {
//        Session::forget('cart');
        $new_products = Product::latest()->take(10)->get();
        $category = Category::all();
        $cart = session()->get('cart');
        if ($cart) {
            $total = 0;
            foreach ($cart as $item) {
                $total += $item['quantity'] * $item['price'];
            }
            $count = count($cart);
            return view('frontend/page/welcome', compact('new_products', 'cart', 'total', 'count', 'category'));
        } else {
            return view('frontend/page/welcome', compact('new_products', 'category'));
        }

    }

    public function products()
    {
        $product = Product::paginate(6);
        $category = Category::all();
        $sell = Product::latest()->take(4)->get();
        $cart = session()->get('cart');
        if ($cart) {
            $total = 0;
            foreach ($cart as $item) {
                $total += $item['quantity'] * $item['price'];
            }
            $count = count($cart);
            return view('frontend/page/products', compact('product', 'sell', 'category', 'cart', 'total', 'count'));
        } else {
            return view('frontend/page/products', compact('product', 'category', 'sell'));
        }
    }

    public function details_product($id)
    {
        $product = Product::find($id);
        $category = Category::all();
        $sell = Product::latest()->take(4)->get();
        $related_product = Product::all()->where('id_category', $product->category->id)->take(10);
        $cart = session()->get('cart');
        if ($cart) {
            $total = 0;
            foreach ($cart as $item) {
                $total += $item['quantity'] * $item['price'];
            }
            $count = count($cart);
            return view('frontend/page/product_details', compact('product', 'sell', 'category', 'related_product', 'cart', 'total', 'count'));
        } else {
            return view('frontend/page/product_details', compact('product', 'category', 'sell', 'related_product'));
        }

    }

    public function addToCart($id, Request $request)
    {
        $quantity = $request->input('quantity');
        if (!is_numeric($quantity) || $quantity <= 0) {
            return redirect()->back()->with('toast_error', 'Số lượng sản phẩm không hợp lệ');
        }
        $product = Product::find($id);
        if (!$product) {
            abort(404);
        }
        $cart = session()->get('cart') ?? [];
        if (isset($cart[$id])) {
            $cart[$id]['quantity'] += $quantity;
        } else {
            $cart[$id] = [
                'id' => $product->id,
                'name' => $product->name,
                'quantity' => $quantity,
                'price' => $product->unit_prices,
                'image' => $product->image
            ];
        }
        session()->put('cart', $cart);
        return redirect()->back()->with('toast_success', 'Sản phẩm đã được thêm vào giỏ hàng');
    }

    public function removeItemsCart($id)
    {
        $cart = session()->get('cart');
        if (isset($cart[$id])) {
            unset($cart[$id]);
            session()->put('cart', $cart);
        }
        return redirect()->back()->with('toast_success', 'Sản phẩm đã được xóa khỏi giỏ hàng');
    }

    public function checkout()
    {
        $category = Category::all();
        $cart = session()->get('cart');
        if ($cart) {
            $total = 0;
            foreach ($cart as $item) {
                $total += $item['quantity'] * $item['price'];
            }
            $count = count($cart);
            return view('frontend/page/checkout', compact('cart', 'total', 'count', 'category'));
        } else {
            return view('frontend/page/checkout', compact('category'));
        }
    }

    public function ordered(Request $request)
    {
        $randomNumber = mt_rand(99999, 1000000);
        $orderCode = "OD-" . $randomNumber;
        // Định nghĩa các thông báo lỗi tùy chỉnh
        $messages = [
            'first_name.required' => 'Họ là bắt buộc',
            'last_name.required' => 'Tên là bắt buộc',
            'email.required' => 'Email là bắt buộc',
            'tel.required' => 'Số điện thoại là bắt buộc',
            'address.required' => 'Địa chỉ giao hàng là bắt buộc',
            'payment.required' => 'Hãy chọn một phương thức thanh toán'
        ];
        $validator = Validator::make($request->all(), [
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'email' => 'required|email|max:255',
            'tel' => 'required|string|max:20',
            'address' => 'required|string|max:255',
            'notes' => 'nullable|string|max:1000',
            'payment' => 'required'
        ], $messages);
        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
        $data = $validator->getData();

        $firstName = $data['first_name'];
        $lastName = $data['last_name'];
        $customerName = $firstName . ' ' . $lastName;
        $email = $data['email'];
        $phone = $data['tel'];
        $notes = $data['notes'];
        $address = $data['address'];
        $payment = $request->input('payment');

        $cart = session()->get('cart');
        if ($cart) {
            $total_oder = 0;
            foreach ($cart as $item) {
                $total_oder += $item['quantity'] * $item['price'];
            }
        }
        if ($payment === 'vnpay') {
            // Tạo CODE đơn hàng tự động
            $randomNumber = mt_rand(999, 10000);
            $orderCode = "OD-" . $randomNumber;
            // Cấu hình VN-PAY
            error_reporting(E_ALL & ~E_NOTICE & ~E_DEPRECATED);
            date_default_timezone_set('Asia/Ho_Chi_Minh');
            // URL giao diện thanh toán VN-PAY
            $vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
            // URL trả về khi thanh toán thành công
            $vnp_Returnurl = "http://127.0.0.1:8000/thanh-toan/ket-qua-giao-dich";
            // Email khách hàng
            $vnp_Inv_Email = $email;
            // Tài khoản và mật khẩu của SANBOX VN-PAY (Demo Test)
            $vnp_TmnCode = "T8ILNRAM";//Mã website tại VN-PAY
            $vnp_HashSecret = "FJ66ZAY77LPQAKET7R41EFWBCYMY99NN";//Chuỗi kí tự bí mật
            // Cấu hình thông tin thanh toán đặt vé
            $vnp_TxnRef = $orderCode; //Mã đơn hàng. Trong thực tế Merchant cần insert đơn hàng vào DB và gửi mã này sang VNPAY
            $vnp_OrderInfo = 'Thanh toán đơn hàng - ' . $orderCode;// Thông tin đơn hàng
            $vnp_Amount = $total_oder * 100; // Tổng tiền cần thanh toán
            $vnp_Locale = 'vn'; // việt nam
            $vnp_OrderType = 'payment';
            // tạo mảng chứa thông tin thanh toán VN-PAY
            $vnp_IpAddr = $_SERVER['REMOTE_ADDR'];
            $inputData = array(
                "vnp_Version" => "2.1.0",
                "vnp_TmnCode" => $vnp_TmnCode,
                "vnp_Amount" => $vnp_Amount,
                "vnp_Command" => "pay",
                "vnp_CreateDate" => date('YmdHis'),
                "vnp_CurrCode" => "VND",
                "vnp_Inv_Email" => $vnp_Inv_Email,
                "vnp_IpAddr" => $vnp_IpAddr,
                "vnp_Locale" => $vnp_Locale,
                "vnp_OrderInfo" => $vnp_OrderInfo,
                "vnp_OrderType" => $vnp_OrderType,
                "vnp_ReturnUrl" => $vnp_Returnurl,
                "vnp_TxnRef" => $vnp_TxnRef,
            );

            if (isset($vnp_BankCode) && $vnp_BankCode != "") {
                $inputData['vnp_BankCode'] = $vnp_BankCode;
            }

            if (isset($vnp_Bill_State) && $vnp_Bill_State != "") {
                $inputData['vnp_Bill_State'] = $vnp_Bill_State;
            }
            ksort($inputData);
            $query = "";
            $i = 0;
            $hashdata = "";
            foreach ($inputData as $key => $value) {
                if ($i == 1) {
                    $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
                } else {
                    $hashdata .= urlencode($key) . "=" . urlencode($value);
                    $i = 1;
                }
                $query .= urlencode($key) . "=" . urlencode($value) . '&';
            }

            $vnp_Url = $vnp_Url . "?" . $query;

            if (isset($vnp_HashSecret)) {
                $vnpSecureHash = hash_hmac('sha512', $hashdata, $vnp_HashSecret);//
                $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
            }
            $returnData = array('code' => '00'
            , 'message' => 'Đăng ký giữ chỗ thành công! Kiểm tra email để xem hóa đơn đặt hàng'
            , 'data' => $vnp_Url);
            if (isset($_POST['redirect'])) {
                header('Location: ' . $vnp_Url);
                die();
            } else {
                echo json_encode($returnData);
            }
            $order = Order::create([
                'code' => $orderCode,
                'customer' => $customerName,
                'payment_status' => 'chưa thanh toán',
                'email' => $email,
                'total' => $total_oder,
                'delivery_address' => $address,
                'phone' => $phone,
                'payment_type' => 'THANH TOÁN VN PAY',
                'notes' => $notes,
                'status' => 'ordered'
            ]);
            if ($order) {
                $id_oder = $order->id;
                foreach ($cart as $items) {
                    $item = Item::create([
                        'id_order' => $id_oder,
                        'id_product' => $items['id'],
                        'quantity' => $items['quantity'],
                        'unit_prices' => $items['price']
                    ]);
                }
                if ($items) {
                    $get_order_item = Item::all()->where('id_order', $id_oder);
                    foreach ($get_order_item as $product) {
                        $id_product = $product->id_product;
                        $quantity_product = Product::all()->where('id', $id_product)->first();
                        // gán số lượng sản phẩm
                        $quantity = $quantity_product->quantity;
                        // gán số lượng sản phẩm mới sau khi tạo đơn hàng
                        $new_quantity = $quantity - $product->quantity;
                        // cập nhật sản phẩm
                        DB::table('products')->where('id', '=', $id_product)
                            ->update([
                                'quantity' => $new_quantity
                            ]);
                    }
                }
            }
            return redirect($vnp_Url);
        } elseif ($payment === 'cod') {
            $order = Order::create([
                'code' => $orderCode,
                'payment_status' => 'chưa thanh toán',
                'customer' => $customerName,
                'email' => $email,
                'total' => $total_oder,
                'delivery_address' => $address,
                'phone' => $phone,
                'payment_type' => 'THANH TOÁN KHI NHAN HANG',
                'notes' => $notes,
                'status' => 'ordered'
            ]);
            if ($order) {
                $id_oder = $order->id;
                foreach ($cart as $items) {
                    $item = Item::create([
                        'id_order' => $id_oder,
                        'id_product' => $items['id'],
                        'quantity' => $items['quantity'],
                        'unit_prices' => $items['price']
                    ]);
                }
                if ($items) {
                    $get_order_item = Item::all()->where('id_order', $id_oder);
                    foreach ($get_order_item as $product) {
                        $id_product = $product->id_product;
                        $quantity_product = Product::all()->where('id', $id_product)->first();
                        // gán số lượng sản phẩm
                        $quantity = $quantity_product->quantity;
                        // gán số lượng sản phẩm mới sau khi tạo đơn hàng
                        $new_quantity = $quantity - $product->quantity;
                        // cập nhật sản phẩm
                        DB::table('products')->where('id', '=', $id_product)
                            ->update([
                                'quantity' => $new_quantity
                            ]);
                    }
                }
            }
            return redirect()->back()->with('message', 'Đặt hàng thành công');
        }
    }

    public function responeVNPay(Request $request)
    {
        if ($request->vnp_ResponseCode === "00") {
            DB::table('orders')->where('code', '=', $request->vnp_TxnRef)
                ->update(['payment_status' => 'thanh toán thành công']);
            Session::forget('cart');
            Session::save();
            return redirect('/checkout')->with('message', 'Thanh toán đơn hàng thành công');
        } else {
            return redirect('/checkout')->with('message', 'Thanh toán đơn hàng thất bại');
        }
    }

    public function search(Request $request)
    {
        $key = $request->input('key');
        $category = Category::all();
        $categories = Category::where('category_name', 'LIKE', "%$key%")->get();
        $product = [];

        foreach ($categories as $cat) {
            $product = array_merge($product, $cat->products()->get()->toArray());
        }

        $page = $request->has('page') ? $request->query('page') : 1;
        $perPage = 10;
        $product = array_slice($product, ($page - 1) * $perPage, $perPage);
        $sell = Product::latest()->take(4)->get();
        $cart = session()->get('cart');
        if ($cart) {
            $total = 0;
            foreach ($cart as $item) {
                $total += $item['quantity'] * $item['price'];
            }
            $count = count($cart);
            return view('frontend/page/search', compact('product', 'sell', 'category', 'cart', 'total', 'count'));
        } else {
            return view('frontend/page/search', compact('product', 'category', 'sell'));
        }
    }
}
