<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class Balance extends Model
{
    //
    public $timestamps = false;

    public function deposit($value)
    {
    	DB::beginTransaction();

    	$total_before = $this->amoount ? $this->amoount : 0;
    	$this->amoount += number_format($value, 2, '.', '');
    	$deposit = $this->save();

    	$historic = auth()->user()->historics()->create([
    		'type'         => 'I',
    		'amount'      => $value,
    		'total_before' => $total_before,
    		'total_after'  => $this->amoount,
    		'date' 		   => date('Ymd'),
    	]);
    	if ($deposit && $historic){
    		DB::commit();
    		return ['success' => true,'message' => "Sucesso ao recarregar"];
    	}else{

			DB::rollback();
			return ['success' => false,'message' => "Falha ao recarregar"];

    	}
    }
}
