<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

 <div id="content">
 
  <div id="content-header">
<%--     <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/produto/movimentacao" title="Go to Produto" class="tip-bottom"><i class="icon-home"></i> Produto</a> <a href="#">Gerencia Produto </a> </div> --%>
    </br>
    </br>
    </br>
<!--     <h3> </h3> -->
  </div>

            <div class="container-fluid">
            
    <c:if test="${erros != null }">
            <div class="alert alert-error alert-block"> <a class="close" data-dismiss="alert" href="#">x</a>
              <h4 class="alert-heading">Erros!</h4>
              
              ${erros}
            </div>
            
    </c:if>
    
      <c:if test="${mensagem != null }">
            <div class="alert alert-success alert-block"> <a class="close" data-dismiss="alert" href="#">x</a>
              <h4 class="alert-heading">Sucesso!</h4>
              
              ${mensagem}
            </div>
            
    </c:if>
<div class="row-fluid">
            
             	<div class="span8">

			<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                    <h3 class="title">Gerencia de Produtos</h3>
                                    <p class="category">Informacoes Basicas</p>
                                </div>

 							
 							
 							
 							<div class="form-group label-floating  ">
                                          <div class="checkbox">
                <label>
				<input id="ativo" name="optionsCheckboxes"  type="checkbox" checked="${produto.ativo}" class="checkbox"/>Ativo?
				</label>
              </div>
                         </div>

                                       
									<div class="form-group label-floating">
                                                    <label class="control-label">Nome</label>
                                                    <input id="nome" class="form-control" name="nome"
                                                                            type="text"
                                                                            value="${produto.nome}"
                                                                            placeholder=""/>

                                                <span class="material-input"></span>
                                    </div>
                                    
                                    
									<div class="form-group label-floating">
                                                    <label class="control-label">CodeBar</label>
                                                    <input id="nome" class="form-control" name="nome"
                                                                            type="text"
                                                                            value="${produto.codebar}"
                                                                            placeholder=""/>

                                                <span class="material-input"></span>
                                    </div>	
                                    
                                    <div class="form-group label-floating  ">
                                                    <label class="control-label">Fornecedor</label>
                                                    <input id="nome" class="form-control" name="nome"
                                                                            type="text"
                                                                            value="${produto.fornecedor}"
                                                                            placeholder=""/>

                                                <span class="material-input"></span>
                                    </div>	
                                    
                                    <div class="form-group label-floating  ">
                                                    <label class="control-label">Preco Custo</label>
                                                    <input id="nome" class="form-control" name="nome"
                                                                            type="text"
                                                                            value="<fmt:formatNumber type="currency"
                															 value="${produto.precocusto}"/>"
                                                                            placeholder=""/>

                                                <span class="material-input"></span>
                                    </div>
                                    
                                    
                                    <div class="form-group label-floating  ">
                                                    <label class="control-label">Preco Venda</label>
                                                    <input id="nome" class="form-control" name="nome"
                                                                            type="text"
                                                                            value="<fmt:formatNumber type="currency"
                 															value="${produto.precovenda}"/>"
                                                                            placeholder=""/>

                                                <span class="material-input"></span>
                                    </div>		 


              
									
				
                </div>
              </div> 

                    <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="">
                                    <h4 class="title">Dados Gerenciais</h4>
                                    <p class="category">Informacoes Gerenciais</p>
                                </div>

									<div class="form-group label-floating  ">
                                          <label class="control-label">Margem de Lucro</label>
											 <input id="margem" name="margem" type="text" value="" placeholder=""
                                       disabled="true" class="form-control"/>
                               				  <span class="material-input"></span>
                                    </div>
                                    
                                    
									<div class="form-group label-floating  ">
                                          <label class="control-label">Lucro</label>
  										<input id="lucro" name="lucro" class="form-control" type="text" value=""
                                       		placeholder="" disabled="true"/>
                               				  <span class="material-input"></span>
                                    </div> 
                                    
                                    
                                    <div class="form-group label-floating  ">
                                          <label class="control-label">Total de Pedidos</label>
  										<input id="pedidos" name="pedidos" class="form-control" type="text" value=""
                                       		placeholder="" disabled="true"/>
                               				  <span class="material-input"></span>
                                    </div>                                    




                    </div>
                    
                    </div>
                    
       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">



                </div>

					<div class="span4">
					
                     
					
                            <div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                       
                                      <c:choose>
                                        
											    <c:when test="${produto != null }">
											    	
											    	<img class="img" src="../resources/images/produto/${produto.foto}.jpg">
											   
											    </c:when>

											    <c:otherwise>
													
											    	<img class="img" src="../resources/images/produto/vazio.jpg">
											   
											    </c:otherwise>
										
										</c:choose>
                                       
                                   
                                    </a>
                                    

                                </div>
                        <form action="LocalizarProdutoGerencia" method="POST" class="">


						<div class="form-group label-floating">
                              <label class="control-label">Produto</label>
                                <input type="text" list="${produtosList}" id="id"
                                       placeholder="" name="id" autocomplete="off"
                                       class="form-control">
                                       
                                 <span class="material-input"></span>
                         </div>




                                <datalist id="${produtosList}">

                                    <c:forEach var="client" items="${produtosList}" varStatus="id">

                                        <option value="${client.id }"> ${client.nome } </option>

                                    </c:forEach>


                                </datalist>
                                    
                               <div class="form-group label-floating  ">
<!--                               <label class="control-label">produto</label> -->
                                   
						 <button type="submit"  class="btn btn-info btn-round btn-md">Buscar</button>
                                       
                                 <span class="material-input"></span>
                         		</div>
                                    
                                  </form>
                                  
                                <div class="content">
                                    
                                    <h4><p class="card-content text-gray">${produto.nome} ${produto.descricao}</p> </h4> 
                                     <p class="card-content pull-left">${produto.id} </p> 
<!--                                     <p class="card-content"> -->
<!--                                         Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is... -->
<!--                                     </p> -->
                                    
                                    
                                </div>
                            </div>
                        </div>

					</div>

					
        </div>
    </div>