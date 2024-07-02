<?php

namespace App\Http\Controllers;

use App\Models\Supplier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Intervention\Image\Facades\Image;

class SupplierController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $supplier = Supplier::all();
        return response()->json($supplier);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validateData = $request->validate([
            'name' =>'required|unique:suppliers|max:255',
            'email' =>'required',
            'phone' =>'required|unique:suppliers'
        ]);
      

        if($request->photo){
            $position = strpos($request->photo, ';');
            $sub = substr($request->photo, 0, $position);
            $ext = explode('/', $sub)[1];

            $name = time().".".$ext;
            $img = Image::make($request->photo)->resize(240,200);
            $upload_path = 'admins/supplier/';
            $img_url = $upload_path.$name;
            $img->save($img_url);

            $supplier = new Supplier();
            $supplier->name = $request->name;
            $supplier->email = $request->email;
            $supplier->phone = $request->phone;
            $supplier->address = $request->address;
            $supplier->shopname = $request->shopname;
            $supplier->photo = $img_url;

            $supplier->save();
        }else{
            $supplier = new Supplier();
            $supplier->name = $request->name;
            $supplier->email = $request->email;
            $supplier->phone = $request->phone;
            $supplier->address = $request->address;
            $supplier->shopname = $request->shopname;
            $supplier->save();

        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $supplier = DB::table('suppliers')->where('id', $id)->first();
        return response()->json($supplier);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $data = array();
        $data['name'] = $request->name;
        $data['email'] = $request->email;
        $data['phone'] = $request->phone;
        $data['shopname'] = $request->shopname;
        $data['address'] = $request->address;
        $image = $request->newphoto;

        if($image){
            $position = strpos($image, ';');
            $sub = substr($image, 0, $position);
            $ext = explode('/', $sub)[1];

            $name = time().".".$ext;
            $img = Image::make($image)->resize(240,200);
            $upload_path = 'admins/supplier/';
            $img_url = $upload_path.$name;
            $success =  $img->save($img_url);

            if($success){
                $data['photo'] = $img_url;
                $img = DB::table('suppliers')->where('id', $id)->first();
                $image_path = $img->photo;
                $done = unlink($image_path);
                $user = DB::table('suppliers')->where('id', $id)->update($data);
            }

        }else{
            $oldPhoto = $request->photo;
            $data['photo'] = $oldPhoto;
            $user = DB::table('suppliers')->where('id', $id)->update($data);
        }

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $supplier = DB::table('suppliers')->where('id',$id)->first();
        $photo = $supplier->photo;

        if($photo){
            unlink($photo);
            DB::table('suppliers')->where('id',$id)->delete();
        }else{
         DB::table('suppliers')->where('id',$id)->delete();      

        }
    }
}
