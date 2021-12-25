<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\RolesController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\OrdersController;

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

Route::get('/', function () {
    return view('welcome');
});

// route testing
Route::get('/related-product/{id}/{product}', [ProductController::class, 'relatedProductByCategory']);
Route::get('/product-category/{id}', [ProductController::class, 'productByCategory']);
Route::get('/search/{keyword}', [ProductController::class, 'webSearch']);
Route::get('/testing/{ordersId}', [OrdersController::class, 'showOrdersProduct']);
