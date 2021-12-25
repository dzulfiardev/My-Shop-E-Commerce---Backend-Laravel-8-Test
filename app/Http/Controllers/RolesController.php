<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Roles;

class RolesController extends Controller
{
	public function showAll()
	{
		return response(Roles::all(), 200);
	}
}
