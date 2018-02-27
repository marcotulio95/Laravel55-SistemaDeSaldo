@extends('adminlte::page')

@section('title', 'Saque')

@section('content_header')
	<h1>Tela de Transferência </h1>
    <ol class="breadcrumb">
    	<li><a href="">Dashboard</a></li>
    	<li><a href="">Saldo</a></li>
    	<li><a href="">Transferencia</a></li>
    </ol>
@stop

@section('content')
    <div class="box">
    	<div class="box-header">
    		<h3>Transferir saldo (Informe o destinatário) </h3>
    	</div>
    	<div class="box-body">
            @include('admin.includes.alerts')
            
    		<form method="POST" action="{{ route('confirm.transfer')}}">
                
                {!! csrf_field() !!}

    			<div class="form-group">
    				<input type="text" class="form-control" name='sender' placeholder="Informe nome ou e-mail">
    			</div>
    			<div class="form-group">
    				<button type="submit" class="btn btn-success">Próxima Etapa</button>
    			</div>
    		</form>
    	</div>
    </div>
@stop