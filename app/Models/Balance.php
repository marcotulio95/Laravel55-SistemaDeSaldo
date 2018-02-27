<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Balance extends Model
{
    //
    public $timestamps = false;

    public function deposit($value){
    	$this->amoount += number_format($value, 2, '.', '');
    	$deposit = $this->save();

    	if ($deposit)
    		return ['success' => true,'message' => "Sucesso ao recarregar"];

    	return ['success' => false,'message' => "Falha ao recarregar"];
    }
}
