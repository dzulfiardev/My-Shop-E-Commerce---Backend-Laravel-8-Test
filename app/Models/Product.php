<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Product extends Model
{
	use HasFactory;
	protected $guarded = [];
	protected $table = 'products';
	protected $primaryKey = 'id';
	protected $fillable = [
		'category_id',
		'product_uid',
		'product_name',
		'product_slug',
		'product_content',
		'product_image',
		'product_image_url',
		'product_vendor',
		'product_type',
		'product_price',
		'product_weight',
		'product_discount',
		'product_quantity',
		'product_barcode',
		'product_status',
	];

	public function orders()
	{
		return $this->belongsToMany(Orders::class);
	}

	public function category()
	{
		return $this->belongsTo(Category::class);
	}

	public function uid()
	{
		$max = $this->max('id') + 1;
		return 'UID' . sprintf('%05s', $max);
	}

	public function allProducts()
	{
		return $this->join('category', 'category.id', '=', 'products.category_id')
			->select('products.*', 'category.category_name')
			->get();
	}

	public function allProductGuest()
	{
		return $this->join('category', 'category.id', '=', 'products.category_id')
			->select('products.id', 'products.product_name', 'products.product_content', 'products.product_image', 'products.product_slug', 'products.product_image_url', 'products.product_vendor', 'products.product_price', 'products.product_weight', 'products.product_discount', 'category.category_name')
			->where('products.product_status', 'Active')
			->limit(30)
			->inRandomOrder()
			->get();
	}

	public function search($keyword)
	{
		return $this->join('category', 'category.id', '=', 'products.category_id')
			->select('products.id', 'products.product_name', 'products.product_content', 'products.product_image', 'products.product_slug', 'products.product_image_url', 'products.product_vendor', 'products.product_price', 'products.product_weight', 'products.product_discount', 'category.category_name')
			->where('products.product_name', 'LIKE', '%' . $keyword . '%')
			->orWhere('category.category_name', 'LIKE', '%' . $keyword . '%')
			->where('products.product_status', 'Active')
			->inRandomOrder()
			->get();
	}

	public function productByCategoryGuest($categoryId, $currentProductId)
	{
		return $this->join('category', 'category.id', '=', 'products.category_id')
			->select('products.id', 'products.category_id', 'products.product_name', 'products.product_content', 'products.product_image', 'products.product_slug', 'products.product_image_url', 'products.product_vendor', 'products.product_price', 'products.product_weight', 'products.product_discount', 'category.category_name')
			->where('products.product_status', 'Active')
			->where('products.category_id', $categoryId)
			->where('products.id', '!=', $currentProductId)
			->limit(5)
			->inRandomOrder()
			->get();
	}

	public function productByCategoryPage($category = null)
	{
		return $this->join('category', 'category.id', '=', 'products.category_id')
			->select('products.id', 'products.category_id', 'products.product_name', 'products.product_content', 'products.product_image', 'products.product_slug', 'products.product_image_url', 'products.product_vendor', 'products.product_price', 'products.product_weight', 'products.product_discount', 'category.category_name')
			->where('products.product_status', 'Active')
			->where('category.category_slug', $category)
			->inRandomOrder()
			->get();
	}

	public function singleProduct($id)
	{
		return $this->join('category', 'category.id', '=', 'products.category_id')
			->where('products.id', $id)
			->select('products.*', 'category.category_name')
			->first();
	}

	public function singleProductGuest($slug)
	{
		return $this->join('category', 'category.id', '=', 'products.category_id')
			->select('products.id', 'products.category_id', 'products.product_name', 'products.product_content', 'products.product_slug', 'products.product_image', 'products.product_image_url', 'products.product_vendor', 'products.product_price', 'products.product_quantity', 'products.product_weight', 'products.product_discount', 'category.category_name')
			->where('products.product_status', 'Active')
			->where('products.product_slug', $slug)
			->first();
	}
}
