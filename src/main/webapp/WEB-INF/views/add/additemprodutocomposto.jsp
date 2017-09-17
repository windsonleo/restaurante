<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Pedido Venda</a> >> <a href="#">Movimentação Pedido Venda </a>>> <a href="#" class="current">Add Item ao Pedido Venda </a> </div>
    <h1>Add Item ao Produto Composto <strong> ${produtocomposto.id }</strong></h1>
  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Buscar Produto</h5>
           
          </div>
          <div class="widget-content nopadding">               
			<form action="salvaritemprodutocomposto" method="GET" class="form-horizontal">		
  
				<div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
			   <div class="form-inline"> 
			
								<input type="text" list="${produtosList}" id="id" placeholder="Escolha a Produto" name="id" autocomplete="off" class="form-horizontal">
								
									
									<datalist id="${produtosList}">
								
									 	<c:forEach var="produto" items="${produtosList}" varStatus="id">
										
											  <option  value="${produto.id }"> ${produto.nome } </option>
										
										  </c:forEach>
								  
								  
									</datalist>
									
										<input type="text"  id="idprocomp" name="idprocomp"  class="form-horizontal" value="${produtocomposto.id }" placeholder="Escolha a Quantidade">

					
							
								<input type="submit" class="btn btn-lg btn-success"
										value="ADD">
											
			   
			    </div>
              </div>


									
									
									
								
              </div>
              
              
                                
							</form>
							
			 							 
			 		
					 
                        </div>
                        
                        
                        
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Detalhes do Produto Composto : ${produtocomposto.id} <strong> ${produtocomposto.id }</strong></h5>
           
          </div>
                    <div class="widget-content nopadding">               
          
          					<div class="form-inline"> 
          
          			<div class="control-group">
          
          			<div class="controls">
						 
<!-- 							<label>Código</label>	 -->
<%-- 							<input id="id" name="id" type="text" class="form-control" value="${produtocomposto.id }">  --%>
<!-- 							<label>Data</label>	 -->
<%-- 							<input id="data" name="data" type="text" class="form-control" value="${produtocomposto.data }">  --%>
<!-- 							<label>Status</label> -->
<%-- 							<input id="status" name="status" type="text" class="form-control" value="${produtocomposto.status }">  --%>
<!-- 							<label>Mesa</label> -->
<%-- 							<input id="mesa" name="mesa" type="text" class="form-control" value="${produtocomposto.mesa }">  --%>
<!-- 							<label>Garcon</label> -->
<%-- 							<input id="garcon" name="garcon" type="text" class="form-control" value="${produtocomposto.garcon }">  --%>
							
<!-- 							<label>Cliente</label> -->
<%-- 							<input id="cliente" name="cliente" type="text" class="form-control" value="${produtocomposto.cliente }">  --%>
							
<!-- 							<label>Total</label> -->
<%-- 							<input id="total" name="total" type="text" class="form-control" value="${totalpedido}" size="20px" style="color: blue; font-size: 15px">  --%>
						
						
						     <div class="control-group">
                <label class="control-label">CodeBar</label>
                <div class="controls">
					<input id="codebar" class="form-control"
						name="codebar" type="text" value="${produtocomposto.codebar}"
						placeholder="Digite o CodeBar" />			
				
                </div>
              </div>
              
              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
					<input id="nome" class="form-control"
						name="nome" type="text" value="${produtocomposto.nome}"
						placeholder="Digite a Nome" />			
				
                </div>
              </div>
              <div class="control-group">
                    </div><label class="control-label">Descrição</label>
                <div class="controls">
					<input id="descricao" class="form-control"
						name="descricao" type="text" value="${produtocomposto.descricao}"
						placeholder="Digite a Descrição" />			
				
            
              </div>


              <div class="control-group">
                <label class="control-label">Categoria</label>
                <div class="controls">
					<select id="categoria" name="categoria"
						class="form-control">
							<optgroup label="Categoria">

