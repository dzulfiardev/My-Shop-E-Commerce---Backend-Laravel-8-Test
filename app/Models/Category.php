<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
	use HasFactory;
	protected $guarded = [];
	protected $table = 'category';
	protected $primaryKey = 'id';
	protected $fillable = ['category_uid', 'category_name', 'category_slug'];

	public function product()
	{
		return $this->hasMany(Product::class);
	}
}
