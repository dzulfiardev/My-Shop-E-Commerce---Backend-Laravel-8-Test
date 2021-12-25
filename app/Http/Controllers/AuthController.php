<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Models\User;

class AuthController extends Controller
{
	public function register(Request $request)
	{
		$validator = Validator::make($request->all(), [
			'email' => 'required|string|email|max:100|unique:users',
			'user_username' => 'required|string|unique:users',
			'user_fullname' => 'required|string|between:2,100',
			'password' => 'required|string|confirmed|min:8',
		]);

		if ($validator->fails()) {
			return response()->json($validator->errors(), 422);
		}

		$max = User::max('id') + 1;
		$uid = 'UID' . sprintf('%05s', $max);

		$user = User::create(array_merge(
			$validator->validated(),
			[
				'password'	=> Hash::make($request['password'], [
					'memory' 	=> 1024,
					'time'		=> 2,
					'threads'	=> 2,
				]),
				'user_uid'	=> $uid,
				'user_image_url' => url('assets/image/profile/default.jpg')
			]
		));
		$user->attachRole('customer');

		$response = [
			'user' => $user,
			'success' => 'Register Success',
		];

		return response($response, 201);
	}

	public function login(Request $request)
	{
		$user = User::where('email', $request['email'])->where('user_status', 'Active')->first();

		if (User::where('email', $request['email'])->first()->user_status == 'Inactive') {
			return response([
				'message' => 'Your account is not active, call the adminstrator'
			], 404);
		}

		if (!$user || !Hash::check($request['password'], $user->password)) {
			return response([
				'message' => 'These credentials do not match our records'
			], 404);
		}

		$userModel = new User();

		$resData = $userModel->withRole($user->id)->first();
		$token = $user->createToken('myapptoken')->plainTextToken;

		$res = [
			'user' => [
				'id' 					=> $resData->user_id,
				'uid' 				=> $resData->user_uid,
				'fullname' 		=> $resData->user_fullname,
				'username' 		=> $resData->user_username,
				'email'				=> $resData->email,
				'role'				=> $resData->name,
				'roleDisplay'	=> $resData->display_name,
				'image'				=> $resData->user_image,
				'imageUrl'				=> url('assets/image/profile/' . $resData->user_image),
			],
			'token' 	=> $token,
			'expires' => 3600
		];

		return response($res, 201);
	}

	public function logout()
	{
		auth()->user()->tokens()->delete();

		$msg =  ['message' => 'Logged Out'];
		return $msg;
	}

	public function users($authId)
	{
		$userModel = new User();
		$resData = $userModel->withRoleAll($authId);

		return response($resData);
	}

	public function testing()
	{
		return response(User::all());
	}
}
