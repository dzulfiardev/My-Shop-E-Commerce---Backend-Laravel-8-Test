<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Orders;

class OrdersController extends Controller
{
  protected $ordersModel;

  public function __construct()
  {
    $this->ordersModel = new Orders();
  }

  public function showOrders()
  {
    return response($this->ordersModel->orders(), 200);
  }

  public function singleOrder($id)
  {
    return response(Orders::find($id));
  }

  public function showOrdersProduct($ordersId)
  {
    return response($this->ordersModel->ordersProduct($ordersId), 200);
  }

  public function deliverOrder(Request $request)
  {
    $validator = Validator::make($request->all(), [
      'tracking_no' => 'required',
      'courier'     => 'required',
    ]);

    if ($validator->fails()) {
      $response = [
        'error' => $validator->errors(),
      ];
      return response()->json($response, 422);
    }

    $data = [
      'order_status'      => 'Delivered',
      'order_tracking_no' => $request->tracking_no,
      'order_courier'     => $request->courier
    ];

    Orders::where('id', $request->order_id)->update($data);

    $response = [
      'success' => 'Success update orders shipment'
    ];

    return response($response, 200);
  }
}
