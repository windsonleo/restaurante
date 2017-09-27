<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>




<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/pagamento/movimentacao" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Pagamento</a> >> <a href="#">Movimentação Pagamento </a>>> <a href="#" class="current">Cadastro Pagamento</a> </div>
    <h1>Cadastro de Pagamento</h1>
  </div>
  <div class="container-fluid"><hr>
  
    <c:if test="${erros != null }">
            <div class="alert alert-error alert-block"> <a class="close" data-dismiss="alert" href="#">×</a>
              <h4 class="alert-heading">Erros!</h4>
              
              ${erros}
            </div>
            
    </c:if>
    
      <c:if test="${mensagem != null }">
            <div class="alert alert-success alert-block"> <a class="close" data-dismiss="alert" href="#">×</a>
              <h4 class="alert-heading">Sucesso!</h4>
              
              ${mensagem}
            </div>
            
    </c:if>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Cadastro de Pagamento</h5>
          </div>
          
          
          <div class="widget-content nopadding">
          
          
                   <form action="${pageContext.request.contextPath}/pagamento/localizarpedido?id=${pedidovenda.id}" method="get" class="form-horizontal">
              
               <div class="control-group">
                <label class="control-label">Número do Pedido</label>
                <div class="controls">
							<input id="id" name="id" class="span4"
							type="text" value="${pedidovenda.id }"
							placeholder="Digite o Número do Pedido de Venda" />                
              
               	            <button type="submit" class="btn btn-sm btn-success" onClick="javascript:window.location='localizarpedido'">Loc Pedido</button>
              
              </div>
              
              </div>
              

              </form>
          
          
          
          <div class="widget-content nopadding">
          
                  <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Detalhes do Pedido Venda : ${pedidovenda.id}</h5>
          </div>
          
<%-- 		     <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/pagamento/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate"> --%>
		
						<div class="control-group">
							<label class="control-labe">Código</label>
							<div class="controls">
							<input id="id" name="id" type="text" class="span2" value="${pedidovenda.id }" readonly="readonly"> 
							<input id="data" name="data" type="text" class="span2" value="${pedidovenda.data }" readonly="readonly"> 
							<input id="status" name="status" type="text" class="span3" value="${pedidovenda.status }" readonly="readonly"> 
							
							
							</div>
						</div>

              
              
              <div class="control-group">
                <label class="control-label">Cliente</label>
                <div class="controls">
				<input id="cliente" name="cliente" type="text" class="span4" value="${pedidovenda.cliente }" readonly="readonly"> 
				<input id="mesa" name="mesa" type="text" class="span2" value="${pedidovenda.mesa }" readonly="readonly"> 
				<input id="garcon" name="garcon" type="text" class="span3" value="${pedidovenda.garcon }" readonly="readonly"> 
				
				
                </div>
              </div>							
            
              <div class="control-group">
                <label class="control-label">Total</label>
                <div class="controls">
				
					<input id="total" name="total" type="text" class="form-control" value="${pedidovenda.total}" size="20px" style="color: blue; font-size: 15px" readonly="readonly"> 
				
                </div>
              </div>							
						
																	
		</div>

			
				
		          <div class="widget-content nopadding">
          
           <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Adicionar Forma de Pagamento</h5>
          </div>
			
			 <form action="${pageContext.request.contextPath}/pagamento/adicionarformapagamentopagamento" method="post" class="form-horizontal">
			 		    
          <div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
     				<select id="formaPagamentos"name="formaPagamentos" multiple="multiple" class="span6" >
	                                  <optgroup label="Formas de Pagamento">
		           				
<%-- 		           					<option value="${pagamento.formaPagamentos}">${pagamento.formaPagamentos}</option> --%>
		           				
		           				
		           					<c:forEach var="formapagamento" items="${formapagamentoList}">
		           			
		           				<option value="${formapagamento.id}">${formapagamento.nome}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>	
	                    	                    <button type="submit" class="btn  btn-success" onClick="javascript:window.location='adicionarformapagamentopagamento'">Add</button>
	                    
	         		
				
                </div>
              </div>
                    
							
		</form>	
							
									
			
					<div class="table-responsive">
                            <table class="table table-bordered data-table">
                            
                                <thead>
                                    <tr>
                                        <th>Id</th>
									    <th>Nome</th>
									    <th>Tipo</th>
									    <th>Parcela</th>
									    <th>% Desconto</th>
									    <th>Valor</th>
									    
									     <th>Ativo?</th>
