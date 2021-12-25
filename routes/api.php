<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\RolesController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\OrdersController;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
	return $request->user();
});

// Protected routes
Route::group(['middleware' => ['auth:sanctum']], function () {
	// User Management Module Api
	Route::get('/users-list/{authId}', [AuthController::class, 'users']);
	Route::get('/customers', [UserController::class, 'showCustomers']);
	Route::post('/create-user', [UserController::class, 'create']);
	Route::get('/users/{id}', [UserController::class, 'showSingle']);
	Route::get('/roles', [RolesController::class, 'showAll']);
	Route::delete('/users/{id}', [UserController::class, 'destroy']);

	// Orders Module Api
	Route::get('/orders', [OrdersController::class, 'showOrders']);
	Route::get('/orders/{ordersId}', [OrdersController::class, 'singleOrder']);
	Route::get('/order-detail/{ordersDetailId}', [OrdersController::class, 'showOrdersProduct']);
	Route::post('/deliver-order', [OrdersController::class, 'deliverOrder']);

	// Product Module Api
	Route::post('/products', [ProductController::class, 'create']);
	Route::get('/products', [ProductController::class, 'showAll']);
	Route::get('/product/{id}', [ProductController::class, 'showSingle']);
	Route::delete('/product/{id}', [ProductController::class, 'destroy']);


	// Logout
	Route::get('/logout', [AuthController::class, 'logout']);
});

// Public routes
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::get('/category', [ProductController::class, 'allCategory']);
Route::get('/all-product', [ProductController::class, 'showAllGuest']);
Route::get('/detail-product/{slug}', [ProductController::class, 'showSingleGuest']);
Route::get('/related-product/{id}/{product_id}', [ProductController::class, 'relatedProductByCategory']);
Route::get('/product-category/{slug}', [ProductController::class, 'productByCategory']);
Route::get('/search/{keyword}', [ProductController::class, 'webSearch']);

// Purchase
Route::post('/purchase', [UserController::class, 'purchase']);

// route testing
Route::get('/testing', [ProductController::class, 'allProductGuest']);
