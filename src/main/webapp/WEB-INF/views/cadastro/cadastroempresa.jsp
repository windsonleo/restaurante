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
                       
                                <div class="card-header" data-background-color="red">
                                
                                    <h4 class="title">Cadastro Empresa</h4>
                                    <p class="category">Insira os Dados</p>


                                </div>
                                
                                </br>
          <div class="widget-content">   
          <form class="form-horizonta" method="post" action="${pageContext.request.contextPath}/empresa/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">
              
              
              
             <div class="form-group label-floating ">
              
              <div class="checkbox">
                <label>
				<input id="ativo" name="optionsCheckboxes"  type="checkbox" checked="${empresa.ativo}" class="checkbox"/>Ativo?
				</label>
              </div>
              
              </div>
              
              
              
              
              
              <div class="form-group label-floating">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${empresa.id}" placeholder="" />
                		                		                
                
                </div>
              </div>           
              
              
              
              <div class="form-group label-floating">
                <label class="control-label">Nome Fantasia</label>
                <div class="controls">
						<input id="nomefantasia" class="form-control" name="nomefantasia" type="text" value="${empresa.nomefantasia}" placeholder=""/>
                        
               
                </div>
              </div>
              
               
                             <div class="form-group label-floating">
                <label class="control-label">Razao Social</label>
                <div class="controls">
						<input id="razaosocial" class="form-control" name="razaosocial" type="text" value="${empresa.razaosocial}" placeholder=""/>
                        
               
                </div>
              </div> 
              
                 <div class="form-group label-floating">
                <label class="control-label">CNPJ</label>
                <div class="controls">
						<input id="cnpj" class="form-control" name="cnpj" type="text" value="${empresa.cnpj}" placeholder=""/>
                        
               
                </div>
              </div>
              
              <div class="form-group label-floating">
                <label class="control-label">Inscricao Estadual</label>
                <div class="controls">
						<input id="inscricaoestadual" class="form-control" name="inscricaoestadual" type="text" value="${empresa.inscricaoestadual}" placeholder=""/>
                        
               
                </div>
              </div>                
                
                <div class="form-group label-floating">
                <label class="control-label">Logo</label>
                <div class="controls">
                                <input id="logo" class="form-control" name="logo" type="text" value="${empresa.logo}" placeholder=""/>					
                        
               
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
                                       
                                        <c:choose>
                                        
											    <c:when test="${empresa != null }">
											    	
											    	<img class="img" src="../resources/images/empresa/${empresa.logo}.jpg">
											   
											    </c:when>

											    <c:otherwise>
													
											    	<img class="img" src="../resources/images/empresa/vazio.jpg">
											   
											    </c:otherwise>
										
										</c:choose>
                                    </a>
                                    

                                </div>
                        
                        <form action="salvarfotoempresa" enctype="multipart/form-data"  method="POST" class="">
                        
                        
                        <div class="form-group  is-fileinput">
									    <input type="file" id="file" name="file" multiple="">
									    <div class="input-group">
									      <input type="text" readonly="" class="form-control" placeholder="Selecione a Foto...">
									        <span class="input-group-btn input-group-sm">
									          <button type="button" class="btn btn-fab btn-fab-mini">
									            <i class="material-icons">attach_file</i>
									          </button>
									        </span>
									    </div>
									</div>


<!-- 						<div class="form-group label-floating"> -->
<!-- <!--                               <label class="control-label">Cliente</label> --> 
<%--                                 <input type="text" list="${clientesList}" id="id" --%>
<!--                                        placeholder="Digite o Codigo do Cliente" name="id" autocomplete="off" -->
<!--                                        class="form-control"> -->
                                       
<!--                                  <span class="material-input"></span> -->
<!--                          </div> -->




<%--                                 <datalist id="${clientesList}"> --%>

<%--                                     <c:forEach var="client" items="${clientesList}" varStatus="id"> --%>

<%--                                         <option value="${client.id }"> ${client.nome } </option> --%>

<%--                                     </c:forEach> --%>


<!--                                 </datalist> -->
                                    
                               <div class="form-group label-floating ">
<!--                               <label class="control-label">Cliente</label> -->
                                   
                                   <button type="submit" class="btn btn-info btn-round btn-md">Upload</button>

                                       
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



