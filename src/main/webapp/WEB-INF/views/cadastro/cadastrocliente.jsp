<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page session="true" %>


<div id="content">
    <div id="content-header">
		</br>
		 </br>
<!--         <h2>Cadastro de Cliente</h2> -->
    </div>
    <div class="container-fluid">
        <hr>

        <c:if test="${erros != null }">
            <div class="alert alert-error alert-block">
                <a class="close" data-dismiss="alert" href="#">x</a>
                <h4 class="alert-heading">Erros!</h4>

                    ${erros}
            </div>

        </c:if>

        <c:if test="${mensagem != null }">
            <div class="alert alert-success alert-block">
                <a class="close" data-dismiss="alert" href="#">x</a>
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
                                
                                    <h4 class="title">Cadastro Cliente</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">

						<form id="form" class="form-horizontal" method="post"
							action="${pageContext.request.contextPath}/cliente/${acao}" modelAttribute="cliente">

								
							 <div class="form-group label-floating is-empty">
								<div class="control-group">
                                    <div class="controls">
                                        <div class="input-prepend">
                                            <span class="add-on"><i class="icon-key"></i></span>

                                            <input id="id" class="form-control" name="id" type="text"
                                                   value="${cliente.id}" placeholder=""/>


                                        </div>
                                        
                                        </div>
                                        </div>
                                        </div>

                                       <div class="form-group label-floating is-empty">
                              <label class="control-label">Ativo</label>
                                <input id="ativo" class="form-control pull-right" name="ativo" type="checkbox"
                                       checked="${cliente.ativo}" disabled="true"/>
                                 <span class="material-input"></span>
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
											<select id="genero" name="genero" class="form-control">
                                   
												<option selected="selected" value="${cliente.genero}">${cliente.genero}</option>

                                  				<option  value="MASCULINO">MASCULINO</option>
                                  				<option  value="FEMININO">FEMININO</option>
                                  
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
                                    
                                    			<div class="form-group label-floating is-empty">
              <div class="control-group">
                <label class="control-label">Foto</label>
                <div class="controls">
				
							<input id="foto" name="foto" class="form-control" type="text" value="${cliente.foto}" placeholder="" />
				
                </div>
              </div>

				</div>
                                    
                                    

                    </div>
					</div>



                            <div class="form-actions">


                			<input type="submit" value="${acao}" class="btn btn-success">

                            </div>

                        </form>

                    </div>
                    </div>
                    
                    <div class="span4">
					
                     
					
                            <div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="../resources/images/cliente/${cliente.foto}.jpg">
                                    </a>
                                    

                                </div>
          <form method="post" action="salvarfotocliente" enctype="multipart/form-data" class="form-horizonta">       


					          </br>
                               <div class="form-group label-floating is-empty">
<!--                               <label class="control-label">Cliente</label> -->
                                   
									
									<div class="form-group is-empty is-fileinput">
									    <input type="file" id="file" multiple="" name="file">
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




