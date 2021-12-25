<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RoleUser extends Model
{
	use HasFactory;
	protected $table = 'role_user';
	protected $fillable = ['role_id', 'user_id', 'user_type'];
	public $timestamps = false;

	public function user()
	{
		return $this->belongsTo(User::class);
	}

	public function roles()
	{
		return $this->belongsTo(Roles::class);
	}
}
