<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Intervention\Image\Facades\Image;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
       $customer =  DB::table('customers')->orderBy('id', 'DESC')->get();
       return response()->json($customer);
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
            'name' =>'required|unique:customers|max:255',
            'email' =>'required',
            'phone' =>'required|unique:customers'
        ]);

        if($request->photo){
            $position = strpos($request->photo, ';');
            $sub = substr($request->photo, 0, $position);
            $ext = explode('/', $sub)[1];

            $name = time().".".$ext;
            $img = Image::make($request->photo)->resize(240,200);
            $upload_path = 'admins/customer/';
            $img_url = $upload_path.$name;
            $img->save($img_url);

            $customer = new Customer();
            $customer->name = $request->name;
            $customer->email = $request->email;
            $customer->phone = $request->phone;
            $customer->address = $request->address;
            $customer->photo = $img_url;

            $customer->save();
        }else{
            $customer = new Customer();
            $customer->name = $request->name;
            $customer->email = $request->email;
            $customer->phone = $request->phone;
            $customer->address = $request->address;
           

            $customer->save();

        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $customer = DB::table('customers')->where('id', $id)->first();
        return response()->json($customer);
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
        $data['address'] = $request->address;
        $image = $request->newphoto;

        if($image){
            $position = strpos($image, ';');
            $sub = substr($image, 0, $position);
            $ext = explode('/', $sub)[1];

            $name = time().".".$ext;
            $img = Image::make($image)->resize(240,200);
            $upload_path = 'admins/customer/';
            $img_url = $upload_path.$name;
            $success =  $img->save($img_url);

            if($success){
                $data['photo'] = $img_url;
                $img = DB::table('customers')->where('id', $id)->first();
                $image_path = $img->photo;
                $done = unlink($image_path);
                $user = DB::table('customers')->where('id', $id)->update($data);
            }

        }else{
            $oldPhoto = $request->photo;
            $data['photo'] = $oldPhoto;
            $user = DB::table('customers')->where('id', $id)->update($data);
        }

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $customer = DB::table('customers')->where('id',$id)->first();
        $photo = $customer->photo;

        if($photo){
            unlink($photo);
            DB::table('customers')->where('id',$id)->delete();
        }else{
         DB::table('customers')->where('id',$id)->delete();

        }
    }
}
