<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true"%>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Caixa</a> <a href="#">Movimenta��o Caixa </a><a href="#" class="current">Fechar Caixa</a> </div>
    <h1>Fechamento de Caixa ${caixa.id}</h1>
  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
			<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Movimentacao Caixa</h4>
                                    <p class="category">Todos</p>

                                </div>
                                
                                </br>
          
          
          <div class="widget-content ">
          		
					<form action="${pageContext.request.contextPath}/caixa/fechamentocaixa" method="get" >

               <div class="control-group" align="center">
                <label class="control-label"></label>
                <div class="controls">
							<input id="dataini" name="dataini" class="form-control"
							type="text" value=" <fmt:formatDate pattern="dd/MM/yyyy"
                                             value="${pedidovenda.data}"/>"
							placeholder="Digite a Data" />
							
				
							
				 </div>
				 
				 	<button type="submit"class="btn btn-sm btn-success" onClick="window.location='fechamentocaixa'">Fechar Caixa</button>
					<button type="button"class="btn btn-sm btn-success">Imprimir Caixa</button>
              </div>
						

						
								
						
						</form>			

				
				</div>






			<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Detalhes dos Pedidos de Venda</h4>
                                    <p class="category">Todos</p>

                                </div>
                                
                                </br>
        <ul> 
          
     <li class="content"> <span>Quantidade Pedidos ${pedidovendaList.size()}</span>
      <div class="progress progress-mini progress-primary active progress-striped">
        <div style="width: 77%;" class="bar"></div>
      </div>
    </li>
    
         <li class="content"> <span>Quantidade Pedidos Cancelados ${pedidoVendaListacancelados.size()}</span>
      <div class="progress progress-mini progress-primary active progress-striped">
        <div style="width: 77%;" class="bar"></div>
      </div>
    </li>
    
             <li class="content"> <span>Quantidade Pedidos Internet ${pedidoVendaListainternet.size()}</span>
      <div class="progress progress-mini progress-primary active progress-striped">
        <div style="width: 77%;" class="bar"></div>
      </div>
    </li>
    
                 <li class="content"> <span>Quantidade Pedidos Mesa ${pedidoVendaListamesa.size()}</span>
      <div class="progress progress-mini progress-primary active progress-striped">
        <div style="width: 77%;" class="bar"></div>
      </div>
    </li>
    
                 <li class="content"> <span>Quantidade Pedidos Balc�o${pedidoVendaListabalcao.size()}</span>
      <div class="progress progress-mini progress-primary active progress-striped">
        <div style="width: 77%;" class="bar"></div>
      </div>
    </li>
    
                 <li class="content"> <span>Quantidade Pedidos Televendas ${pedidoVendaListatelevendas.size()}</span>
      <div class="progress progress-mini progress-primary active progress-striped">
        <div style="width: 77%;" class="bar"></div>
      </div>
    </li>
    
    
    
    </ul> 
          
			
			
			</div>
			
	
		
		<div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Detalhes do Pagamento  Total ${total }</h5>
          </div>
				 	  
			  <ul>
			 
			   <c:forEach var="formapagamento" items="${formapagamentoList}" varStatus="id">
			     
			     
	<li class="content"> <span>${formapagamento.nome} ${formapagamento.pagamentos }</span>
      <div class="progress progress-mini progress-primary active progress-striped">
        <div style="width: 77%;" class="bar"></div>
      </div>
    </li>
			     
                
               			  
			  </c:forEach>
			  
			  </ul>
			  
			   </div>
		
		
		
		<div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Detalhes das Despesas</h5>
          </div>
				
		 <ul>
			   <c:forEach var="despesa" items="${despesaList}" varStatus="id">
			     
	<li class="content"> <span>${despesa.nome} ${total }</span>
      <div class="progress progress-mini progress-primary active progress-striped">
        <div style="width: 77%;" class="bar"></div>
      </div>
    </li>
			                     
               			  
			  </c:forEach>
			  
			  </ul>
			   </div>
		
		
		
		<div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Detalhes dos Descontos</h5>
          </div>

			 <ul>
			   <c:forEach var="formapagamento" items="${formapagamentoList}" varStatus="id">
			     
			     
	<li class="content"> <span>${formapagamento.nome} ${total }</span>
      <div class="progress progress-mini progress-primary active progress-striped">
        <div style="width: 77%;" class="bar"></div>
      </div>
    </li>			     
			     
			     
			     
                
               			  
			  </c:forEach>
			  </ul>
			   </div>
			   
			   
			
		</div>

	
</div>
</div>
</div>
</div>




