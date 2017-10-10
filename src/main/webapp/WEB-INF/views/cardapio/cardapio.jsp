<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>

<br>
<br>
<br>
<br>
<br>
<br>
<br>

<!--                 <div class="row carousel-holder"> -->

<!-- <!--                     <div class="col-md-12"> --> 
<!--                         <div id="carousel-example-generic" class="carousel slide" data-ride="carousel"> -->
<!--                             <ol class="carousel-indicators"> -->
<!--                                 <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li> -->
<!--                                 <li data-target="#carousel-example-generic" data-slide-to="1"></li> -->
<!--                                 <li data-target="#carousel-example-generic" data-slide-to="2"></li> -->
                                
<!--                             </ol> -->
<!--                             <div class="carousel-inner"> -->
<!--                                 <div class="item active"> -->
<%--                                     <img class="slide-image" src="${pageContext.request.contextPath}/resources/images/cardapio/1.jpg" alt="dasad"> --%>
<!--                                 </div> -->
<!--                                 <div class="item"> -->
<%--                                     <img class="slide-image" src="${pageContext.request.contextPath}/resources/images/cardapio/2.jpg" alt="fddgfd"> --%>
<!--                                 </div> -->
<!--                                 <div class="item"> -->
<%--                                     <img class="slide-image" src="${pageContext.request.contextPath}/resources/images/cardapio/3.jpg" alt="dfdfsdfsd"> --%>
<!--                                 </div> -->
<!--                             </div> -->
<!--                             <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev"> -->
<!--                                 <span class="glyphicon glyphicon-chevron-left"></span> -->
<!--                             </a> -->
<!--                             <a class="right carousel-control" href="#carousel-example-generic" data-slide="next"> -->
<!--                                 <span class="glyphicon glyphicon-chevron-right"></span> -->
<!--                             </a> -->
<!--                         </div> -->
                   

<!--                 </div> -->
    
<!--         <section id="about" class="about"> -->
<!-- <!--             <img src="../resources/images/cardapio/icons/about_colorr.png" class="img-responsive section-icon hidden-sm hidden-xs"> --> 
<!--             <div class="wrapper"> -->
<!--                 <div class="container-fluid"> -->
<!--                     <div class="row dis-table"> -->
<!--                         <div class="hidden-xs col-sm-6 section-bg about-bg dis-table-cell"> -->

<!--                         </div> -->
<!--                         <div class="col-xs-12 col-sm-6 dis-table-cell"> -->
<!--                             <div class="section-content"> -->
<!--                                 <h2 class="section-content-title">Sushi Senpai</h2> -->
<!--                                 <p class="section-content-para"> -->
<!--                                     O Restaurante Sushi Senpai foi Fundado em Outubro de 2015 pelo então Chef ..... compels the soul to look upward, and leads us from this world to another.  Curious that we spend more time congratulating people who have succeeded than encouraging people who have not. As we got further and further away, it [the Earth] diminished in size. -->
<!--                                 </p> -->
<!--                                 <p class="section-content-para"> -->
<!--                                     beautiful, warm, living object looked so fragile, so delicate, that if you touched it with a finger it would crumble and fall apart. Seeing this has to change a man.  Where ignorance lurks, so too do the frontiers of discovery and imagination. -->
<!--                                 </p> -->
<!--                             </div> /.section-content -->
<!--                         </div> -->
<!--                     </div> /.row -->
<!--                 </div> /.container-fluid -->
<!--             </div> /.wrapper -->
<!--         </section> /#about -->
        
        
         <section id="pricing" class="pricing">
            <div id="w">
                <div class="pricing-filter">
                    <div class="pricing-filter-wrapper">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-10 col-md-offset-1">
                                    <div class="section-header">
                                        <h2 class="pricing-title">O Cardápio </h2>
                                        	
                                        	<ul id="filter-list" class="clearfix">
                                            <li class="filter" data-filter="all">Todas</li>
                                      			
                                      			<c:forEach var="categoria" items="${categoriaList}" varStatus="id">
                                            		
                                            		<li class="filter" data-filter=".${categoria.nome}">${categoria.nome}</li>
                                        	
                                            
                                             	</c:forEach>
                                            
                                            

                                        </ul>  <!-- @end #filter-list -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container">
                    <div class="row">  
                        <div class="col-md-10 col-md-offset-1">
                            <ul id="menu-pricing" class="menu-price">
