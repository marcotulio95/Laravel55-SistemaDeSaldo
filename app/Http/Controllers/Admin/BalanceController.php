<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Balance;
use App\Http\Requests\MoneyValidationFormRequest;

class BalanceController extends Controller
{
    //
    public function index(){

    	$balance = auth()->user()->balance;
		$amount  = $balance ? $balance->amoount : 0 ;
    	return view('admin.balance.index', compact('amount'));
    }

    public function deposit(){
    	return view('admin.balance.deposit');
    }

    public function depositStore(MoneyValidationFormRequest $request){
    	
        $balance  =  auth()->user()->balance()->firstOrCreate([]);
        $response = $balance->deposit($request->input('valor_recarga'));

        if($response['success']){
            return redirect()->route('admin.balance')->with('success', $response['message']);    
        }
     return redirect()->back()->with('error', $response['message']);
    }
}
