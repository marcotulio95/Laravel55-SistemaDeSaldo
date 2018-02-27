@extends('adminlte::page')

@section('title', 'Saque')

@section('content_header')
	<h1>Tela de Saque </h1>
    <ol class="breadcrumb">
    	<li><a href="">Dashboard</a></li>
    	<li><a href="">Saldo</a></li>
    	<li><a href="">Saque</a></li>
    </ol>
@stop

@section('content')
    <div class="box">
    	<div class="box-header">
    		<h3>Fazer Retirada </h3>
    	</div>
    	<div class="box-body">
            @include('admin.includes.alerts')
            
    		<form method="POST" action="{{ route('withdraw.store')}}">
                
                {!! csrf_field() !!}

    			<div class="form-group">
    				<input type="text" class="form-control" name='value' placeholder="Valor Retirada">
    			</div>
    			<div class="form-group">
    				<button type="submit" class="btn btn-danger">Sacar</button>
    			</div>
    		</form>
    	</div>
    </div>
@stop