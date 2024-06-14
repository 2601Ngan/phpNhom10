<?php

use App\Http\Controllers\CategoryController;
use App\Http\Controllers\GuestController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route cho quan tri vien
Route::middleware(['auth', 'admin'])->group(function () {
    Route::get('/admin', [HomeController::class, 'index'])->name('admin');
    Route::resource('product', ProductController::class);
    Route::resource('order', OrderController::class);
    Route::delete('product/delete/{id}', [ProductController::class, 'destroy'])->name('product.delete');
    Route::resource('category', CategoryController::class);
    Route::delete('category/delete/{id}', [CategoryController::class, 'destroy'])->name('category.delete');
    Route::resource('user', UserController::class);
    Route::get('user/edit/{id}', [UserController::class, 'edit'])->name('user.edit');
    Route::delete('user/delete/{id}', [UserController::class, 'destroy'])->name('user.delete');
    Route::put('user/update/{id}', [UserController::class, 'update'])->name('user.update');
});

Route::get('/', [GuestController::class, 'index']);
Route::get('/products', [GuestController::class, 'products']);
Route::get('/details_product/{id}', [GuestController::class, 'details_product']);
Route::post('/addToCart/{id}', [GuestController::class, 'addToCart'])->name('cart.add');
Route::post('/cart/remove/{id}', [GuestController::class, 'removeItemsCart'])->name('cart.remove');
Route::get('/checkout', [GuestController::class, 'checkout'])->name('checkout');
Route::post('/ordered', [GuestController::class, 'ordered'])->name('ordered');
Route::get('/thanh-toan/ket-qua-giao-dich', [GuestController::class, 'responeVNPay']);
Route::post('/search', [GuestController::class, 'search'])->name('search');

Auth::routes();


