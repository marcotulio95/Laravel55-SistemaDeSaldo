@extends('adminlte::page')

@section('title', 'Recarga')

@section('content_header')
	<h1>Tela de Recarga </h1>
    <ol class="breadcrumb">
    	<li><a href="">Dashboard</a></li>
    	<li><a href="">Saldo</a></li>
    	<li><a href="">Recarga</a></li>
    </ol>
@stop

@section('content')
    <div class="box">
    	<div class="box-header">
    		<h3>Fazer Recarga </h3>
    	</div>
    	<div class="box-body">
    		<form method="POST" action="{{ route('deposit.store')}}">
                
                {!! csrf_field() !!}

    			<div class="form-group">
    				<input type="text" class="form-control" name='valor_recarga' placeholder="Valor Recarga">
    			</div>
    			<div class="form-group">
    				<button type="submit" class="btn btn-success">Recarregar</button>
    			</div>
    		</form>
    	</div>
    </div>
@stop