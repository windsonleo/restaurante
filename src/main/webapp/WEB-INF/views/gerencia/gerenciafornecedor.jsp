<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

 <div id="content">
 
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/fornecedor/movimentacao" title="Go to Fornecedor" class="tip-bottom"><i class="icon-home"></i> Fornecedor</a> <a href="#">Gerência Fornecedor </a> </div>
    <h1> Gerência de Fornecedors</h1>
  </div>

            <div class="container-fluid">
            
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
                <div class="widget-content nopadding">               
			<form action="LocalizarFornecedorGerencia" method="POST" class="form-horizontal">		
  
				<div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
			
								<input type="text" list="${fornecedorList}" id="id" placeholder="Digite o Código do Fornecedor" name="id" autocomplete="off" class="form-horizontal">
								
									
									<datalist id="${fornecedorList}">
								
									 	<c:forEach var="fornecedor" items="${fornecedorList}" varStatus="id">
										
											  <option  value="${fornecedor.id }"> ${fornecedor.nomefantasia } </option>
										
										  </c:forEach>
								  
								  
									</datalist>
									
<%-- 									<input type="text"  id="telefone" name="telefone"  class="" value="${cliente.telefone }" placeholder="Digite o Telefone"> --%>
									

					
							
								<input type="submit" class="btn btn-lg btn-success"
										value="Localizar">
											
			   
              </div>


									
									
									
								
              </div>
              
              
                                
							</form>
							
			 							 
			 		
					 
                        
                        
<div class="widget-box">
     <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Dados do Fornecedor</h5>
          </div>                         


 				  <div class="control-group">
                <label class="control-label">Ativo?</label>
                <div class="controls">
                </div>
              </div>
              
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${fornecedor.id}" placeholder="Digite o id" />
               			<input id="isativo" name="isativo" class="span8 m-wrap" type="checkbox" checked="${fornecedor.isativo}"/>
               
                </div>
              </div>
              
<!--                 <div class="control-group"> -->
<!--                 <label class="control-label">Foto</label> -->
<!--                 <div class="controls"> -->
<%--              <input id="foto" class="form-control" name="foto" type="image" value="${fornecedor.foto}" placeholder="Digite o Foto"/>					 --%>
<!--                 </div> -->
<!--               </div>                 -->
              
              
              
              
              
              <div class="control-group">
                <label class="control-label">Nome Fantasia</label>
                <div class="controls">
						<input id="nomefantasia" class="form-control" name="nomefantasia" type="text" value="${fornecedor.nomefantasia}" placeholder="Digite o Nome da Fornecedor"/>
               			<input id="razaosocial" class="form-control" name="razaosocial" type="text" value="${fornecedor.razaosocial}" placeholder="Digite o Razão Social"/>					
               
               
                </div>
              </div>

<!--               <div class="control-group"> -->
<!--                 <label class="control-label">Genero</label> -->
<!--                 <div class="controls"> -->
                    
<!--                  <select id="genero" name="genero" id="genero" class="form-control">            -->
<!-- 	                <optgroup label="Genero do Usuario"> -->
	           			
<!-- 	           				<option value="MASCULINO">MASCULINO</option> -->
<!-- 	           				<option value="FEMININO">FEMININO</option> -->
	           				      				
<!-- 	                </optgroup> -->
<!-- 	            </select> -->
	                    
	                                        
<!--                 </div> -->
<!--               </div> -->
              
              

              
              
              
        

            <div class="control-group">
                <label class="control-label">Cnpj</label>
                <div class="controls">
						<input id="cnpj" class="form-control" name="cnpj" type="text" value="${fornecedor.cnpj}" placeholder="Digite o Cnpj" />
          				<input id="inscricaoestadual" class="form-control" name="inscricaoestadual" type="text" value="${fornecedor.inscricaoestadual}" placeholder="Digite o IE" />
          
                </div>
              </div>              
              
<!--             <div class="control-group"> -->
<!--                 <label class="control-label">I.E</label> -->
<!--                 <div class="controls"> -->
<!--                 </div> -->
<!--               </div>       -->
              
              </div>



               <div class="widget-box">

  <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Dados Gerenciais</h5>
          </div>  
					 


              
              
              <div class="control-group">
                <label class="control-label">Margem de Lucro</label>
                <div class="controls">
						<input id="margem"  name="margem" type="text" value="" placeholder="Margem de Lucro" disabled="true"/>
                		<input id="totpedido" name="totpedido" class="span4"  type="text" value="" placeholder="Qunatidades de Pedidos" disabled="true"/>
                		<input id="lucro" name="lucro" class="span4"  type="text" value="" placeholder="Lucro total" disabled="true"/>
                        <input id="totestoque" name="totestoque" class="span4"  type="text" value="" placeholder="Total no Estoque" disabled="true"/>
                
                </div>
              </div>
			 
              
                    
              
                                                  
                           			 
			  
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

			
<!-- 			<div class="form-actions" align="center"> -->
<!-- 				<button type="submit"class="btn btn-success">Cadastrar</button> -->
<!-- 			</div> -->
			
</div>
</div>
</div>
</div>
</div>
</div>




