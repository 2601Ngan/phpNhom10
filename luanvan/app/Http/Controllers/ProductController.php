<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Contracts\Foundation\Application|\Illuminate\Contracts\View\Factory|\Illuminate\Contracts\View\View|\Illuminate\Foundation\Application
     */
    public function index()
    {
        //
        $product = Product::all();
        $category = Category::all();
        return view('backend/page/product/index', compact('product', 'category'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'id_category' => 'required|exists:categories,id',
            'image' => 'nullable|file',
            'info' => 'nullable|string',
            'des' => 'nullable|string',
            'quantity' => 'required|integer|min:1',
            'unit_prices' => 'required|integer|min:1000',
        ]);
        $product = new Product();
        $product->name = $validatedData['name'];
        $product->slug = Str::slug($validatedData['name']);
        $product->id_category = $validatedData['id_category'];
        $product->info = $validatedData['info'];
        $product->des = $validatedData['des'];
        $product->quantity = $validatedData['quantity'];
        $product->unit_prices = $validatedData['unit_prices'];
        $path = 'img';
        if ($request->hasFile('image')) {
            $get_image = $request->file('image');
            $new_image = $get_image->getClientOriginalName();
            if (!File::exists(public_path($path . '/' . $new_image))) {
                $get_image->move(public_path($path), $new_image);
            }
            $image = url($path . '/' . $new_image);
        } else {
            $image = null;
        }
        $product->image = $image;
        $saved = $product->save();
        if ($saved) {
            return redirect()->back()->with('toast_success', 'Thêm sản phẩm thành công');
        } else {
            return redirect()->back()->with('toast_error', 'Thêm sản phẩm thất bại');
        }
    }


    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public
    function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, $id)
    {
        $product = Product::find($id);
        if (!$product) {
            return redirect()->back()->with('toast_error', 'Không tìm thấy sản phẩm');
        }
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'id_category' => 'required|exists:categories,id',
            'image' => 'nullable',
            'info' => 'nullable|string',
            'des' => 'nullable|string',
            'quantity' => 'required|integer|min:1',
            'unit_prices' => 'required|integer|min:1000',
        ]);
        $product->name = $validatedData['name'];
        $product->slug = Str::slug($validatedData['name']);
        $product->id_category = $validatedData['id_category'];
        $product->info = $validatedData['info'];
        $product->des = $validatedData['des'];
        $product->quantity = $validatedData['quantity'];
        $product->unit_prices = $validatedData['unit_prices'];
        $path = 'img';
        if ($request->hasFile('image')) {
            $get_image = $request->file('image');
            $new_image = $get_image->getClientOriginalName();
            if (!File::exists(public_path($path . '/' . $new_image))) {
                $get_image->move(public_path($path), $new_image);
            }
            $product_image = url($path . '/' . $new_image);
        } else {
            $product_image = $product->image;
        }
        $product->image = $product_image;
        $saved = $product->save();
        if ($saved) {
            return redirect()->back()->with('toast_success', 'Cập nhât sản phẩm thành công');
        } else {
            return redirect()->back()->with('toast_error', 'Cập nhât sản phẩm thất bại');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy($id)
    {
        //
        $product = Product::find($id);
        if ($product->items()->exists()) {
            return redirect()->back()->with('toast_error', 'Xoá sản phẩm thất bại - Sản phẩm nằm trong nhiều đơn hàng');
        }
        $product->delete();
        return redirect()->route('category.index')->with('toast_success', 'Xóa sản phẩm thành công');
    }
}
