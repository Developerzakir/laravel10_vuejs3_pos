<?php

use App\Http\Controllers\Api\EmployeeController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\ExpenseController;
use App\Http\Controllers\PosController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\SalaryController;
use App\Http\Controllers\SupplierController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function ($router) {
    Route::post('login', [AuthController::class, 'login']);
    Route::post('signup', [AuthController::class, 'signup']);
    Route::post('logout', [AuthController::class, 'logout']);
    Route::post('refresh', [AuthController::class, 'refresh']);
    Route::post('me', [AuthController::class, 'me']);
});

Route::apiResource('/employee', EmployeeController::class);
Route::apiResource('/supplier', SupplierController::class);
Route::apiResource('/category', CategoryController::class);
Route::apiResource('/product', ProductController::class);
Route::apiResource('/expense', ExpenseController::class);

Route::post('/salary/paid/{id}', [SalaryController::class, 'paid']);
Route::get('/salary', [SalaryController::class, 'allSalary']);
Route::get('/salary/view/{id}', [SalaryController::class, 'viewSalary']);
Route::get('/edit/salary/{id}', [SalaryController::class, 'editSalary']);
Route::post('/salary/update/{id}', [SalaryController::class, 'updateSalary']);

Route::post('/stock/update/{id}', [ProductController::class, 'stockUpdate']);

Route::apiResource('/customer', CustomerController::class);
Route::get('/getting/product/{id}', [PosController::class, 'getProduct']);


Route::post('/addtocart/{id}', [CartController::class, 'addToCart']);
Route::get('/cart/product', [CartController::class, 'cartProduct']);
Route::get('/remove/cart/{id}', [CartController::class, 'removeCart']);

Route::get('/increment/{id}', [CartController::class, 'increment']);
Route::get('/decrement/{id}', [CartController::class, 'decrement']);
Route::get('/vats', [CartController::class, 'vats']);





