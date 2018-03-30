<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
  <div id="content-header">
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
                                
                                    <h4 class="title">Cadastro Garcon</h4>
                                    <p class="category">Insira os Dados</p>


                                </div>
                                
                                </br>
          <div class="widget-content">
            <form class="form-horizonta" method="post" action="${pageContext.request.contextPath}/garcon/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">
              
              
              
              
            <div class="form-group label-floating ">
              
              <div class="checkbox">
                <label>
				<input id="ativo" name="optionsCheckboxes"  type="checkbox" checked="${garcon.ativo}" class="checkbox"/>Ativo?
				</label>
              </div>
              
              </div>
              
              
              
              
              
              <div class="form-group label-floating ">
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${garcon.id}" placeholder="" />
               
               
                </div>
              </div>
              </div>

              <div class="form-group label-floating ">
                <div class="control-group">
                <label class="control-label">Foto</label>
                <div class="controls">
                
         <input id="foto" name="foto" class="form-control" type="text" value="${garcon.foto}" placeholder="" />
                
                </div>
              </div>                
              </div>
              
              
              
              <div class="form-group label-floating ">
              
              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						<input id="nome" class="form-control" name="nome" type="text" value="${garcon.nome}" placeholder=""/>
               
               
                </div>
              </div>
              </div>
              
                             <div class="form-group label-floating">
 				<div class="control-group">
                	<label class="control-label">Usuario</label>	
                <select id="usuario" name="usuario" class="form-control">
								<optgroup label="Usuario">


				<option value="${garcon.usuario.id}" selected="selected"> ${garcon.usuario.username } </option>


									<c:forEach var="usuario" items="${usuarioList}">

										<option value="${usuario.id}">${usuario.username}</option>


									</c:forEach>
								</optgroup>
						</select>
						
						</div>
						</div>
              

              <div class="form-actions">
                <input type="submit" value="${acao}" class="btn btn-success">
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
                                        
											    <c:when test="${garcon != null }">
											    	
											    	<img class="img" src="../resources/images/garcon/${garcon.foto}.jpg">
											   
											    </c:when>

											    <c:otherwise>
													
											    	<img class="img" src="../resources/images/garcon/vazio.jpg">
											   
											    </c:otherwise>
										
										</c:choose>                                  
                                  
                                    </a>
                                    

                                </div>
          <form method="post" action="salvarfotogarcon" enctype="multipart/form-data" class="form-horizonta">       


                                    
                                    </br>
                               <div class="form-group label-floating ">
<!--                               <label class="control-label">Cliente</label> -->
                                   
									
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
									
									 <button type="submit"  class="btn btn-info btn-round btn-md">Salvar Foto</button>
									
                                       
                                 <span class="material-input"></span>
                         		</div>
                                    
                                  </form>
                                  
                                <div class="content">
                                    
                                    <h4><p class="card-content text-gray">${garcon.nome} ${garcon.ativo}
                                     <p class="card-content pull-left">${garcon.id} </p> </h4> </p>
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

