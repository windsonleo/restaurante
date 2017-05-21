<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="page-wrapper">

	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Mesas <small>Listagem e Visão Geral</small>


				</h1>

				
				<ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-support"></i> Mesas
                            </li>
                        </ol>
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Buscar</h3>
					</div>
					<div class="panel-body">


						<div class="form-group input-group">
<!-- 							<input type="text" class="form-control">  -->
							
							<input type="text" list="${mesasList}" autocomplete="on" class="form-control">
								
								<datalist id="${mesasList}">
								
							 		<c:forEach var="mesa" items="${mesasList}" varStatus="id">
								
								 		<option value="${mesa.numero }">  </option>
								  </c:forEach>
								  
								  
								</datalist>
							
							
							
							
							
							<span
								class="input-group-btn"><button
									class="btn btn-lg btn-primary" type="button">
									<i class="fa fa-search"></i>
								</button>
								<button type="button" class="btn btn-lg btn-success"
									onClick="javascript:window.location='cadastro'">Add</button> </span>

						</div>

					</div>
				</div>


			</div>
			
			
		</div>
		
		  <c:forEach var="mesa" items="${mesasList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${mesa.id % 2 == 0}">
		  
		  
		  
		                   <div class="col-lg-3 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-support fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                         <div class="huge">${mesa.numero}</div>
                                        <div>Mesa</div>
                                    </div>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/mesa/detalhes?id=${mesa.id}">
                                <div class="panel-footer">
                                    <span class="pull-left">Detalhes</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    
                    </c:when>
                    
                    <c:when test="${mesa.id % 2 != 0}">
                    
                                     <div class="col-lg-3 col-md-6">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-support fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge">${mesa.numero}</div>
                                        <div>Mesa</div>
                                    </div>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/mesa/detalhes?id=${mesa.id}">
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




