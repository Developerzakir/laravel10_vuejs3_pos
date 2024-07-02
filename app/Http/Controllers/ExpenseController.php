<?php

namespace App\Http\Controllers;

use App\Models\Expense;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ExpenseController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $expenses = Expense::all();
        return response()->json($expenses);
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
            'details' =>'required',
            'amount' =>'required',
        ]);

        $expense = new Expense();
        $expense->details = $request->details;
        $expense->amount  = $request->amount;
        $expense->expense_date  = date('d/m/y');
        $expense->save();
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $expense = DB::table('expenses')->where('id', $id)->first();
        return response()->json($expense);
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
        $data['details'] = $request->details;
        $data['amount']  = $request->amount;
        DB::table('expenses')->where('id',$id)->update($data);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        DB::table('expenses')->where('id',$id)->delete();
    }
}
