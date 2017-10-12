<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

 <div id="content">
 
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/garcon/movimentacao" title="Go to Garcon" class="tip-bottom"><i class="icon-home"></i> Garcon</a> <a href="#">Gerência Garcon </a> </div>
    <h1> Gerência de Garcons</h1>
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
			<form action="LocalizarGarconGerencia" method="POST" class="form-horizontal">		
  
				<div class="control-group">
                <label class="control-label"></label>
                <div class="controls">
			
								<input type="text" list="${garconsList}" id="id" placeholder="Digite o Código do Garcon" name="id" autocomplete="off" class="form-horizontal">
								
									
									<datalist id="${garconsList}">
								
									 	<c:forEach var="garcon" items="${garconsList}" varStatus="id">
										
											  <option  value="${garcon.id }"> ${garcon.nome } </option>
										
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
            <h5>Dados do Garcon</h5>
          </div>                         


 				 <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id"  name="id" type="text" value="${garcon.id}" placeholder="Digite o Id" disabled="true"/>
               			<input id="isativo" class="span3"name="isativo"  type="checkbox" checked="${garcon.isativo}" disabled="true"/>               
					<input type="image" alt="garcon foto" src="${pageContext.request.contextPath}/resources/images/garcon/${garcon.foto}.jpg" class="span2" disabled="true">				
              
                </div>
              </div>

			 
   			              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						<input id="nome" class="span8" name="nome" type="text" value="${garcon.nome}" placeholder="Digite o Nome da Garcon"/>
<%--                             <input id="foto" class="form-control" name="foto" type="text" value="${garcon.foto}" placeholder="Digite o Foto"/>					 --%>
               
                </div>
              </div>
              
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
									

</div>	


