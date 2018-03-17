<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

<div id="content">

    <div id="content-header">

</br>

      
    </div>

    <div class="container-fluid">

        <c:if test="${erros != null }">
            <div class="alert alert-error alert-block"><a class="close" data-dismiss="alert" href="#">×</a>
                <h4 class="alert-heading">Erros!</h4>

                    ${erros}
            </div>

        </c:if>

        <c:if test="${mensagem != null }">
            <div class="alert alert-success alert-block"><a class="close" data-dismiss="alert" href="#">×</a>
                <h4 class="alert-heading">Sucesso!</h4>

                    ${mensagem}
            </div>

        </c:if>
        <div class="row-fluid">
            
            
            <div class="span8">
                <div class="widget-content nopadding">



                    <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="red">
                                    <h3 class="title">Gerencia de Fornecedores</h3>
                                    <p class="category">Informacoes Pessoais</p>
                                </div>
           


						<div class="form-group label-floating  ">
                         <div class="checkbox">
                <label>
				<input readonly="readonly" id="ativo" name="optionsCheckboxes"  type="checkbox" checked="${fornecedor.ativo}" class="checkbox"/>Ativo?
				</label>
              </div>
                         </div>



									<div class="form-group label-floating  ">
                                                    <label class="control-label">Nome Fantasia</label>
                                                    <input readonly="readonly" id="nome" class="form-control" name="nome"
                                                                            type="text"
                                                                            value="${fornecedor.nomefantasia}"
                                                                            placeholder"/>

                                                <span class="material-input"></span>
                                    </div>



									<div class="form-group label-floating  ">
                                                    <label class="control-label">Razao Social</label>
                                                    <input readonly="readonly" id="nome" class="form-control" name="nome"
                                                                            type="text"
                                                                            value="${fornecedor.razaosocial}"
                                                                            placeholder=""/>

                                                <span class="material-input"></span>
                                    </div>

									<div class="form-group label-floating  ">
                                                    <label class="control-label">Cnpj</label>
                                                    <input readonly="readonly" id="nome" class="form-control" name="nome"
                                                                            type="text"
                                                                            value="${fornecedor.cnpj}"
                                                                            placeholder=""/>

                                                <span class="material-input"></span>
                                    </div>

									<div class="form-group label-floating  ">
                                                    <label class="control-label">Inscricao Estaduala</label>
                                                    <input readonly="readonly" id="nome" class="form-control" name="nome"
                                                                            type="text"
                                                                            value="${fornecedor.inscricaoestadual}"
                                                                            placeholder=""/>

                                                <span class="material-input"></span>
                                    </div>



                    </div>
				</div>
				
				

 					<div class="card">
                    		<div class="card-content">
                       
                                <div class="card-header" data-background-color="">
                                    <h4 class="title">Dados Gerenciais do Fornecedor</h4>
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
                                          <label class="control-label">Total de Recebimentos</label>
  										<input id="pedidos" name="pedidos" class="form-control" type="text" value="${fornecedor.recebimento.size() }"
                                       		placeholder="" disabled="true"/>
                               				  <span class="material-input"></span>
                                    </div>                                    



                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                    </div>
                </div>
            </div>
        </div>
        
        
        					<div class="span4">
					
                     
					
                            <div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <c:choose>
                                        
											    <c:when test="${fornecedor != null }">
											    	
											    	<img class="img" src="../resources/images/fornecedor/${fornecedor.foto}.jpg">
											   
											    </c:when>

											    <c:otherwise>
													
											    	<img class="img" src="../resources/images/fornecedor/vazio.jpg">
											   
											    </c:otherwise>
										
										</c:choose>                                      </a>
                                    

                                </div>
                           <form action="LocalizarFornecedorGerencia" method="POST" class="">


						<div class="form-group label-floating">
                              <label class="control-label">Fornecedor</label>
                                <input type="text" list="${fornecedorList}" id="id"
                                       placeholder="" name="id" autocomplete="off"
                                       class="form-control">
                                       
                                 <span class="material-input"></span>
                         </div>




                                <datalist id="${fornecedorList}">

                                    <c:forEach var="fornecedor" items="${fornecedorList}" varStatus="id">

                                        <option value="${fornecedor.id }"> ${fornecedor.nomefantasia } </option>

                                    </c:forEach>


                                </datalist>
                                    
                               <div class="form-group label-floating  ">
<!--                               <label class="control-label">Fornecedor</label> -->
                                   
 								<button type="submit"  class="btn btn-info btn-round btn-md">Buscar</button>
                                       
                                 <span class="material-input"></span>
                         		</div>
                                    
                                  </form>
                                  
                                <div class="content">
                                    
                                    <h4><p class="card-content text-gray">${fornecedor.nomefantasia} ${fornecedor.razaosocial}</p> </h4>
                                     <p class="card-content pull-left">Cnpj:${fornecedor.cnpj} </p>  
<!--                                     <p class="card-content"> -->
<!--                                         Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is... -->
<!--                                     </p> -->
                                    
                                    
                                </div>
                            </div>
                        </div>
        
    </div>
</div>
</div>




