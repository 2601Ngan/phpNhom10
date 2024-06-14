<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $category = Category::all();
        return view('backend/page/category/index', compact('category'));
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
        $categoryName = $request->input('categoryName');
        $existingCategory = Category::where('category_name', $categoryName)->first();
        if ($existingCategory) {
            return redirect()->back()->with('toast_error', 'Tên danh mục đã tồn tại');
        }
        $category = new Category();
        $category->category_name = $categoryName;
        $category->category_slug = Str::slug($categoryName);
        $saved = $category->save();
        if ($saved) {
            return redirect()->back()->with('toast_success', 'Thêm danh mục thành công');
        } else {
            return redirect()->back()->with('toast_error', 'Thêm danh mục thất bại');
        }
    }

    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'category_name' => 'required|unique:categories,category_name,' . $id,
        ]);
        $category = Category::find($id);
        $category->category_name = $request->input('category_name');
        $category->category_slug = Str::slug($request->input('category_name'));
        $saved = $category->save();
        if ($saved) {
            return redirect()->back()->with('toast_success', 'Cập nhật danh mục thành công');
        } else {
            return redirect()->back()->with('toast_error', 'Cập nhật danh mục thất bại');
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
        $category = Category::find($id);
        if ($category->products()->exists()) {
            return redirect()->back()->with('toast_error', 'Xoá danh mục thất bại - Danh mục chứa nhiều sản phẩm');
        }
        $category->delete();
        return redirect()->route('category.index')->with('toast_success', 'Xóa danh mục thành công');
    }
}
