<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;
use App\User;


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

    public function withdraw($value)
    {
        if ($this->amoount < $value)
        {
            return ['success' => false,'message' => "Saldo Insuficiente para saque, Seu saldo Atual é de apenas: $this->amoount"];
        }

        DB::beginTransaction();


        $total_before = $this->amoount ? $this->amoount : 0;
        $this->amoount -= number_format($value, 2, '.', '');
        $withdraw = $this->save();

        $historic = auth()->user()->historics()->create([
            'type'         => 'O',
            'amount'      => $value,
            'total_before' => $total_before,
            'total_after'  => $this->amoount,
            'date'         => date('Ymd'),
        ]);
        if ($withdraw && $historic){
            DB::commit();
            return ['success' => true,'message' => "Sucesso ao retirar"];
        }else{

            DB::rollback();
            return ['success' => false,'message' => "Falha ao retirar"];

        }

    }

    public function transfer($value, User $sender)
    {
        if ($this->amoount < $value)
        {
            return ['success' => false,'message' => "Saldo Insuficiente para transferir, Seu saldo Atual é de apenas: ".number_format($this->amoount, 2, '.', '') ];
        }

        DB::beginTransaction();

        /***************************************************
        * Atauliza o proprio saldo 
        ***************************************************/

        $total_before = $this->amoount ? $this->amoount : 0;
        $this->amoount -= number_format($value, 2, '.', '');
        $transfer = $this->save();

        $historic = auth()->user()->historics()->create([
            'type'         => 'T',
            'amount'      => $value,
            'total_before' => $total_before,
            'total_after'  => $this->amoount,
            'user_id_transaction' => $sender->id,
            'date'         => date('Ymd'),
        ]);

        /***************************************************
        * Atauliza o saldo do recebedor 
        ***************************************************/
        
        $senderBalance = $sender->balance()->firstOrCreate([]);

        $total_beforeSender = $senderBalance->amoount ? $senderBalance->amoount : 0;
        $senderBalance->amoount += number_format($value, 2, '.', '');
        $transferSender = $senderBalance->save();

        $historicSender = $sender->historics()->create([
            'type'         => 'I',
            'amount'      => $value,
            'total_before' => $total_beforeSender,
            'total_after'  => $senderBalance->amoount,
            'user_id_transaction' => auth()->user()->id,
            'date'         => date('Ymd'),
        ]);

        if ($transferSender && $historicSender && $transfer && $historic ){
            DB::commit();
            return ['success' => true,'message' => "Sucesso ao transferir $value para $sender->name"];
        }else{

            DB::rollback();
            return ['success' => false,'message' => "Falha ao tentar transferir"];

        }

    }
}
