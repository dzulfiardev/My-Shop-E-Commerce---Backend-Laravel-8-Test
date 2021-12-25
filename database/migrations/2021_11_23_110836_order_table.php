<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class OrderTable extends Migration
{
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('orders', function (Blueprint $table) {
			$table->bigIncrements('id');
			$table->integer('user_id')->nullable();
			$table->string('session_id')->nullable();
			$table->string('order_uid')->unique();
			$table->string('order_token')->nullable();
			$table->enum('order_status', ['Processed', 'Delivered', 'Accepted', 'Rejected', 'Refund'])->default('Processed');
			$table->double('order_sub_total', 10, 2)->default(0);
			$table->double('order_item_discount', 10, 2)->default(0);
			$table->double('order_tax', 10, 2)->default(0);
			$table->double('order_shipping', 10, 2)->default(0);
			$table->double('order_total', 10, 2)->default(0);
			$table->double('order_promo', 10, 2)->default(0);
			$table->double('order_discount', 10, 2)->default(0);
			$table->double('order_grand_total', 10, 2)->default(0);
			$table->string('order_first_name');
			$table->string('order_last_name');
			$table->string('order_phone')->nullable();
			$table->string('order_email');
			$table->string('order_country');
			$table->string('order_province');
			$table->string('order_city');
			$table->string('order_address');
			$table->string('order_zip_postal');
			$table->timestamps();
		});

		Schema::create('orders_detail', function (Blueprint $table) {
			$table->bigIncrements('id');
			$table->unsignedBigInteger('orders_id');
			$table->unsignedBigInteger('product_id');
			$table->string('orders_detail_uid');
			$table->double('orders_detail_price', 10, 2)->default(0);
			$table->double('orders_detail_discount', 10, 2)->default(0);
			$table->integer('orders_detail_quantity');
			$table->timestamps();

			$table->foreign('orders_id')->references('id')->on('orders')->onUpdate('cascade')->onDelete('cascade');
			$table->foreign('product_id')->references('id')->on('products');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::dropIfExists('orders');
		Schema::dropIfExists('orders_detail');
	}
}
