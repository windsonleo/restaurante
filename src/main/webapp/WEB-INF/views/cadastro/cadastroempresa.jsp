<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
  <div id="content-header">
</br>
 </br>

  </div>
  <div class="container-fluid"><hr>
            <c:if test="${erros != null }">
</br>
			<div class="alert alert-danger">
				<div class="container-fluid">
					<div class="alert-icon">
						<i class="material-icons">error_outline</i>
					</div>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true"><i class="material-icons">clear</i></span>
					</button>
					<b>Error:</b> ${erros}
				</div>
			</div>


		</c:if>
    
    
    
    

    
      <c:if test="${mensagem != null }">
      </br>
			<div class="alert alert-success">
				<div class="container-fluid">
					<div class="alert-icon">
						<i class="material-icons">check</i>
					</div>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true"><i class="material-icons">clear</i></span>
					</button>
					<b>Sucesso:</b> ${mensagem}
				</div>
			</div>

		</c:if>
		
        <hr>
    <div class="row-fluid">
      <div class="span12">
      	<div class="span8">
               <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Cadastro Empresa</h4>
                                    <p class="category">Insira os Dados</p>


                                </div>
                                
                                </br>
          <div class="widget-content">   
          <form class="form-horizonta" method="post" action="${pageContext.request.contextPath}/empresa/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">
              
              
              
               <div class="checkbox">
                <label>
				<input id="ativo" name="optionsCheckboxes"  type="checkbox" checked="${empresa.ativo}" class="checkbox"/>Ativo?
				</label>
              </div>
              
              
              
              
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${empresa.id}" placeholder="Digite o id" />
                		                		
                		<input id="ativo" name="ativo" class="form-control" type="checkbox" checked="${empresa.ativo}"/>
                
                
                </div>
              </div>           
              
              
              
              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						<input id="nome" class="form-control" name="nome" type="text" value="${empresa.nome}" placeholder="Digite o Nome da Empresa"/>
                        
                         <input id="logo" class="form-control" name="logo" type="text" value="${empresa.logo}" placeholder="Inclua Sua Logomarca"/>					
               
                </div>
              </div>
              
       
              
              
              
              <div class="form-actions">
                <input type="submit" value="Inserir" class="btn-sm btn-success">
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    
    
    
    				<div class="span4">
                            <div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="../resources/images/empresa/${empresa.logo}.jpg">
                                    </a>
                                    

                                </div>
                        
                        <form action="LocalizarClienteGerencia" method="POST" class="">


						<div class="form-group label-floating">
<!--                               <label class="control-label">Cliente</label> -->
                                <input type="text" list="${clientesList}" id="id"
                                       placeholder="Digite o Codigo do Cliente" name="id" autocomplete="off"
                                       class="form-control">
                                       
                                 <span class="material-input"></span>
                         </div>




                                <datalist id="${clientesList}">

                                    <c:forEach var="client" items="${clientesList}" varStatus="id">

                                        <option value="${client.id }"> ${client.nome } </option>

                                    </c:forEach>


                                </datalist>
                                    
                               <div class="form-group label-floating is-empty">
<!--                               <label class="control-label">Cliente</label> -->
                                   
                                   <button type="submit" formaction="LocalizarClienteGerencia" class="btn btn-danger btn-round btn-sm">Upload</button>

                                       
                                 <span class="material-input"></span>
                         		</div>
                                    
                                  </form>
                                  
                                <div class="content">
                                    
                                    <h4><p class="card-content text-gray">${cliente.nome} ${cliente.email}
                                     <p class="card-content pull-left">${cliente.id} </p> </h4> </p>
<!--                                     <p class="card-content"> -->
<!--                                         Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is... -->
<!--                                     </p> -->
                                    
                                    
                                </div>
                            </div>

						</div>
    
    
    </div>
            </div>
          </div>


</div>



