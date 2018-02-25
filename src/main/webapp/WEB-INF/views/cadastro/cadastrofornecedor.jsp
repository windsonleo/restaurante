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
                                
                                    <h4 class="title">Cadastro Fornecedor</h4>
                                    <p class="category">Insira os Dados</p>

                                </div>
                                
                                </br>
          <div class="widget-content">
            <form class="form-horizonta" method="post" action="${pageContext.request.contextPath}/fornecedor/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">
              
              
               <div class="form-group label-floating ">
              
              			<div class="checkbox">
                <label>
				<input id="ativo" name="optionsCheckboxes"  type="checkbox" checked="${fornecedor.ativo}" class="checkbox"/>Ativo?
				</label>
              </div>
              
              
              
              </div>
              
              <div class="form-group label-floating ">
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${fornecedor.id}" placeholder="" />
               
                </div>
              </div>
              </div>
              
              
              
              
              
              <div class="form-group label-floating ">
              <div class="control-group">
                <label class="control-label">Nome Fantasia</label>
                <div class="controls">
						<input id="nomefantasia" class="form-control" name="nomefantasia" type="text" value="${fornecedor.nomefantasia}" placeholder=""/>
               
               
                </div>
              </div>
              </div>
              
              
                            
              <div class="form-group label-floating ">
              <div class="control-group">
                <label class="control-label">Razao Social</label>
                <div class="controls">
               			<input id="razaosocial" class="form-control" name="razaosocial" type="text" value="${fornecedor.razaosocial}" placeholder=""/>					
               
               
                </div>
              </div>
              </div>

              

              
              <div class="form-group label-floating ">
              <div class="control-group">
                <label class="control-label">Cnpj</label>
                <div class="controls">
						<input id="cnpj" class="form-control" name="cnpj" type="text" value="${fornecedor.cnpj}" placeholder="" />
               
               
                </div>
              </div>
              </div>              
              
        
              <div class="form-group label-floating ">

            <div class="control-group">
                <label class="control-label">IE</label>
                <div class="controls">
          				<input id="inscricaoestadual" class="form-control" name="inscricaoestadual" type="text" value="${fornecedor.inscricaoestadual}" placeholder="" />
          
                </div>
              </div>  
              
              </div> 
              
                            <div class="form-group label-floating ">

            <div class="control-group">
                <label class="control-label">Logo</label>
                <div class="controls">
          				<input id="foto" class="form-control" name="foto" type="text" value="${fornecedor.foto}" placeholder="" />
          
                </div>
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
                                        
											    <c:when test="${fornecedor != null }">
											    	
											    	<img class="img" src="../resources/images/fornecedor/${fornecedor.foto}.jpg">
											   
											    </c:when>

											    <c:otherwise>
													
											    	<img class="img" src="../resources/images/fornecedor/vazio.jpg">
											   
											    </c:otherwise>
										
										</c:choose>                                       
                                   
                                   
                                    </a>
                                    

                                </div>
          <form method="post" action="salvarfotofornecedor" enctype="multipart/form-data" class="form-horizonta">       


                                    
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
                                    
                                    <h4><p class="card-content text-gray">${fornecedor.nomefantasia} ${fornecedor.cnpj}</p> </h4> 
                                     <p class="card-content pull-left">${fornecedor.id} </p> 
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
