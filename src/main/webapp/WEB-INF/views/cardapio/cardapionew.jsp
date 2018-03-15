<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

    <div class="wrapper">
		<div class="header header-filter" style="background-image: url('../resources/images/cardapio.jpg');"></div>

		<div class="main main-raised">
			<div class="profile-content">
	            <div class="container">
	                <div class="row">
	                    <div class="profile">
	                        <div class="avatar">
	                            <img src="${pageContext.request.contextPath}/resources/images/logocard.png" alt="Circle Image" class="img-circle img-responsive img-raised">
	                        </div>
	                        <div class="name">
	                            <h3 class="title-text-danger">Cardápio</h3>
								<h6>${categoria.nome}</h6>
	                        </div>
	                    </div>
	                </div>
	                <div class="description text-center">
                        <p>${usuario.roles}</p>
	                </div>

					<div class="row">
						<div class="col-md-12 col-md-offset-3">
							<div class="profile-tabs">
			                    <div class="nav">
									<ul class="nav nav-pills nav-pills-danger" role="tablist">
										
										<c:forEach var="categoria" items="${categoriaList}" varStatus="id">
										
										<li class="">
											<a href=#${categoria.nome} role="tab" data-toggle="tab">
												<i class="material-icons">camera</i>
												${categoria.nome}
											</a>
										</li>
										
									
									
										</c:forEach>

				                    </ul>


									
				                    <div class="tab-content">
				                    <c:forEach var="categoria" items="${categoriaList}" varStatus="id">
				                    
										<div class="tab-pane" id="${categoria.nome}">
										
											<c:forEach var="prod" items="${categoria.produtos}" varStatus="id">
											
				                           
											<div class="row">
												<div class="col-md-6 col-md-offset-0">
<%-- 													<img src="${pageContext.request.contextPath}/resources/images/chris1.jpg" class="img-rounded img-responsive" /> --%>
<%-- 													<img src="${pageContext.request.contextPath}/resources/images/chris1.jpg" class="img-rounded img-responsive" /> --%>
												<div class="title">
												<h3>${prod.nome}</h3>
												<span>${prod.descricao}</span>
												<span class="label label-success pull-right">${prod.precovenda}</span>
												</div>
												
												</div>
												<div class="col-md-2">
													<img src="${pageContext.request.contextPath}/resources/images/produto/${prod.foto}.jpg" class="img-rounded img-responsive" />
<%-- 													<img src="${pageContext.request.contextPath}/resources/images/chris1.jpg" class="img-rounded img-responsive" /> --%>
												</div>
				                            </div>
				                            
											<div class="space-30"></div>
				                            
				                            </c:forEach>
				                        </div>
				                        
				                            </c:forEach>

				                    </div>
				                    
								</div>
							</div>
							<!-- End Profile Tabs -->
						</div>
	                </div>

<!-- </br> -->
<!-- </br> -->
<!-- </br> -->
<!-- </br> -->

	            </div>
	        </div>
		</div>

    </div>



</body>



