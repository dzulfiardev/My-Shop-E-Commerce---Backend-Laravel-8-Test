<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Orders extends Model
{
	use HasFactory;
	protected $guarded = [];
	protected $table = 'orders';
	protected $primaryKey = 'id';
	protected $fillable = [
		'user_id',
		'session_id',
		'order_uid',
		'order_transaction_id',
		'order_tracking_no',
		'order_courier',
		'order_token',
		'order_status',
		'order_sub_total',
		'order_item_discount',
		'order_tax',
		'order_shipping',
		'order_total',
		'order_promo',
		'order_discount',
		'order_grand_total',
		'order_first_name',
		'order_last_name',
		'order_phone',
		'order_email',
		'order_country',
		'order_province',
		'order_city',
		'order_address',
		'order_zip_postal',
	];

	public function uid()
	{
		$max = $this->max('id') + 1;
		return 'OID' . sprintf('%05s', $max);
	}

	public function user()
	{
		return $this->belongsTo(User::class);
	}

	public function products()
	{
		return $this->belongsToMany(Product::class)->withPivot('orders_detail_quantity');
	}

	public function orders()
	{
		return $this->join('users', 'users.id', '=', 'orders.user_id')
			->select('orders.id', 'orders.user_id', 'orders.order_uid', 'orders.order_transaction_id', 'orders.order_status', 'orders.order_total', 'orders.order_grand_total', 'orders.created_at', 'users.email', 'users.user_fullname', 'users.user_image', 'users.user_image_url', 'users.user_status')
			->get();
	}

	public function ordersProduct($ordersId)
	{
		return DB::table('orders_product')
			->join('products', 'products.id', '=', 'orders_product.product_id')
			->select('orders_product.id', 'orders_product.orders_id', 'orders_product.orders_detail_price', 'orders_product.orders_detail_quantity', 'orders_product.orders_detail_total_amount', 'orders_product.created_at', 'products.product_name', 'products.product_image', 'products.product_image_url', 'products.product_vendor', 'products.product_price', 'products.product_barcode')
			->where('orders_product.orders_id', $ordersId)
			->get();
	}
}
