<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

</br>
</br>

<div id="content">

    <div id="content-header">

</br>
</br>
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
            



			<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="">
       							 <h3 class="title"> Gerencia de Clientes</h3>
                                    <p class="category">Informacoes Pessoais</p>
                                </div>
                       

						<div class="form-group label-floating is-empty">
              <div class="checkbox">
                <label>
				<input id="ativo" name="optionsCheckboxes"  type="checkbox" checked="${produto.ativo}" class="checkbox"/>Ativo?
				</label>
              </div>
                         </div>

                                       
									<div class="form-group label-floating is-empty">
                                                    <label class="control-label">Nome</label>
                                                    <input id="nome" class="form-control" name="nome"
                                                                            type="text"
                                                                            value="${cliente.nome}"
                                                                            placeholder=""/>

                                                <span class="material-input"></span>
                                    </div>



									<div class="form-group label-floating is-empty">
                                                    <label class="control-label">Email</label>
															<input id="mask-mail" class="form-control" name="email"
                                                                             type="text"
                                                                             value="${cliente.email}"
                                                                             placeholder=""/>                                                <span class="material-input"></span>
                                    </div>


									<div class="form-group label-floating is-empty">
                                          <label class="form-control">Genero</label>
											<select id="genero" name="genero" class="">
                                   
												<option selected="selected" value="${cliente.genero}">${cliente.genero}</option>


                                  
                               				 </select> 
                               				  <span class="material-input"></span>
                                    </div>
                                    
									<div class="form-group label-floating is-empty">
                                          <label class="control-label">Telefone</label>
											<input id="mask-phone" class="form-control" name="telefone"
                                                                                type="text"
                                                                                value="${cliente.telefone}"
                                                                                placeholder=""/>
                               				  <span class="material-input"></span>
                                    </div>

									<div class="form-group label-floating is-empty">
                                          <label class="control-label">Data de Nascimento</label>
											 <input id="datanascimento" type="text" data-date="01-02-2013"
                                           data-date-format="dd-mm-yyyy"
                                           value="<fmt:formatDate pattern="dd/MM/yyyy"
                                             value="${cliente.datanascimento}"/>" class="form-control" name="datanascimento">
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

									<div class="form-group label-floating is-empty">
                                          <label class="control-label">Margem de Lucro</label>
											 <input id="margem" name="margem" type="text" value="" placeholder=""
                                       disabled="true" class="form-control"/>
                               				  <span class="material-input"></span>
                                    </div>
                                    
                                    
									<div class="form-group label-floating is-empty">
                                          <label class="control-label">Lucro</label>
  										<input id="lucro" name="lucro" class="form-control" type="text" value=""
                                       		placeholder="" disabled="true"/>
                               				  <span class="material-input"></span>
                                    </div> 
                                    
                                    
                                    <div class="form-group label-floating is-empty">
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
                                        <img class="img" src="../resources/images/cliente/${cliente.foto}.jpg">
                                    </a>
                                    

                                </div>
                        <form action="LocalizarClienteGerencia" method="POST" class="">


						<div class="form-group label-floating">
                              <label class="control-label">Cliente</label>
                                <input type="text" list="${clientesList}" id="id"
                                       placeholder="" name="id" autocomplete="off"
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
                                   
 								<button type="submit"  class="btn btn-info btn-round btn-md">Buscar</button>
                                       
                                 <span class="material-input"></span>
                                 
                         		</div>
                                    
                                  </form>
                                  
                                <div class="content">
                                    
                                    <h4><p class="card-content text-gray">${cliente.nome} ${cliente.email}  </p> </h4>
                                     <p class="card-content pull-left">${cliente.id} </p> 
<!--                                     <p class="card-content"> -->
<!--                                         Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is... -->
<!--                                     </p> -->
                                    
                                    
                                </div>
                            </div>
                        </div>

					</div>

					
        </div>
    </div>