<!--                                 <li class="item dinner"> -->
									
									<c:forEach var="categoria" items="${categoriaList}" varStatus="id">
										
												<c:forEach var="produto" items="${categoria.produtos}" varStatus="id">
													
													 <li class="item ${categoria.nome}">

													<a href="#"> <img
														src="${pageContext.request.contextPath}/resources/images/produto/${produto.foto}.jpg"
														class="img-responsive" alt="Food" />
														<div class="menu-desc text-center">
															<span>
																<h3>${produto.nome}</h3>
																${produto.descricao}
															</span>
														</div>
													</a>

													<h2 class="white">${produto.precovenda}</h2>
                                					
                                					</li>
												
												</c:forEach>
										
										
									</c:forEach>

</ul>

  

                        </div>   
                    </div>
                </div>

            </div> 
        </section>
        
        
         <section id="great-place-to-enjoy" class="great-place-to-enjoy">
            <img class="img-responsive section-icon hidden-sm hidden-xs" src="${pageContext.request.contextPath}/resources/images/cardapio/icons/beer_black.png">
            <div class="wrapper">
                <div class="container-fluid">
                    <div class="row dis-table">
                        <div class="col-xs-6 col-sm-6 dis-table-cell color-bg">
                            <h3 class="section-title">Nosso Chef: Barbosa</h3>
                        </div>
                        <div class="col-xs-6 col-sm-6 dis-table-cell section-bg">
                            
                        </div>
                    </div> <!-- /.dis-table -->
                </div> <!-- /.row -->
            </div> <!-- /.wrapper -->
        </section> <!-- /#great-place-to-enjoy -->



        <!--==  9. Our Beer  ==-->
        <section id="beer" class="beer">
            <img class="img-responsive section-icon hidden-sm hidden-xs" src="${pageContext.request.contextPath}/resources/images/cardapio/icons/beer_color.png">
            <div class="container-fluid">
                <div class="row dis-table">
                    <div class="hidden-xs col-sm-6 dis-table-cell section-bg">

                    </div>

                    <div class="col-xs-12 col-sm-6 dis-table-cell">
                        <div class="section-content">
                            <h2 class="section-content-title">Chef :  Fabrício Barbosa</h2>
                            <div class="section-description">
                                <p class="section-content-para">
                                    Astronomy compels the soul to look upward, and leads us from this world to another.  Curious that we spend more time congratulating people who have succeeded than encouraging people who have not. As we got further and further away, it [the Earth] diminished in size.
                                </p>
                                <p class="section-content-para">
                                    beautiful, warm, living object looked so fragile, so delicate, that if you touched it with a finger it would crumble and fall apart. Seeing this has to change a man.  Where ignorance lurks, so too do the frontiers of discovery and imagination.Astronomy compels the soul to look upward, and leads us from this world to another.  Curious that we spend more time congratulating people who have succeeded than encouraging people who have not. As we got further and further away, it [the Earth] diminished in size.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>



        <!--== 10. Our Breakfast Menu ==-->
<!--         <section id="breakfast" class="breakfast"> -->
<%--             <img class="img-responsive section-icon hidden-sm hidden-xs" src="${pageContext.request.contextPath}/resources/images/cardapio/icons/bread_black.png"> --%>
<!--             <div class="wrapper"> -->
<!--                 <div class="container-fluid"> -->
<!--                     <div class="row dis-table"> -->
<!--                         <div class="col-xs-6 col-sm-6 dis-table-cell color-bg"> -->
<!--                             <h3 class="section-title">Nosso Sushi</h3> -->
<!--                         </div> -->
<!--                         <div class="col-xs-6 col-sm-6 dis-table-cell section-bg"> -->
                            
<!--                         </div> -->
<!--                     </div> /.dis-table -->
<!--                 </div> /.row -->
<!--             </div> /.wrapper -->
<!--         </section> /#breakfast -->