<!-- 									     <th>Pagamentos</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="formapagamento" items="${formas}" varStatus="id">

<%-- 		<c:choose> --%>
		
<%-- 		  <c:when test="${formapagamento.id % 2 == 0}"> --%>
  
  <tr class="gradeX">

			      <td>${formapagamento.id}</td>
                  <td>${formapagamento.nome}</td>
                  <td ><input type="text" value="${formapagamento.tipo}"></td>
                  <td><input type="text" value="${formapagamento.parcelas}"></td>
                   <td>${formapagamento.percdesconto}</td>
                    <td><input name="valorpagoform" type="text" value="" class="effect soma" onkeyup="up(this)" onBlur="calculapagamento();"/></td>
                   <td>${formapagamento.isativo}</td>





								<td class="options-width">
								
							 
							
      								
      								<a
									href="${pageContext.request.contextPath}/formapagamento/informacao?id=${formapagamento.id}"
									title="informação" class="fa fa-info fa-2x"></a>
									
										<a
									href="${pageContext.request.contextPath}/formapagamento/editar?id=${formapagamento.id}"
									title="editar" class="fa fa-pencil fa-2x"></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/formapagamento/delete?id=${formapagamento.id}"
									title="deletar" class="fa fa-remove fa-2x"></a>
										
								</td>
								
								</tr>
			  
			 

                </c:forEach>                    
                                
                                
                                
                                
                                
                           
                                </tbody>
                            </table>
                        </div>
			
			
			</div>
			
			
          
          <div class="widget-content nopadding">
          
                  <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Detalhes do Pagamento</h5>
          </div>
			
			 <form  role="form" id="ds" class="form-horizontal" action="${pageContext.request.contextPath}/pagamento/add" ModelAttribute="pagamento" method="POST">
			
			
			              <div class="control-group">
                <label class="control-label">Id do Pedido</label>
                <div class="controls">
				
				<input id="pedidos" class="span2" name="pedidos" type="text" value="${pedidovenda}" placeholder="Digite o Pedido de Venda"/>
				<input id="id" class="span2" name="id" type="text" value="${pagamento.id}" placeholder="Digite o Id"/>
				
				<input id="datapagamento" class="span4" name="datapagamento" type="datetime" value="${pagamento.datapagamento}" placeholder="Digite o Data"/>
				
				<input id="status" class="span4" name="status" type="text" value="${pagamento.status}" placeholder="Digite Status"/>
				
				
                </div>
              </div>
			
		
					
					
			 <div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
 					<select id="caixa" name="caixa"
					multiple="multiple" class="form-control">
						<optgroup label="Selecione o Caixa">

							<option value="${pagamento.caixa}">${pagamento.caixa}</option>


							<c:forEach var="caixa" items="${caixaList}">

								<option value="${caixa.id}">${caixa.nome}</option>


							</c:forEach>
						</optgroup>
				</select>
					
<select id="formaPagamentos" name="formaPagamentos"
					multiple="multiple" class="form-control">
						<optgroup label="Confira as Formas de Pagamento">

							<c:forEach var="f" items="${formas}">

								<option value="${f.id}" selected="selected">${f.nome}</option>


							</c:forEach>
						</optgroup>
				</select>				
										
				
                </div>
              </div>
					
				
              <div class="control-group">
                <label class="control-label">Valor Total</label>
                <div class="controls">
						<input id="valorTotalPagamento" class="form-control" name="valorTotalPagamento" type="text" value="${pedidovenda.total}" placeholder="Digite a Total"/>
						<input id="valorPago" class="effect" name="valorPago" type="text" value="${pagamento.valorPago}" placeholder="valor pago"/>					
						<input id="restante" class="effect" name="restante" type="text" value="" placeholder="restante" />					
				
				
                </div>
              </div>
              
              	 	 	
		 	 	   <div class="form-actions">
                <input type="submit" value="Inserir" class="btn btn-success">
              </div>						
			
			</form>
			
			</div>
		</div>
          

           
              
              
            </div>
            </div>
            </div>
            </div>
            

      
<div class="row-fluid">
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Soluções em Tecnologia</a> </div>
</div>
