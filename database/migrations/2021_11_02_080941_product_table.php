<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ProductTable extends Migration
{
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('category', function (Blueprint $table) {
			$table->id();
			$table->string('category_uid');
			$table->string('category_name');
			$table->string('category_slug')->unique();
			$table->string('category_content')->nullable();
		});

		Schema::create('products', function (Blueprint $table) {
			$table->id();
			$table->unsignedBigInteger('category_id');
			$table->string('product_uid')->unique();
			$table->string('product_name');
			$table->string('product_slug')->unique();
			$table->text('product_content')->nullable();
			$table->string('product_image')->default('default.jpg');
			$table->string('product_vendor');
			$table->string('product_type');
			$table->double('product_price', 10, 2)->default(0);
			$table->double('product_weight', 4, 2)->default(0);
			$table->double('product_discount', 4, 2)->default(0);
			$table->integer('product_quantity')->default(0);
			$table->string('product_barcode')->default(0);
			$table->enum('product_status', ['Active', 'Inactive'])->default('Active');
			$table->timestamps();

			$table->foreign('category_id')->references('id')->on('category')->onUpdate('cascade')->onDelete('cascade');
		});

		Schema::create('product_image', function (Blueprint $table) {
			$table->id();
			$table->unsignedBigInteger('product_id');
			$table->string('image_name')->nullable();
			$table->timestamps();

			$table->foreign('product_id')->references('id')->on('users')->onUpdate('cascade')->onDelete('cascade');
		});

		Schema::create('product_variant', function (Blueprint $table) {
			$table->id();
			$table->unsignedBigInteger('product_id');
			$table->string('product_variant_title');
			$table->string('proudct_variant_value');
			$table->integer('product_variant_quantity');
			$table->timestamps();

			$table->foreign('product_id')->references('id')->on('products')->onUpdate('cascade')->onDelete('cascade');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::dropIfExist('category');
		Schema::dropIfExist('products');
		Schema::dropIfExist('product_image');
		Schema::dropIfExist('product_variant');
	}
}
