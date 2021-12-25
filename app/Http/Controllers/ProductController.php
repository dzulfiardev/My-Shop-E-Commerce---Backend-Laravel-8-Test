<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;
use App\Models\Category;
use App\Models\Product;

class ProductController extends Controller
{
	public function showAll()
	{
		$productModel = new Product();
		return $productModel->allProducts();
	}

	public function showAllGuest()
	{
		$productModel = new Product();
		return $productModel->allProductGuest();
	}

	public function showSingle($id)
	{
		$productModel = new Product();
		return response($productModel->singleProduct($id), 200);
	}

	public function showSingleGuest($slug)
	{
		$productModel = new Product();
		return response($productModel->singleProductGuest($slug), 200);
	}

	public function relatedProductByCategory($categoryId, $currentProductId)
	{
		$productModel = new Product();
		return response($productModel->productByCategoryGuest($categoryId, $currentProductId), 200);
	}

	public function productByCategory($category)
	{
		$productModel = new Product();
		if ($category == 'all-products') {
			return response($productModel->allProductGuest(), 200);
		} else {
			return response($productModel->productByCategoryPage($category), 200);
		}
	}

	public function webSearch($keyword)
	{
		$productModel = new Product();
		return response($productModel->search($keyword), 200);
	}

	public function create(Request $request)
	{
		$productModel = new Product();

		// Create Item
		if ($request->action == 'create') {
			$validator = Validator::make($request->all(), [
				'product_name' 				=> 'required',
				'product_content' 		=> 'nullable',
				'product_price' 			=> 'required|integer',
				'product_discount' 		=> 'nullable|numeric',
				'product_image' 			=> 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:1024',
				'product_quantity' 		=> 'required|integer',
				'product_barcode' 		=> 'required|string|unique:products',
				'product_weight' 			=> 'required',
				'product_status' 			=> 'required',
				'product_vendor'			=> 'required',
				'product_category'		=> 'required'
			]);

			if ($validator->fails()) {
				$msg = [
					'error' => $validator->errors()
				];
				return response()->json($msg, 422);
			}

			$image = $request->product_image;
			if ($image) {
				$imageName = $request->product_name . '-' . time() . '.' . $image->extension();
				$image->move(public_path('assets/image/product'), $imageName);
			} else {
				$imageName = 'default.jpg';
			}

			$product = Product::create(array_merge($validator->validated(), [
				'category_id'				=> $request->product_category,
				'product_uid' 			=> $productModel->uid(),
				'product_slug' 			=> Str::slug($request->product_name, '-'),
				'product_image' 		=> $imageName,
				'product_image_url' => url('assets/image/product/' . $imageName),
			]));

			$response = [
				'product' => $product,
				'success' => 'Success Add new product',
			];
		}

		// Update Item
		if ($request->action == 'update') {

			$product = Product::find($request->id);
			if ($product->product_barcode == $request->product_barcode) {
				$barcodeRules = 'nullable|string';
			} else {
				$barcodeRules = 'required|string|unique:products';
			}

			$validator = Validator::make($request->all(), [
				'product_name' 				=> 'required',
				'product_content' 		=> 'nullable',
				'product_price' 			=> 'required|numeric',
				'product_discount' 		=> 'nullable|numeric',
				'product_image' 			=> 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:1024',
				'product_quantity' 		=> 'required|integer',
				'product_barcode' 		=> $barcodeRules,
				'product_weight' 			=> 'required',
				'product_status' 			=> 'required',
				'product_vendor'			=> 'required',
				'product_category'		=> 'required'
			]);

			if ($validator->fails()) {
				$msg = [
					'error' => $validator->errors()
				];
				return response()->json($msg, 422);
			}

			$image = $request->product_image;
			if ($image) {
				$imageName = $request->product_name . '-' . time() . '.' . $image->extension();

				if ($request->old_image == 'default.jpg') {
					$image->move(public_path('assets/image/product'), $imageName);
				} else {
					$image->move(public_path('assets/image/product'), $imageName);
					File::delete('assets/image/product/' . $request->old_image);
				}
			} else {
				$imageName = $request->old_image;
			}

			$data = [
				'category_id' 			=> $request->product_category,
				'product_name' 			=> $request->product_name,
				'product_slug' 			=> Str::slug($request->product_name, '-'),
				'product_content' 	=> $request->product_content,
				'product_image' 		=> $imageName,
				'product_image_url' => url('assets/image/product/' . $imageName),
				'product_vendor' 		=> $request->product_vendor,
				'product_price' 		=> $request->product_price,
				'product_weight' 		=> $request->product_weight,
				'product_discount' 	=> $request->product_discount,
				'product_quantity' 	=> $request->product_quantity,
				'product_barcode' 	=> $request->product_barcode,
				'product_status' 		=> $request->product_status,
			];

			Product::where('id', $request->id)->update($data);

			$response = [
				'success' => 'Success Update Product',
			];
		}

		return response($response, 200);
	}

	public function destroy($id)
	{
		$product = Product::find($id);
		if ($product->product_status == 'Active') {
			return response([
				'activeItem' => 'Cannot Delete Active Item'
			], 200);
		}

		if (Product::destroy($id)) {
			if ($product->product_image != 'default.jpg') {
				File::delete('assets/image/product/' .  $product->product_image);
			}
			$msg = [
				'success' => 'Delete Product ' . $product->product_name . ' Succesced!',
			];
			return response($msg, 200);
		}
	}

	public function allCategory()
	{
		return response(Category::all(), 201);
	}

	public function testing()
	{
		$productModel = new Product();
		return $productModel->singleProduct(4);
	}
}
