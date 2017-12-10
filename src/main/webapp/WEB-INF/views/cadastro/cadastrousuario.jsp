<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

<div id="content">

<div id="content-header">

	</br>
	</br>
	</br>
<!-- 	<h3>Cadastro de Usuario</h3> -->
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
		<div class="span8">
			        <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Cadastro Usuario</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">
 
 <form  role="form" id="ds" class="form-horizontal"action="${pageContext.request.contextPath}/usuario/${acao}" ModelAttribute="usuario" method="POST">
 


<!-- 		<div class="form-group label-floating is-empty">    -->
<!--              <div class="control-group"> -->
<!--                 <label class="control-label">Sugestao?</label> -->
<!--                 <div class="controls"> -->
<%--                          <input id="esugestao" class="form-control"name="esugestao"  type="checkbox" checked="${produto.esugestao}"/> --%>

               
<!--                 </div> -->
<!--               </div> -->
              
<!--               </div> -->
              
              <div class="form-group label-floating is-empty">
              <div class="control-group">
                <label class="control-label">Ativo?</label>
                <div class="controls">
						<input id="ativo" name="ativo" class="form-contro" type="checkbox" checked="${usuario.ativo}"/>
				
				
                </div>
              </div>
              </div>
<!--               </div> -->
              
              <div class="form-group label-floating is-empty">
               <div class="control-group">
                <label class="control-label">UserName</label>
                <div class="controls">
							<input id="username" name="username" class="form-control" type="text" value="${usuario.username}" placeholder=""/>
				
				
                </div>
              </div>             
				</div>
				

			<div class="form-group label-floating is-empty">
              <div class="control-group">
                <label class="control-label">Senha</label>
                <div class="controls">
							<input id="senha" name="senha" class="form-control" type="text" value="${usuario.senha}" placeholder=""/>					
				
				
                </div>
              </div>

			</div>
			
			<div class="form-group label-floating is-empty">
              <div class="control-group">
                <label class="control-label">Email</label>
                <div class="controls">
				
							<input id="email" name="email" class="form-control" type="text" value="${usuario.email}" placeholder="" />
				
                </div>
              </div>

				</div>
				
			<div class="form-group label-floating is-empty">
              <div class="control-group">
                <label class="control-label">Foto</label>
                <div class="controls">
				
							<input id="foto" name="foto" class="form-control" type="text" value="${usuario.foto}" placeholder="" />
				
                </div>
              </div>

				</div>
				
				<div class="form-group label-floating is-empty">
              <div class="control-group">
                <label class="control-label">Roles</label>
                <div class="controls">
	 <select id="roles"name="roles" multiple="multiple" class="form-control" >
	                                  <optgroup label="">
		           				
		           					<option value="${usuario.roles}" selected="selected">${usuario.roles}</option>
		           				
		           				
		           					<c:forEach var="role" items="${roleList}">
		           			
		           				<option value="${role.id}">${role.name}</option>
		           				      				
		           				
		       				</c:forEach>
		                </optgroup>
	                    </select>			
				
                </div>
              </div>
			</div>
           
		 	 
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">


	 	 
			
			<div class="form-actions">
				<button type="submit"class="btn-sm btn-info">${acao}</button>
				<a href='javascript:history.back(1)' class="btn btn-sm btn-warning" >Voltar</a>
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
                                        <img class="img" src="../resources/images/usuario/${usuario.foto}.jpg">
                                    </a>
                                    

                                </div>
          <form method="post" action="salvarfoto" enctype="multipart/form-data" class="form-horizonta">       


                                    
                                    </br>
                               <div class="form-group label-floating is-empty">
<!--                               <label class="control-label">Cliente</label> -->
                                   
									
									<div class="form-group is-empty is-fileinput">
									    <input name="file" type="file" id="file" multiple="">
									    <div class="input-group">
									      <input type="text" readonly="" class="form-control" placeholder="Selecione a Foto...">
									        <span class="input-group-btn input-group-sm">
									          <button type="button" class="btn btn-fab btn-fab-mini">
									            <i class="material-icons">attach_file</i>
									          </button>
									        </span>
									    </div>
									</div>
									
									 <button type="submit" formaction="salvarfoto" class="btn btn-info btn-round btn-md">Salvar Foto</button>
									
                                       
                                 <span class="material-input"></span>
                         		</div>
                                    
                                  </form>
                                  
                                <div class="content">
                                    
                                    <h4><p class="card-content text-gray">${usuario.username} ${usuario.email}
                                     <p class="card-content pull-left">${usuario.id} </p> </h4> </p>
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
                        

<!-- </div> -->
<!-- </div> -->
<!-- </div> -->
<!-- </div> -->

