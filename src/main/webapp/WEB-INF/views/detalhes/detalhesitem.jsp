<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Pedido</a>>> <a href="#">Movimentação Pedido</a> >><a href="#" class="current">Detalhes Pedido</a> </div>
    <h1>Detalhes do Item ${item.id }</h1>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Detalhes da Item</h5>
          </div>
          <div class="widget-content nopadding">
  
											
						<div class="form-group">
						
						<div class="col-xs-12">
						
						 <div class="form-inline">
						 
							<label>Código</label>	
							<input id="id" name="id" type="text" class="form-control" value="${item.id }" disabled="disabled"> 
							<label>Descrição</label>	
							<input id="descricao" name="descricao" type="text" class="form-control" value="${item.descricao }" disabled="disabled"> 
							<label>Qtd</label>
							<input id="qtd" name="qtd" type="text" class="form-control" value="${item.qtd }" disabled="disabled"> 
							<label>Total</label>
							<input id="totalItem" name="totalItem" type="text" class="form-control" value="${item.totalItem }" size="20px" style="color: blue; font-size: 15px" disabled="disabled"> 
						
<%-- 							<input id="total" name="total" type="text" class="form-control" value="${item.pedidos}">  --%>
								
								</div>

							</div>




						</div>

					</div>
				</div>


			</div>
			
			<a href='javascript:history.back(1)' class="btn btn-sm btn-info" >Voltar</a>
		</div>
		
                   	
		
	</div>

</div>

</div>



