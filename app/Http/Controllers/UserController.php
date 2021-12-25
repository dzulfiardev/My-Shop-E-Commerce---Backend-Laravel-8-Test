<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\User;
use App\Models\Orders;
use App\Models\Roles;
use App\Models\RoleUser;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Laravel\Cashier\Cashier;
use App\Models\Product;
use App\Models\Category;
use Symfony\Component\VarDumper\VarDumper;

class UserController extends Controller
{
	public function showCustomers()
	{
		$userModel = new User();
		return response($userModel->customers(), 200);
	}
	public function create(Request $request)
	{
		$userModel = new User();
		$roleUserModel = new RoleUser();

		// Create Item
		if ($request['action'] == 'create') {
			$validator = Validator::make($request->all(), [
				'email' => 'required|string|email|max:100|unique:users',
				'user_username' => 'required|string|unique:users',
				'user_fullname' => 'required|string|between:2,100',
				'user_image'		=> 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:1024',
				'user_status'		=> 'required',
				'password' 			=> 'required|string|confirmed|min:8',
				'user_role' 		=> 'required'
			]);

			if ($validator->fails()) {
				$msg = [
					'error' => $validator->errors()
				];
				return response()->json($msg, 422);
			}

			$image = $request['user_image'];
			if ($image) {
				$imageName = $request['user_fullname'] . '-' . time() . '.' . $image->extension();
				$image->move(public_path('assets/image/profile'), $imageName);
			} else {
				$imageName = 'default.jpg';
			}

			$user = User::create(array_merge(
				$validator->validated(),
				[
					'password'	=> Hash::make($request['password'], [
						'memory' 	=> 1024,
						'time'		=> 2,
						'threads'	=> 2,
					]),
					'user_uid'	=> $userModel->uid(),
					'user_image'	=> $imageName,
					'user_status' => $request['user_status'],
					'user_image_url' => url('assets/image/profile/' . $imageName)
				]
			));
			$user->attachRole($request['user_role']);

			$response = [
				'user' => $user,
				'success' => 'Success Add New User Account',
			];
		}

		// Update Action
		if ($request['action'] == 'update') {
			$user = User::find($request['id']);

			// Email Rules
			if ($request['email'] == $user->email) {
				$emailRules = 'required|string|email|max:100';
			} else {
				$emailRules = 'required|string|email|max:100|unique:users';
			}

			// Username Rules
			if ($request['user_username'] == $user->user_username) {
				$usernameRules = 'required|string';
			} else {
				$usernameRules = 'required|string|unique:users';
			}

			// Password Rules
			$validator = Validator::make($request->all(), [
				'email' 				=> $emailRules,
				'user_username' => $usernameRules,
				'user_fullname' => 'required|string|between:2,100',
				'user_image'		=> 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:1024',
				'password' 			=> 'nullable|string|confirmed|min:8',
				'user_role' 		=> 'required'
			]);

			// Error Response
			if ($validator->fails()) {
				$msg = [
					'error' => $validator->errors()
				];
				return response()->json($msg, 422);
			}

			// Image Contitional
			$image = $request['user_image'];
			if ($image) {
				$imageName = $request['user_fullname'] . '-' . time() . '.' . $image->extension();

				if ($request['old_image'] == 'default.jpg') {
					$image->move(public_path('assets/image/profile'), $imageName);
				} else {
					$image->move(public_path('assets/image/profile'), $imageName);
					File::delete('assets/image/profile/' . $request['old_image']);
				}
			} else {
				$imageName = $request['old_image'];
			}

			$data = [
				'email' 				=> $request['email'],
				'user_username' => $request['user_username'],
				'user_fullname' => $request['user_fullname'],
				'user_image'		=> $imageName,
				'user_status' 	=> $request['user_status'],
				'user_image_url' => url('assets/image/profile/' . $imageName)
			];

			if ($request['password']) {
				$dataUpdate = array_merge($data, [
					'password' => Hash::make($request['password'], [
						'memory' 	=> 1024,
						'time'		=> 2,
						'threads'	=> 2,
					])
				]);
			} else {
				$dataUpdate = $data;
			}

			// Update data
			$user = User::where('id', $request['id'])->update($dataUpdate);
			if ($user) {
				$roleUserModel->where('user_id', $request['id'])->update(['role_id' => $request['user_role']]);
				$response = [
					'success' => 'Success to Update',
				];
			}
		}

		return response($response, 201);
	}

	public function showSingle($id)
	{
		$user = new User();
		$res = $user->withRoleSingle($id);

		return response(json_encode($res), 200);
	}

	public function destroy($id)
	{
		$user = User::find($id);

		if ($user->user_status == 'Active') {
			return response([
				'activeUser' => 'Cannot Delete Active User'
			], 200);
		}

		if (User::destroy($id)) {
			// Delete Profile Image
			if ($user->user_image != 'default.jpg') {
				File::delete('assets/image/profile/' . $user->user_image);
			}
			$msg = [
				'success' => 'Success Delete User Account Email: ' . $user->email . ', Username: ' . $user->user_username
			];
		}

		return response($msg, 200);

		// if ($user->id == $loggedId) {
		// 	return response([
		// 		'fail' => 'Cannot Delete Self Account'
		// 	]);
		// }
	}

	public function purchase(Request $request)
	{
		$userModel = new User();
		$ordersModel = new Orders();

		$user = User::firstOrCreate(
			[
				'email' => $request->input('email')
			],
			[
				'user_uid' 	=> $userModel->uid(),
				'password' 	=> Hash::make(Str::random(12)),
				'user_fullname' => $request->input('firstName') . ' ' . $request->input('lastName'),
				'user_image_url'	=> url('assets/image/profile/default.jpg'),
				'country'		=> $request->country,
				'address'		=> $request->input('address'),
				'city'			=> $request->input('city'),
				'state'			=> $request->input('state'),
				'zip_code'	=> $request->input('zipCode')
			]
		);
		$newUser = $userModel->where('email', $request->input('email'))->first();
		if (!DB::table('role_user')->where('user_id', $newUser->id)->first()) {
			$user->attachRole('customer');
		}

		try {
			$payment = $user->charge(
				$request->input('amount'),
				$request->input('payment_method_id')
			);

			$payment = $payment->asStripePaymentIntent();

			$order = $user->orders()
				->create([
					'order_uid' 						=> $ordersModel->uid(),
					'order_transaction_id' 	=> $payment->charges->data[0]->id,
					'order_total' 					=> $payment->charges->data[0]->amount / 100,
					'order_grand_total' 		=> $payment->charges->data[0]->amount / 100
				]);

			foreach ($request->input('cart') as $item) {
				$order->products()
					->attach($item['id'], [
						'orders_detail_price' => $item['price'],
						'orders_detail_quantity' => $item['quantity'],
						'orders_detail_total_amount' => $item['totalPrice']
					]);
			}

			$cart = $request->input('cart');
			for ($i = 0; count($cart) > $i; $i++) {
				$productSelect = Product::whereIn('id', $cart[$i])->get();

				for ($j = 0; count($productSelect) > $j; $j++) {
					$quantityUpdate = ($productSelect[$j]['product_quantity'] - $cart[$i]['quantity']);
					Product::where('id', $productSelect[$j]['id'])->update(['product_quantity' => $quantityUpdate]);
				}
			}
			$order->load('products');
			return $order;
		} catch (\Exception $e) {
			// handle exception
			return response()->json(['message' => $e->getMessage()], 500);
		}
	}

	public function testing()
	{
		echo 'oke';
	}
}
