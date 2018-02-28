@extends('adminlte::page')

@section('title', 'Histórico de Movimentações')

@section('content_header')
    <h1>Histórico</h1>
    <ol class="breadcrumb">
    	<li><a href="">Dashboard</a></li>
    	<li><a href="">Histórico</a></li>
    </ol>
@stop

@section('content')
    <div class="box">
    	<div class="box-header">
    		
    	</div>
    	<div class="box-body">
    		<table class="table table-bordered table-hover">
    			<thead>
    				<th>#</th>
    				<th>Valor</th>
    				<th>Tipo</th>
                    <th>Data</th>
    				<th>Origem/Destino</th>
    			</thead>
    			<tbody>
                    @forelse($historics as $historic)
    				<tr>
                        <td>{{ $historic->id }}</td>
                        <td>{{ number_format($historic->amount, 2, ',', '.')}}</td>
                        <td>{{$historic->type($historic->type)}}</td>
                        <td>{{$historic->date}}</td>
                        <td>{{$historic->userSender['name']}}</td>
                    </tr>
                    @empty
                    @endforelse
    			</tbody>
    		</table>
    	</div>
    </div>
@stop  