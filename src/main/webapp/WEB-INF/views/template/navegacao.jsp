  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  
<%@ page session="true" %>

<!--   			            <div class="profile clearfix"> -->

<!-- 		            </div> -->
   
<div id="header">


  
 <nav class="navbar navbar-transparent navbar-absolute" >
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#"> Senpai</a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="material-icons">dashboard</i>
                                    <p class="hidden-lg hidden-md">Dashboard</p>
                                </a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="material-icons">notifications</i>
                                    <span class="notification">5</span>
                                    <p class="hidden-lg hidden-md">Notifications</p>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="#">Mike John responded to your email</a>
                                    </li>
                                    <li>
                                        <a href="#">You have 5 new tasks</a>
                                    </li>
                                    <li>
                                        <a href="#">You're now friend with Andrew</a>
                                    </li>
                                    <li>
                                        <a href="#">Another Notification</a>
                                    </li>
                                    <li>
                                        <a href="#">Another One</a>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="material-icons">person</i>
                                    <p class="hidden-lg hidden-md">Profile</p>
                                </a>
                            </li>
                        </ul>
<!--                         <form class="navbar-form navbar-right" role="search"> -->
<!--                             <div class="form-group  is-empty"> -->
<!--                                 <input type="text" class="form-control" placeholder="Search"></input> -->
<!--                                 <span class="material-input"></span> -->
<!--                             </div> -->
<!--                             <button type="submit" class="btn btn-white btn-round btn-just-icon"> -->
<!--                                 <i class="material-icons">search</i> -->
<!--                                 <div class="ripple-container"></div> -->
<!--                             </button> -->
<!--                         </form> -->
                    </div>
                </div>
            </nav>

</div>





<div class="sidebar" data-color="blue" data-image="../resources/images/sidebar-3.jpg"  data-image="${pageContext.request.contextPath}/resources/images/sidebar-1.jpg}" >
			            <!--
			        Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"
			
			        Tip 2: you can also add an image using data-image tag
			    -->
			            <div class="logo">
<!-- 			                <a href="http://www.creative-tim.com" class="simple-text"> -->

  <img class="image-responsive" src="${pageContext.request.contextPath}/resources/images/logof.png" style="margin-top:1em;"></img>

<!-- 			                   <i class="fa fa-paw"></i> Senpai -->
			                </a>
			            </div>
			            
			            <div class="sidebar-wrapper">
			                <ul class="nav" id="menu">
			                    <li class="">
			                        <a  href="${pageContext.request.contextPath}/home/}">
			                            <i class="material-icons">Dashborder</i>
			                            <p>Dashborder</p>
			                        </a>
			                    </li>
			                    <li class="">
			                        <a href="${pageContext.request.contextPath}/usuario/movimentacao}" >
			                            <i class="material-icons">person</i>
			                            <p>Usuario</p>
			                        </a>
			                    </li>

			                    <li class="">
			                        <a  href="${pageContext.request.contextPath}/cliente/movimentacao/}" >
			                            <i class="material-icons">person</i>
			                            <p>Cliente</p>
			                        </a>
			                    </li>
			                    
			                    <li class="">
			                      <a  href="${pageContext.request.contextPath}/categoria/movimentacao}" >
			                    	<p>
			                      
<!--                                     <img alt="" src="img/lotofacilf.png" class="material-icons"></img> -->
			                         <i class="material-icons">favorite</i>
			                            
			                       
			                        Categoria </p>
			                         </a>
			                    </li>
			                    

			                    
			                    <li class="">
			                        <a  href="${pageContext.request.contextPath}/fornecedor/movimentacao}" >
			                        <p>
<!--                                     <img alt="" src="img/megasenaf.png" class="material-icons"></img> -->
			                         			                         <i class="material-icons">favorite</i>
			                         
			                         Fornecedor</p>
			                       
			                        </a>
			                    </li>
			                    
			                    
			                     <li class="">
			                        <a  href="${pageContext.request.contextPath}/garcon/movimentacao}" >
			                        <p>
<!--                                     <img alt="" src="img/lotomaniaf.png" class="material-icons"></img> -->
			                          	<i class="material-icons" >person</i>
			                          
			                          Garcon</p>
			                        </a>
			                    </li>
			                    
			                    
			                   <li class="">
			                        <a  href="${pageContext.request.contextPath}/mesa/movimentacao}" >
			                        <p>
                                    <i class="material-icons">table</i>
			                          Mesas</p>
			                        </a>
			                    </li>
								
									                   <li class="">
			                        <a  href="${pageContext.request.contextPath}/financeiro/movimentacao}" >
			                        <p>
                                    <i class="material-icons">pets</i>
			                          Financeiro</p>
			                        </a>
			                    </li>
								
								
									                   <li class="">
			                        <a  href="${pageContext.request.contextPath}/pedidocompra/movimentacao}" >
			                        <p>
                                    <i class="material-icons">sales</i>
			                          Compra</p>
			                        </a>
			                    </li>
			                    
			                    									                   <li class="">
			                        <a  href="${pageContext.request.contextPath}/pedidovenda/movimentacao}" >
			                        <p>
                                    <i class="material-icons">pets</i>
			                          Venda</p>
			                        </a>
			                    </li>
								
								
									                   <li class="">
			                        <a  href="${pageContext.request.contextPath}/produto/movimentacao}" >
			                        <p>
                                    <i class="material-icons">box</i>
			                          Produto</p>
			                        </a>
			                    </li>
			                    
			                    									                   <li class="">
			                        <a  href="${pageContext.request.contextPath}/jogobicho/movimentacao}" >
			                        <p>
                                    <i class="material-icons">pets</i>
			                          Bicho</p>
			                        </a>
			                    </li>
			                    
								
									                   <li class="">
			                        <a  href="${pageContext.request.contextPath}/jogobicho/movimentacao}" >
			                        <p>
                                    <i class="material-icons">pets</i>
			                          Bicho</p>
			                        </a>
			                    </li>
			                </ul>
			            </div>
			        </div>
			        
			        
			        
			  
        