<!--         == 11. Our Bread == -->
<!--         <section id="bread" class="bread"> -->
<%--             <img class="img-responsive section-icon hidden-sm hidden-xs" src="${pageContext.request.contextPath}/resources/images/cardapio/icons/bread_color.png"> --%>
<!--             <div class="container-fluid"> -->
<!--                 <div class="row dis-table"> -->
<!--                     <div class="hidden-xs col-sm-6 dis-table-cell section-bg"> -->

<!--                     </div> -->
<!--                     <div class="col-xs-12 col-sm-6 dis-table-cell"> -->
<!--                         <div class="section-content"> -->
<!--                             <h2 class="section-content-title"> -->
<!--                                 Sushi Samba -->
<!--                             </h2> -->
<!--                             <div class="section-description"> -->
<!--                                 <p class="section-content-para"> -->
<!--                                     Astronomy compels the soul to look upward, and leads us from this world to another.  Curious that we spend more time congratulating people who have succeeded than encouraging people who have not. As we got further and further away, it [the Earth] diminished in size. -->
<!--                                 </p> -->
<!--                                 <p class="section-content-para"> -->
<!--                                     beautiful, warm, living object looked so fragile, so delicate, that if you touched it with a finger it would crumble and fall apart. Seeing this has to change a man.  Where ignorance lurks, so too do the frontiers of discovery and imagination. -->
<!--                                 </p> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </section> -->




        <!--== 12. Our Featured Dishes Menu ==-->
        <section id="featured-dish" class="featured-dish">
            <img class="img-responsive section-icon hidden-sm hidden-xs" src="${pageContext.request.contextPath}/resources/images/cardapio/icons/food_black.png">
            <div class="wrapper">
                <div class="container-fluid">
                    <div class="row dis-table">
                        <div class="col-xs-6 col-sm-6 dis-table-cell color-bg">
                            <h3 class="section-title">Sugestão do Chef</h3>
                        </div>
                        <div class="col-xs-6 col-sm-6 dis-table-cell section-bg">
                            
                        </div>
                    </div> <!-- /.dis-table -->
                </div> <!-- /.row -->
            </div> <!-- /.wrapper -->
        </section> <!-- /#featured-dish -->


  <!--== 13. Menu List ==-->
        <section id="menu-list" class="menu-list">
            <div class="container">
                <div class="row menu">
                    <div class="col-md-10 col-md-offset-1 col-sm-9 col-sm-offset-2 col-xs-12">
                       <div class="row">

 <c:forEach var="produto" items="${sugestaoList}" varStatus="id">
 
  	  <div class="col-md-3 col-sm-6 col-xs-12">
  	
  			 <c:forEach var="produtocomposto" items="${sugestaoListComposto}" varStatus="id">
  					
  								<div class="row">

                                    <div class="menu-catagory">
                                        <h3>${produtocomposto.categoria.nome}</h3>
                                    </div>
                                    
                                </div>
                            
                             
<!--                               <div class="col-md-3 col-sm-6 col-xs-12"> /-->
                              
                              <div class="col-md-12">
                                <div class="row">
                                    <div class="menu-item">
                                        <h4 class="menu-title">${produtocomposto.nome}</h4>
                                        <p class="menu-about">${produtocomposto.descricao}</p>

                                        <div class="menu-system">
                                            <div class="half">
                                                <p class="per-head">
                                                    <span><i class="fa fa-user"></i></span>1:1
                                                </p>
                                            </div>
                                            <div class="half">
                                                <p class="price">R$ ${produtocomposto.precovenda}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div> 
<!--                                 </div> -->
<!-- 							</div> -->
							


			</c:forEach>
			
			
			<div class="row">

                                    <div class="menu-catagory">
                                        <h3>${produto.categoria.nome}</h3>
                                    </div>
                                    
                                </div>
                            
                             
