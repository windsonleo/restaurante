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
	                            <img src="${pageContext.request.contextPath}/resources/images/empresa/logo3ddd.png" alt="Circle Image" class="img-circle img-responsive img-raised">
	                        </div>
	                        <div class="name">
	                            <h3 class="title">Cardápio</h3>
								<h6>${categoria.nome}</h6>
	                        </div>
	                    </div>
	                </div>
	                <div class="description text-center">
                        <p>${usuario.roles}</p>
	                </div>

					<div class="row">
						<div class="col-md-6 col-md-offset-3">
							<div class="profile-tabs">
			                    <div class="nav-align-center">
									<ul class="nav nav-pills" role="tablist">
										
										<c:forEach var="categoria" items="${categoriaList}" varStatus="id">
										
										<li class="">
											<a href=# ${categoria.nome} role="tab" data-toggle="tab">
												<i class="material-icons">camera</i>
												${categoria.nome}
											</a>
										</li>
										
									
									
										</c:forEach>

				                    </ul>


									
				                    <div class="tab-content gallery">
				                    <c:forEach var="categoria" items="${categoriaList}" varStatus="id">
				                    
										<div class="tab-pane" id="${categoria.nome}">
				                            <div class="row">
												<div class="col-md-6">
													<img src="../assets/img/examples/chris1.jpg" class="img-rounded" />
													<img src="../assets/img/examples/chris0.jpg" class="img-rounded" />
												</div>
												<div class="col-md-6">
													<img src="../assets/img/examples/chris3.jpg" class="img-rounded" />
													<img src="../assets/img/examples/chris4.jpg" class="img-rounded" />
												</div>
				                            </div>
				                        </div>
				                        
				                            </c:forEach>

				                    </div>
				                    
								</div>
							</div>
							<!-- End Profile Tabs -->
						</div>
	                </div>

	            </div>
	        </div>
		</div>

    </div>



</body>



