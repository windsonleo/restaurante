<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>



	<nav class="navbar navbar-transparent navbar-absolute">
    	<div class="container">
        	<!-- Brand and toggle get grouped for better mobile display -->
        	<div class="navbar-header">
        		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example">
            		<span class="sr-only">Toggle navigation</span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
        		</button>
        		<a class="navbar-brand" href="http://www.creative-tim.com"><i class="fa fa-paw"></i>Tecsoluction</a>
        	</div>

        	<div class="collapse navbar-collapse" id="navigation-example">
<!--         		<ul class="nav navbar-nav navbar-right"> -->
<!-- 					<li> -->
<!--     					<a href="../components-documentation.html" target="_blank"> -->
<!--     						Components -->
<!--     					</a> -->
<!--     				</li> -->
<!--     				<li> -->
<!-- 						<a href="http://demos.creative-tim.com/material-kit-pro/presentation.html?ref=utp-freebie" target="_blank"> -->
<!-- 							<i class="material-icons">unarchive</i> Upgrade to PRO -->
<!-- 						</a> -->
<!--     				</li> -->
<!-- 		            <li> -->
<!-- 		                <a href="https://twitter.com/CreativeTim" target="_blank" class="btn btn-simple btn-white btn-just-icon"> -->
<!-- 							<i class="fa fa-twitter"></i> -->
<!-- 						</a> -->
<!-- 		            </li> -->
<!-- 		            <li> -->
<!-- 		                <a href="https://www.facebook.com/CreativeTim" target="_blank" class="btn btn-simple btn-white btn-just-icon"> -->
<!-- 							<i class="fa fa-facebook-square"></i> -->
<!-- 						</a> -->
<!-- 		            </li> -->
<!-- 					<li> -->
<!-- 		                <a href="https://www.instagram.com/CreativeTimOfficial" target="_blank" class="btn btn-simple btn-white btn-just-icon"> -->
<!-- 							<i class="fa fa-instagram"></i> -->
<!-- 						</a> -->
<!-- 		            </li> -->
<!--         		</ul> -->
        	</div>
    	</div>
    </nav>





  <div class="wrapper">
		<div class="header header-filter" style="background-image: url('${pageContext.request.contextPath}/resources/images/city.jpg'); background-size: cover; background-position: top center;">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
						<div class="card card-signup">
							<form class="form" method="POST" action="enviaremail">
								<div class="header header-danger text-center">
									<img class="image-responsive"
            src="${pageContext.request.contextPath}/resources/images/logosenpaii.png"/>
            
									<div class="social-line">
										<a href="#pablo" class="btn btn-simple btn-just-icon">
											<i class="fa fa-facebook-square"></i>
										</a>
										<a href="#pablo" class="btn btn-simple btn-just-icon">
											<i class="fa fa-twitter"></i>
										</a>
										<a href="#pablo" class="btn btn-simple btn-just-icon">
											<i class="fa fa-google-plus"></i>
										</a>
									</div>
								</div>
<!-- 								<p class="text-divider">Or Be Classical</p> -->
								<div class="content">

									<div class="input-group">
										<span class="input-group-addon">
											<i class="material-icons">email</i>
										</span>
										<input name="email" id="email" type="text" class="form-control" placeholder="Digite seu Email Cadastrado">
									</div>

									<!-- If you want to add a checkbox to this form, uncomment this code

									<div class="checkbox">
										<label>
											<input type="checkbox" name="optionsCheckboxes" checked>
											Subscribe to newsletter
										</label>
									</div> -->
								</div>
								<div class="footer text-center">
								<button class="btn btn-simple btn-danger btn-lg" type="submit">Resgatar</button>
<%-- 									<a href="${pageContext.request.contextPath}/esqueceu" class="btn btn-simple btn-primary btn-lg">Esqueceu</a> --%>
									
									
									
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

<!-- 			<footer class="footer"> -->
<!-- 		        <div class="container"> -->
<!-- 		            <nav class="pull-left"> -->
<!-- 						<ul> -->
<!-- 							<li> -->
<!-- 								<a href="http://www.creative-tim.com"> -->
<!-- 									Creative Tim -->
<!-- 								</a> -->
<!-- 							</li> -->
<!-- 							<li> -->
<!-- 								<a href="http://presentation.creative-tim.com"> -->
<!-- 								   About Us -->
<!-- 								</a> -->
<!-- 							</li> -->
<!-- 							<li> -->
<!-- 								<a href="http://blog.creative-tim.com"> -->
<!-- 								   Blog -->
<!-- 								</a> -->
<!-- 							</li> -->
<!-- 							<li> -->
<!-- 								<a href="http://www.creative-tim.com/license"> -->
<!-- 									Licenses -->
<!-- 								</a> -->
<!-- 							</li> -->
<!-- 						</ul> -->
<!-- 		            </nav> -->
<!-- 		            <div class="copyright pull-right"> -->
<!-- 		                &copy; 2016, made with <i class="fa fa-heart heart"></i> by <a href="http://www.creative-tim.com" target="_blank">Creative Tim</a> -->
<!-- 		            </div> -->
<!-- 		        </div> -->
<!-- 		    </footer> -->

		</div>
		
		<c:if test="${erros != null }">
<!-- </br> -->
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
    
    
    
    

    
      <c:if test="${sucesso != null }">
<!--       </br> -->
			<div class="alert alert-success">
				<div class="container-fluid">
					<div class="alert-icon">
						<i class="material-icons">check</i>
					</div>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true"><i class="material-icons">clear</i></span>
					</button>
					<b>Sucesso:</b> ${sucesso}
				</div>
			</div>

		</c:if>

    </div>
        


