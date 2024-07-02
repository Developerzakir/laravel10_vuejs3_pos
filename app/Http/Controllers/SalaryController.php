<?php

namespace App\Http\Controllers;

use App\Models\Salary;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SalaryController extends Controller
{
    public function paid(Request $request, $id)
    {
        $validateData = $request->validate([
            'salary_month' =>'required',
        ]);

        $Month = $request->salary_month;
        $check = DB::table('salaries')->where('employee_id',$id)->where('salary_month', $Month)->first();
        if($check){
            return response()->json('Salary Already Paid');
        }else{
            $data = array();
            $data['employee_id'] =  $id;
            $data['amount'] =  $request->salary;
            $data['salary_date'] = date('d/m/Y');
            $data['salary_month'] = $Month;
            $data['salary_year'] = date('Y');
            DB::table('salaries')->insert($data);

        }

       
    } //end method

    public function allSalary()
    {
        $allSalary = DB::table('salaries')->select('salary_month')->groupBy('salary_month')->get();
        return response()->json($allSalary);

    } //end method

    public function viewSalary($id)
    {
        $month = $id;

        $view = DB::table('salaries')
           ->join('employees', 'salaries.employee_id', 'employees.id')
           ->select('employees.name', 'salaries.*')
           ->where('salaries.salary_month', $month)
           ->get();

           return response()->json($view);

    } //end method


    public function editSalary($id)
    {
        $edit = DB::table('salaries')
        ->join('employees', 'salaries.employee_id', 'employees.id')
        ->select('employees.name',  'employees.email','salaries.*')
        ->where('salaries.id', $id)
        ->first();

        return response()->json($edit);

    } //end method

    public function updateSalary(Request $request, $id)
    {
        $data = array();
        $data['employee_id'] = $request->employee_id;
        $data['amount'] = $request->amount;
        $data['salary_month'] = $request->salary_month;

        DB::table('salaries')->where('id', $id)->update($data);

    } //end method
}
