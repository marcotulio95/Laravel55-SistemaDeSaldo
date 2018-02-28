@extends('adminlte::page')

@section('title', 'Saque')

@section('content_header')
	<h1>Tela de Transferência </h1>
    <ol class="breadcrumb">
    	<li><a href="">Dashboard</a></li>
    	<li><a href="">Saldo</a></li>
    	<li><a href="">Confirma Transferencia</a></li>
    </ol>
@stop

@section('content')
    <div class="box">
    	<div class="box-header">
    		<h3>Confirma tranferência de saldo </h3>
    	</div>
    	<div class="box-body">
            @include('admin.includes.alerts')
            
    		<form method="POST" action="{{ route('transfer.store')}}">
                
                {!! csrf_field() !!}

                <p><strong>Destinátario: </strong> {{ $sender->name }}</p>
                <p><strong>Saldo Atual: </strong> {{ number_format($balance->amoount, 2, '.',  '') }}</p>
    			
                <input type="hidden" name="sender_id" value="{{ $sender->id }}">

                <div class="form-group">
    				<input type="text" class="form-control" name='value' placeholder="Valor: ">
    			</div>
    			<div class="form-group">
    				<button type="submit" class="btn btn-success">Transferir</button>
    			</div>
    		</form>
    	</div>
    </div>
@stop