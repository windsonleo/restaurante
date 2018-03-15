<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

    <div class="wrapper">
		<div class="header header-filter" style="background-image: url('../resources/images/city.jpg');"></div>

		<div class="main main-raised">
			<div class="profile-content">
	            <div class="container">
	                <div class="row">
	                    <div class="profile">
	                        <div class="avatar">
	                            <img src="${pageContext.request.contextPath}/resources/images/empresa/${empresa.logo}.jpg" alt="Circle Image" class="img-circle img-responsive img-raised">
	                        </div>
	                        <div class="name">
	                            <h3 class="title">${usuario.username}</h3>
								<h6>${usuario.email}</h6>
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
										<li class="active">
											<a href="#studio" role="tab" data-toggle="tab">
												<i class="material-icons">camera</i>
												Dados Pessoais
											</a>
										</li>
										<li>
				                            <a href="#work" role="tab" data-toggle="tab">
												<i class="material-icons">palette</i>
												Roles
				                            </a>
				                        </li>
				                        <li>
				                            <a href="#shows" role="tab" data-toggle="tab">
												<i class="material-icons">favorite</i>
				                                Favoritos
				                            </a>
				                        </li>
				                    </ul>

				                    <div class="tab-content gallery">
										<div class="tab-pane active" id="studio">
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
				                        <div class="tab-pane text-center" id="work">
											<div class="row">
												<div class="col-md-6">
													<img src="../assets/img/examples/chris5.jpg" class="img-rounded" />
													<img src="../assets/img/examples/chris7.jpg" class="img-rounded" />
													<img src="../assets/img/examples/chris9.jpg" class="img-rounded" />
												</div>
												<div class="col-md-6">
													<img src="../assets/img/examples/chris6.jpg" class="img-rounded" />
													<img src="../assets/img/examples/chris8.jpg" class="img-rounded" />
												</div>
											</div>
				                        </div>
										<div class="tab-pane text-center" id="shows">
											<div class="row">
												<div class="col-md-6">
													<img src="../assets/img/examples/chris4.jpg" class="img-rounded" />
													<img src="../assets/img/examples/chris6.jpg" class="img-rounded" />
												</div>
												<div class="col-md-6">
													<img src="../assets/img/examples/chris7.jpg" class="img-rounded" />
													<img src="../assets/img/examples/chris5.jpg" class="img-rounded" />
													<img src="../assets/img/examples/chris9.jpg" class="img-rounded" />
												</div>
											</div>
				                        </div>

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