<%-- 								<option value="${produtocomposto.categoria}"></option> --%>


								<c:forEach var="categoria" items="${categoriaList}">

									<option value="${categoria.id}">${categoria.nome}</option>


								</c:forEach>
							</optgroup>
					</select>				
				
                </div>
              </div>

					         <div class="control-group">
                <label class="control-label">Preço de Custo</label>
                <div class="controls">
						<input id="precocusto" class="form-control"
						name="precocusto" type="text" value="${produtocomposto.precocusto}"
						placeholder="Digite o Preco de Custo" />			
				
                </div>
              </div>          
              
              <div class="control-group">
                <label class="control-label">Preço de Venda</label>
                <div class="controls">
						<input id="precovenda" class="form-control"
						name="precovenda" type="text" value="${produtocomposto.precovenda }"
						placeholder="Digite o Preco de Venda" />				
				
                </div>
              </div>              
              
        	
						
						
						
						
						
						
						
						</div>
</div>
						</div>
						</div>

<!-- 			<a href='javascript:history.back(1)' class="btn btn-sm btn-info" >Voltar</a> -->
			
			</div>

 <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Itens do Produto Composto : <strong> ${produtocomposto.id }</strong></h5>
           
          </div>
     
     <div class="widget-content nopadding">               
       <div class="container-fluid">
     
		 <div class="table-responsive">
                            <table class="table table-bordered table-hover table-striped">
                            
                                <thead>
                                    <tr>
                                        <th>Descrição</th>
<!-- 									    <th>Código</th> -->
<!-- 									    <th>Descrição</th> -->
									    <th>Qtd</th>
<!-- 									    <th>Preço Custo</th> -->
<!-- 									    <th>Total Item</th> -->
<!-- 									    <th>Total Item</th> -->
									    
<!-- 									     <th>Ativo?</th> -->
<!-- 									     <th>Pagamentos</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="item" items="${produtocomposto.itens}" varStatus="id">

<%-- 		<c:choose> --%>
		
<%-- 		  <c:when test="${formapagamento.id % 2 == 0}"> --%>
  
  <tr class="gradeX">

<%--  					 <td>${item.id}</td> --%>
			      <td>${item.key}</td>
			    
			    
			    
			     <td>${item.value}</td>
			      
<%--                   <td>${item.codigo}</td> --%>
<%--                   <td>${item.descricao}</td> --%>
<%--                   <td><input name="qtd"type="text" value="${item.qtd}" class="effect soma" onkeyup="up(this)" onBlur="calculaitem();"></td> --%>
<%--                    <td> <input name="precounit" type="text" value="${item.precoUnitario}" /></td> --%>
<%--                     <td> <input name="precounit" type="text" value="${item.totalItem}" /></td> --%>
                    
<!--                     <td><input id="valoritemform"name="valoritemform" type="text" value="" class="effect soma" onkeyup="up(this)" onBlur="calculatotalitem();"/></td> -->
<%--                    <td>${item.isativo}</td> --%>





								<td class="options-width">
								
							 
							
      								
      								<a
									href="${pageContext.request.contextPath}/item/informacao?id=${item.key}"
									title="informação" class="fa fa-info fa-2x"></a>
									
										<a
									href="${pageContext.request.contextPath}/item/editar?id=${item.key}"
									title="editar" class="fa fa-pencil fa-2x"></a>
									
									
									<a href="#myAlert${item.key}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a>
									
			<div id="myAlert${item.key}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>Alerta de Exclusão</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/item/delete?id=${item.key}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>		
								
								
								
								
								
								
								
								</td>
								
								</tr>
			  
			 

                </c:forEach>                    
                                
                                
                                
                                
                                
                           
                                </tbody>
                            </table>
                        </div>
			
			
			</div>
		
	</div>
	
	</div>
	</div>
	</div>
	

</div>
</div>
</div>