<!--                               <div class="col-md-3 col-sm-6 col-xs-12"> /-->
                              
                              <div class="col-md-12">
                                <div class="row">
                                    <div class="menu-item">
                                        <h4 class="menu-title">${produto.nome}</h4>
                                        <p class="menu-about">${produto.descricao}</p>

                                        <div class="menu-system">
                                            <div class="half">
                                                <p class="per-head">
                                                    <span><i class="fa fa-user"></i></span>1:1
                                                </p>
                                            </div>
                                            <div class="half">
                                                <p class="price">R$ ${produto.precovenda}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div> 
                                
                                </div>
</c:forEach>
							</div>
							</div>



                        <div id="moreMenuContent"></div>
                        <div class="text-center">
                            <a id="loadMenuContent" class="btn btn-middle hidden-sm hidden-xs">Carregar Mais <span class="caret"></span></a>
                        </div>
                    </div>
                    </div>
                    

        </section>


 




        <!--== 15. Reserve A Table! ==-->
<!--         <section id="reserve" class="reserve"> -->
<%--             <img class="img-responsive section-icon hidden-sm hidden-xs" src="${pageContext.request.contextPath}/resources/images/cardapio/icons/reserve_black.png"> --%>
<!--             <div class="wrapper"> -->
<!--                 <div class="container-fluid"> -->
<!--                     <div class="row dis-table"> -->
<!--                         <div class="col-xs-6 col-sm-6 dis-table-cell color-bg"> -->
<!--                             <h3 class="section-title">Reserve uma Mesa.</h3> -->
<!--                         </div> -->
<!--                         <div class="col-xs-6 col-sm-6 dis-table-cell section-bg"> -->
                            
<!--                         </div> -->
<!--                     </div> /.dis-table -->
<!--                 </div> /.row -->
<!--             </div> /.wrapper -->
<!--         </section> /#reserve -->



<!--         <section class="reservation"> -->
<%--             <img class="img-responsive section-icon hidden-sm hidden-xs" src="${pageContext.request.contextPath}/resources/images/cardapio/icons/reserve_color.png"> --%>
<!--             <div class="wrapper"> -->
<!--                 <div class="container-fluid"> -->
<!--                     <div class=" section-content"> -->
<!--                         <div class="row"> -->
<!--                             <div class="col-md-5 col-sm-6"> -->
<%--                                 <form class="reservation-form" method="post" action="reserve.php"> --%>
<!--                                     <div class="row"> -->
<!--                                         <div class="col-md-6 col-sm-6"> -->
<!--                                             <div class="form-group"> -->
<!--                                                 <input type="text" class="form-control reserve-form empty iconified" name="name" id="name" required="required" placeholder="  &#xf007;  Name"> -->
<!--                                             </div> -->
<!--                                             <div class="form-group"> -->
<!--                                                 <input type="email" name="email" class="form-control reserve-form empty iconified" id="email" required="required" placeholder="  &#xf1d8;  e-mail"> -->
<!--                                             </div> -->
<!--                                         </div> -->

<!--                                         <div class="col-md-6 col-sm-6"> -->
<!--                                             <div class="form-group"> -->
<!--                                                 <input type="tel" class="form-control reserve-form empty iconified" name="phone" id="phone" required="required" placeholder="  &#xf095;  Phone"> -->
<!--                                             </div> -->
<!--                                             <div class="form-group"> -->
<!--                                                 <input type="text" class="form-control reserve-form empty iconified" name="datepicker" id="datepicker" required="required" placeholder="&#xf017;  Time"> -->
<!--                                             </div> -->
<!--                                         </div> -->

<!--                                         <div class="col-md-12 col-sm-12"> -->
<!--                                             <textarea type="text" name="message" class="form-control reserve-form empty iconified" id="message" rows="3" required="required" placeholder="  &#xf086;  We're listening"></textarea> -->
<!--                                         </div> -->

<!--                                         <div class="col-md-12 col-sm-12"> -->
<!--                                             <button type="submit" id="submit" name="submit" class="btn btn-reservation"> -->
<!--                                                 <span><i class="fa fa-check-circle-o"></i></span> -->
<!--                                                 Efetuar Reserva -->
<!--                                             </button> -->
<!--                                         </div> -->
                                            
<!--                                     </div> -->
<%--                                 </form> --%>
<!--                             </div> -->

<!--                             <div class="col-md-2 hidden-sm hidden-xs"></div> -->

