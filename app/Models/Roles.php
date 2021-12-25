<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Roles extends Model
{
	use HasFactory;
	protected $table = 'roles';
	protected $primaryKey = 'id';
	protected $fillable = ['name', 'display_name'];

	public function roleUser()
	{
		return $this->hasMany(RoleUser::class, 'role_id');
	}
}
