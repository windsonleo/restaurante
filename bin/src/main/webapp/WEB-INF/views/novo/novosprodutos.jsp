<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="page-wrapper">

	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Produtos <small>Novo Produtos</small>


				</h1>

				
				<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-support"></i> Produtos
                            </li>
                        </ol>
				
<!-- 				<div class="panel panel-default"> -->
<!-- 					<div class="panel-heading"> -->
<!-- 						<h3 class="panel-title">Buscar</h3> -->
<!-- 					</div> -->
<!-- 					<div class="panel-body"> -->


<!-- 						<div class="form-group input-group"> -->
<!-- 							<input type="text" class="form-control"> <span -->
<!-- 								class="input-group-btn"><button -->
<!-- 									class="btn btn-lg btn-primary" type="button"> -->
<!-- 									<i class="fa fa-search"></i> -->
<!-- 								</button> -->
<!-- 								<button type="button" class="btn btn-lg btn-success" -->
<!-- 									onClick="javascript:window.location='cadastro'">Add</button> </span> -->

<!-- 						</div> -->

<!-- 					</div> -->
<!-- 				</div> -->


                <div class="row">
                    <div class="col-lg-12">
                        <div class="alert alert-warning alert-dismissable">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            <i class="fa fa-info-circle"></i> Novos Produtos
                        </div>
                    </div>
                </div>


			</div>
			
			
		</div>
		
		  <c:forEach var="produto" items="${produtosList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${produto.id % 2 == 0}">
		  
		  
		  
		                   <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-briefcase fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                         <div>${produto.descricao}</div>
                                        <div>Produto</div>
                                       <div>${produto.precovenda}</div>
                                        
                                    </div>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/produto/detalhes?id=${produto.id}">
                                <div class="panel-footer">
                                    <span class="pull-left">Detalhes</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    
                    </c:when>
                    
                    <c:when test="${produto.id % 2 != 0}">
                    
                                     <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-briefcase fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div>${produto.descricao}</div>
                                        <div>Produto</div>
                                 		<div>${produto.precovenda}</div>
                                        
                                    </div>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/produto/detalhes?id=${produto.id}">
                                <div class="panel-footer">
                                    <span class="pull-left">Detalhes</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    
                    </c:when>
                    
                    </c:choose>
                    
                    </c:forEach>
                   	
		
	</div>

</div>




