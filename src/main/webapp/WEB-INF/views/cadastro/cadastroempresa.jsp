<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Empresa</a>>> <a href="#">Movimentação Empresa</a> >><a href="#" class="current">Cadastro Empresa</a> </div>
    <h1>Cadastro de Empresa</h1>
  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Cadastro de Empresa</h5>
          </div>
          <div class="widget-content nopadding">
            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/empresa/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">
              
               <div class="control-group">
                <label class="control-label">Ativo?</label>
                <div class="controls">
						<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${empresa.isativo}"/>
                </div>
              </div>
              
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${empresa.id}" placeholder="Digite o id" />
                </div>
              </div>
              
                <div class="control-group">
                <label class="control-label">Logo</label>
                <div class="controls">
             <input id="foto" class="form-control" name="foto" type="image" value="${empresa.logo}" placeholder="Digite o Foto"/>					
                </div>
              </div>                
              
              
              
              
              
              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						<input id="nome" class="form-control" name="nome" type="text" value="${empresa.nome}" placeholder="Digite o Nome da Empresa"/>
                </div>
              </div>

<!--               <div class="control-group"> -->
<!--                 <label class="control-label">Genero</label> -->
<!--                 <div class="controls"> -->
                    
<!--                  <select id="genero" name="genero" id="genero" class="form-control">            -->
<!-- 	                <optgroup label="Genero do Usuario"> -->
	           			
<!-- 	           				<option value="MASCULINO">MASCULINO</option> -->
<!-- 	           				<option value="FEMININO">FEMININO</option> -->
	           				      				
<!-- 	                </optgroup> -->
<!-- 	            </select> -->
	                    
	                                        
<!--                 </div> -->
<!--               </div> -->
              
              
              
<!--             <div class="control-group"> -->
<!--                 <label class="control-label">Telefone</label> -->
<!--                 <div class="controls"> -->
<%--              <input id="telefone" class="form-control" name="telefone" type="text" value="${empresa.telefone}" placeholder="Digite o Telefone"/>					 --%>
<!--                 </div> -->
<!--               </div> -->

<!--             <div class="control-group"> -->
<!--                 <label class="control-label">Email</label> -->
<!--                 <div class="controls"> -->
<%--              <input id="telefone" class="form-control" name="telefone" type="text" value="${empresa.telefone}" placeholder="Digite o Telefone"/>					 --%>
<!--                 </div> -->
<!--               </div>               -->
              
<!--             <div class="control-group"> -->
<!--                 <label class="control-label">Data de Nascimento</label> -->
<!--                 <div class="controls"> -->
<%--              <input id="telefone" class="form-control" name="datanascimento" type="date" value="${empresa.telefone}" placeholder="Digite o Telefone"/>					 --%>
<!--                 </div> -->
<!--               </div>       -->
              
              
       
              
              
              
              <div class="form-actions">
                <input type="submit" value="Inserir" class="btn btn-success">
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
            </div>
          </div>


<div class="row-fluid">
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Soluções em Tecnologia</a> </div>
</div>









<div id="page-wrapper">

            <div class="container-fluid">

               <div class="row">
                    <div class="col-sm-12">
                         
                         <h1 class="page-header">
                            Empresa <small>Cadastro e Visão Geral</small>
                                                        
                        </h1>
                        
                              		<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-user"></i> Empresa
                            </li>
                        </ol>
                                      <div class="row">
                    <div class="col-sm-12">
                        <div class="alert alert-info alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <i class="fa fa-info-circle"></i> 
                        </div>
                    </div>
                </div>
 <form  role="form" id="ds" class="form-labels-on-top"action="${pageContext.request.contextPath}/empresa/${acao}" ModelAttribute="empresa" method="POST">
 
 			<div class="panel panel-primary">
					<div class="panel-heading">
							<h3 class="panel-title">Cadastro de Empresa </h3>
					</div>
					<div class="panel-body">
					
					
 
							<div class="form-group" align="">
<%-- 							<img src="${pageContext.request.contextPath}/resources/images/images.png" class=".img-thumbnail" alt="Responsive image"> --%>
					
							   <label>
							  	<span>Ativo?</span>
									<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${empresa.isativo}"/>
								</label>
						</div>

				   <label>
						<input id="id" class="form-control" name="id" type="text" value="${empresa.id}" placeholder="Digite o Id"/>
					</label>
			 
		
			 
			   		<label>
						<input id="nome" class="form-control" name="nome" type="text" value="${empresa.nome}" placeholder="Digite o Nome"/>
					</label>
		 	 

			
			   		<label>
						<input id="foto" class="form-control" name="foto" type="text" value="${empresa.logo}" placeholder="Digite Caminho da Foto"/>					
					</label>
			
              
              
           
		 	 
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
<p></p>
<p></p>
            
            <div class="form-group" align="center">
				<button type="submit"class="btn btn-sm btn-primary">Cadastrar</button>
				<a href='javascript:history.back(1)' class="btn btn-sm btn-info" >Voltar</a>
			</div> 
			
			</div>
			</div>
			
										

</form>
</div>
</div>
</div>
</div>


