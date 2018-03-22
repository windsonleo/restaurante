<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<div id="content">

		<h3>Finalizacao de Venda</h3>
	
	
	<div id="form">

	<form id="formVenda" action="AddVenda" method="POST">


		<div id="blink" name="blink"><h1>Venda Finalizada</h1></div>

			
			<div id="cupom">
			
			<p class="">Cupom Nãp Fiscal</p>
			<p class="">${empresa.nomefantasia }</p>
			<div class="">Data</div>
			<p class="">Itens</p>
			<div class="">nome</div>
			<div class="">valor unitario</div>
			<div class="">qtd</div>
			<div class="">total item</div>
			<div class="">total Cupom</div>
			<div class="">valor pago</div>
			<div class="">troco</div>
			
			</div>
		


	</form>

</div>


</div>
<!--  end content-table-inner  -->






