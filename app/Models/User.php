<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Laratrust\Traits\LaratrustUserTrait;
use Illuminate\Support\Facades\DB;
use Laravel\Cashier\Billable;

class User extends Authenticatable
{
	use LaratrustUserTrait;
	use HasApiTokens, HasFactory, Notifiable, Billable;

	/**
	 * The attributes that are mass assignable.
	 *
	 * @var string[]
	 */
	protected $fillable = [
		'user_uid',
		'user_fullname',
		'user_username',
		'email',
		'user_image',
		'user_image_url',
		'user_status',
		'password',
		'address',
		'country',
		'city',
		'state',
		'province',
		'zip_code',
	];

	protected $guarded = [];

	/**
	 * The attributes that should be hidden for serialization.
	 *
	 * @var array
	 */
	protected $hidden = [
		'password',
		'remember_token',
	];

	/**
	 * The attributes that should be cast.
	 *
	 * @var array
	 */
	protected $casts = [
		'email_verified_at' => 'datetime',
	];

	public function roleUser()
	{
		return $this->hasMany(RoleUser::class);
	}

	public function orders()
	{
		return $this->hasMany(Orders::class);
	}

	public function withRole($id)
	{
		return DB::table('role_user')
			->join('users', 'users.id', '=', 'role_user.user_id')
			->join('roles', 'roles.id', '=', 'role_user.role_id')
			->where('users.id', $id)
			->get();
	}

	public function withRoleAll($authId)
	{
		return DB::table('role_user')
			->join('users', 'users.id', '=', 'role_user.user_id')
			->join('roles', 'roles.id', '=', 'role_user.role_id')
			->select('users.id', 'users.user_uid', 'users.user_fullname', 'users.user_username', 'users.email', 'users.user_image', 'users.user_image_url', 'users.user_status', 'role_user.*', 'roles.*')
			->where('roles.name', '!=', 'customer')
			->where('users.id', '!=', $authId)
			->get();
	}

	public function customers()
	{
		return DB::table('role_user')
			->join('users', 'users.id', '=', 'role_user.user_id')
			->join('roles', 'roles.id', '=', 'role_user.role_id')
			->select('users.id', 'users.user_uid', 'users.user_fullname', 'users.user_username', 'users.email', 'users.user_image', 'users.user_image_url', 'users.user_status', 'role_user.*', 'roles.*')
			->where('roles.name', '=', 'customer')
			->get();
	}

	public function withRoleSingle($id)
	{
		return DB::table('role_user')
			->join('users', 'users.id', '=', 'role_user.user_id')
			->join('roles', 'roles.id', '=', 'role_user.role_id')
			->select('users.id', 'users.user_uid', 'users.user_fullname', 'users.user_username', 'users.email', 'users.user_image', 'users.user_image_url', 'users.user_status', 'role_user.*', 'roles.*')
			->where('users.id', $id)
			->first();
	}

	public function uid()
	{
		$max = User::max('id') + 1;
		return 'UID' . sprintf('%05s', $max);
	}
}
