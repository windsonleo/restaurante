<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Despesa</a>>> <a href="#">Movimentação Despesa</a> >><a href="#" class="current">Cadastro Despesa</a> </div>
    <h1>Cadastro de Despesa</h1>
  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Cadastro de Despesa</h5>
          </div>
          <div class="widget-content nopadding">
            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/despesa/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">
              
               <div class="control-group">
                <label class="control-label">Ativo?</label>
                <div class="controls">
						<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${despesa.isativo}"/>
                </div>
              </div>
              
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${despesa.id}" placeholder="Digite o id" />
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						<input id="nome" class="form-control" name="nome" type="text" value="${despesa.nome}" placeholder="Digite o Nome da Despesa"/>
                </div>
              </div>

<!--               <div class="control-group"> -->
<!--                 <label class="control-label">Despesa Pai</label> -->
<!--                 <div class="controls"> -->
                    
<!--                          <select id="catpai"name="catpai"  class="form-control"> -->
<!-- 	                                  <optgroup label="Tipos de Catgeoria Pai"> -->
		           				
<%-- 		           					<option value="${despesa.catpai}">${despesa.catpai}</option> --%>
		           				
<%-- 		           					<c:forEach var="despesa" items="${despesaList}"> --%>
		           			
<%-- 		           				<option value="${despesa.id}">${despesa.nome}</option> --%>
		           				      				
		           				
<%-- 		       				</c:forEach> --%>
<!-- 		                </optgroup> -->
<!-- 	                    </select> -->
	                    
	                                        
<!--                 </div> -->
<!--               </div> -->
              
              
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
                            Despesa <small>Cadastro e Visão Geral</small>
                                                        
                        </h1>
                        
                                  		<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-support"></i> Despesa
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
 
 <form  role="form" id="ds" class="form-labels-on-top"action="${pageContext.request.contextPath}/despesa/${acao}" ModelAttribute="despesa" method="POST">
 
 						
 						
 					<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Cadastro de Despesa </h3>
					</div>
					<div class="panel-body">

						
						
						
<!-- 						<div class="form-group"> -->
						
<!-- 						<div class="col-xs-12"> -->
						
<!-- 						 <div class="form-inline"> -->
						


			
		 	 <div class="form-group">
				   <label>
				  	<span>Ativo?</span>
						<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${despesa.isativo}"/>
					</label>
			 </div>
			 
<%-- 			<input type="hidden" name="id" value="${despesa.id}"> --%>
			 

				   <label>
						<input id="id" class="form-control" name="id" type="text" value="${despesa.id}" placeholder="Digite o id" />
					</label>
			 
		
			 
			   		<label>
						<input id="nome" class="form-control" name="nome" type="text" value="${despesa.nome}" placeholder="Digite o Nome da Despesa"/>
					</label>
		 	 
		 	
		 	 
		 	 
			
<!--                 <label>Despesa Pai -->
                    
<!--                          <select id="catpai"name="catpai"  class="form-control"> -->
<!-- 	                                  <optgroup label="Tipos de Catgeoria Pai"> -->
		           				
<%-- 		           					<option value="${despesa.catpai}">${despesa.catpai}</option> --%>
		           				
<%-- 		           					<c:forEach var="despesa" items="${despesaList}"> --%>
		           			
<%-- 		           				<option value="${despesa.id}">${despesa.nome}</option> --%>
		           				      				
		           				
<%-- 		       				</c:forEach> --%>
<!-- 		                </optgroup> -->
<!-- 	                    </select> -->
	                    
	                                        
<!--                 </label> -->
                       
              
              
           
		 	 
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">


            
            <div class="form-group">
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


