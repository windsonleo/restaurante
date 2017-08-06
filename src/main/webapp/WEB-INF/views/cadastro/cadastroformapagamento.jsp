<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<div id="page-wrapper">

            <div class="container-fluid">

               <div class="row">
                    <div class="col-sm-12">
                         
                         <h1 class="page-header">
                            Forma de Pagamento <small>Cadastro e Visão Geral</small>
                                                        
                        </h1>
                        
                                  		<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-support"></i> Forma de Pagamento
                            </li>
                        </ol>
                                      <div class="row">
                    <div class="col-sm-12">
                        <div class="alert alert-info alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <i class="fa fa-info-circle"></i> 
                        </div>
                    </div>
                </div>
 <form  role="form" id="ds" class="form-labels-on-top"action="${pageContext.request.contextPath}/formapagamento/${acao}" ModelAttribute="formapagamento" method="POST">
 
 						
 						
 					<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Cadastro de Formas de Pagamento </h3>
					</div>
					<div class="panel-body">

						
						
						
<!-- 						<div class="form-group"> -->
						
<!-- 						<div class="col-xs-12"> -->
						
<!-- 						 <div class="form-inline"> -->
						


			
		 	 <div class="form-group">
				   <label>
				  	<span>Ativo?</span>
						<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${formapagamento.isativo}"/>
					</label>
			 </div>
			 
<%-- 			<input type="hidden" name="id" value="${formapagamento.id}"> --%>
			 

				   <label>
						<input id="id" class="form-control" name="id" type="text" value="${formapagamento.id}" placeholder="Digite o id" />
					</label>
			 
		
			 
			   		<label>
						<input id="nome" class="form-control" name="nome" type="text" value="${formapagamento.nome}" placeholder="Digite o Nome"/>
					</label>
		 	 
		 	
		 	 
		 	 
			
                <label>Tipo
                    
                         <select id="tipo"name="tipo"  class="form-control">
	                                  <optgroup label="Tipos de Formas de Pagamento">
		           				
		           					<option value="${formapagamento.tipo}">${formapagamento.tipo}</option>
		           						           			
		           				<option value="AVISTA">AVISTA</option>
		           				<option value="CCREDITO">CCREDITO</option>
		           				<option value="CDEBITO">CDEBITO</option>
		           				      				
		           			
		                </optgroup>
	                    </select>
	                    
	                                        
                </label>
                
                
                	<label>
						<input id="parcelas" class="form-control" name="parcelas" type="text" value="${formapagamento.parcelas}" placeholder="Digite a Quant. Parcelas"/>
					</label>
					
						<label>
						<input id="percdesconto" class="form-control" name="percdesconto" type="text" value="${formapagamento.percdesconto}" placeholder="Digite o % de Desconto"/>
					</label>
                       
              
              
           
		 	 
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">


            
            <div class="form-group">
				<button type="submit"class="btn btn-sm btn-primary">Cadastrar</button>
				<a href='javascript:history.back(1)' class="btn btn-sm btn-info" >Voltar</a>
			</div> 
			
			</div>
			</div>
	
			
										

</form>

</div>
</div>
</div>
</div>


