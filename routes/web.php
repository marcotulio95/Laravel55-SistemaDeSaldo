<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

$this->group(['middleware' => ['auth'], 'namespace' => 'Admin', 'prefix' => 'admin'], function(){
	$this->get('/', 'AdminController@index')->name('admin.home');	
	$this->get('balance', 'BalanceController@index')->name('admin.balance');
	
	$this->get('deposit', 'BalanceController@deposit')->name('balance.deposit'); //Deposito 
	$this->post('deposit', 'BalanceController@depositStore')->name('deposit.store'); // StoreDeposito
	
	$this->get('withdraw', 'BalanceController@withdraw')->name('balance.withdraw'); // Saque
	$this->post('withdraw', 'BalanceController@withdrawStore')->name('withdraw.store'); // StoreSaque

	$this->get('transfer', 'BalanceController@transfer')->name('balance.transfer'); // Transferencia de Money
	$this->post('confirm-transfer', 'BalanceController@confirmTransfer')->name('confirm.transfer'); // ConfirmTranferencia
	

});


$this->get('/', 'Site\SiteController@index');


Auth::routes();

