<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true"%>


<div id="content">
  <div id="content-header">

  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
			<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Fechar Caixa</h4>
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
				 
				 	<button type="submit"class="btn btn-sm btn-success">Fechar Caixa</button>
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
          
     <li class="content"> <span>Quantidade Pedidos </span>
      <div class="progress progress-mini progress-primary active progress-striped">
        <div style="width: 77%;" class="bar"></div>
      </div>
    </li>
    
         <li class="content"> <span>Quantidade Pedidos Cancelados </span>
      <div class="progress progress-mini progress-primary active progress-striped">
        <div style="width: 77%;" class="bar"></div>
      </div>
    </li>
    
             <li class="content"> <span>Quantidade Pedidos Internet </span>
      <div class="progress progress-mini progress-primary active progress-striped">
        <div style="width: 77%;" class="bar"></div>
      </div>
    </li>
    
                 <li class="content"> <span>Quantidade Pedidos Mesa </span>
      <div class="progress progress-mini progress-primary active progress-striped">
        <div style="width: 77%;" class="bar"></div>
      </div>
    </li>
    
                 <li class="content"> <span>Quantidade Pedidos Balcao</span>
      <div class="progress progress-mini progress-primary active progress-striped">
        <div style="width: 77%;" class="bar"></div>
      </div>
    </li>
    
                 <li class="content"> <span>Quantidade Pedidos Televendas </span>
      <div class="progress progress-mini progress-primary active progress-striped">
        <div style="width: 77%;" class="bar"></div>
      </div>
    </li>
    
    
    
    </ul> 
          
			
			
			</div>
			
	
		
		<div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Detalhes do Pagamento  Total </h5>
          </div>
				 	  
			  <ul>
			 
			   <c:forEach var="formapagamento" items="${formapagamentoList}" varStatus="id">
			     
			     
	<li class="content"> <span>${formapagamento.nome} ${formapagamento.pagamentos}</span>
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
			     
	<li class="content"> <span>${despesa.nome} </span>
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
			     
			     
	<li class="content"> <span>${formapagamento.nome} </span>
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
</div>
</div>