<!--                             <div class="col-md-4 col-sm-6 col-xs-12"> -->
<!--                                 <div class="opening-time"> -->
<!--                                     <h4 class="opening-time-title">Salão</h4> -->
<!--                                      <p>Seg a Quinta: 18:00 PM - 00:00 AM</p> -->
<!--                                      <p>Sab & Dom: 18:00 AM - 1:00 AM</p> -->

<!--                                     <div class="launch"> -->
<!--                                         <h4>Entregas</h4> -->
<!--                                         <p>Seg to Quinta: 18:00 PM - 00:00 AM</p> -->
<!--                                         <p>Sab & Dom: 18:00 AM - 1:00 AM</p> -->
<!--                                     </div> -->

<!--                                     <div class="dinner"> -->
<!--                                         <h4>Dinner</h4> -->
<!--                                         <p>Mon to Sat: 6:00 PM - 1:00 AM</p> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->

<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </section> -->




<!--         <section id="contact" class="contact"> -->
<!--             <div class="container-fluid color-bg"> -->
<!--                 <div class="row dis-table"> -->
<!--                     <div class="hidden-xs col-sm-6 dis-table-cell"> -->
<!--                         <h3 class="section-title">Contato</h3> -->
<!--                     </div> -->
<!--                     <div class="col-xs-6 col-sm-6 dis-table-cell"> -->
<!--                         <div class="section-content"> -->
<!--                    			<p>R. Dois Irmão nº33 Barra de Jangada</p> -->
<!--                             <p>+55 81 98715-0653</p> -->
<!--                             <p>sushisenpai@sushisenpai.com </p> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--                 <div class="social-media"> -->
<!--                     <div class="row"> -->
<!--                         <div class="col-md-6 col-md-offset-3"> -->
<!--                             <ul class="center-block"> -->
<!--                                 <li><a href="#" class="fb"></a></li> -->
<!--                                 <li><a href="#" class="inst"></a></li> -->
<!-- <!--                                 <li><a href="#" class="g-plus"></a></li> -->
<!-- <!--                                 <li><a href="#" class="link"></a></li> --> 
<!--                             </ul> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </section> -->

<!--         <div class="container-fluid"> -->
<!--             <div class="row"> -->
<!--                 <div id="map-canvas"></div> -->
<!--             </div> -->
<!--         </div> -->



<!--         <section class="contact-form"> -->
<!--             <div class="container"> -->
<!--                 <div class="row"> -->
<!--                     <div class="col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1"> -->
<!--                         <div class="row"> -->
<%--                              <form class="contact-form" method="post" action="contact.php"> --%>
                                
<!--                                 <div class="col-md-6 col-sm-6"> -->
<!--                                     <div class="form-group"> -->
<!--                                         <input  name="name" type="text" class="form-control" id="name" required="required" placeholder="  Name"> -->
<!--                                     </div> -->
<!--                                     <div class="form-group"> -->
<!--                                         <input name="email" type="email" class="form-control" id="email" required="required" placeholder="  Email"> -->
<!--                                     </div> -->
<!--                                     <div class="form-group"> -->
<!--                                         <input name="subject" type="text" class="form-control" id="subject" required="required" placeholder="  Subject"> -->
<!--                                     </div> -->
<!--                                 </div> -->

<!--                                 <div class="col-md-6 col-sm-6"> -->
<!--                                     <textarea name="message" type="text" class="form-control" id="message" rows="7" required="required" placeholder="  Message"></textarea> -->
<!--                                 </div> -->

<!--                                 <div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3"> -->
<!--                                     <div class="text-center"> -->
<!--                                         <button type="submit" id="submit" name="submit" class="btn btn-send">Enviar </button> -->
<!--                                     </div> -->
<!--                                 </div> -->
<%--                             </form> --%>
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </section> -->


        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="copyright text-center">
                            <p>
                                &copy; Copyright, 2017 <a href="#"> </a> TecSoluction Desenvolvendo Soluções <a href="#"  target="_blank"></a>
                            </p>
                        </div>
                    </div>
                    
                    
                </div>
            </div>
        </footer>
        
        
        