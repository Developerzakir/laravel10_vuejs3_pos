<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PosController extends Controller
{
    public function getProduct($id)
    {
        $product = DB::table('products')
                 ->where('category_id',$id)
                 ->get();
        return response()->json($product);

    } //end method
}
