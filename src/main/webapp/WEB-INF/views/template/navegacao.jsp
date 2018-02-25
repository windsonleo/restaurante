<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page session="true" %>



    <div class="sidebar" data-color="red" data-image="${pageContext.request.contextPath}/resources/images/sidebar-3.png"
        >
        <!--
    Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

    Tip 2: you can also add an image using data-image tag
-->
<!--         <div class="logo"> -->
            <!-- 			                <a href="http://www.creative-tim.com" class="simple-text"> -->

            <%--   <img class="image-responsive" src="${pageContext.request.contextPath}/resources/images/logosenpai.png"></img> --%>

            <!-- 			                   <i class="fa fa-paw"></i> Senpai -->
            <!-- 			                </a> -->

            <div class="logo">
                <a href="${pageContext.request.contextPath}/" class="simple-text">
                   
             <img class="image-responsive"
            src="${pageContext.request.contextPath}/resources/images/logo3dd.png"/>
                    
                </a>
            </div>
<!--         </div> -->

        <div class="sidebar-wrapper">
            
            <ul class="nav navbar-footer" id="menu">
             
                <li class="active">
                    <a href="${pageContext.request.contextPath}/">
                        <i class="material-icons">dashboard</i>
                        Dashbord
                    </a>
                </li>

                <li class="">
                    <a href="${pageContext.request.contextPath}/usuario/movimentacao">
                        <i class="material-icons">face</i>
                        Usuario
                    </a>
                </li>

                <li class="focus">
                    <a href="${pageContext.request.contextPath}/cliente/movimentacao">
                        <i class="material-icons">person</i>
                       Cliente
                    </a>
                </li>

                <li class="">
                    <a href="${pageContext.request.contextPath}/categoria/movimentacao">
                        
                            <i class="material-icons">account_balance_wallet</i>

                            Categoria
                    </a>
                </li>


                <li class="">
                    <a href="${pageContext.request.contextPath}/fornecedor/movimentacao">
                        <p>
                            <!--                                     <img alt="" src="img/megasenaf.png" class="material-icons"></img> -->
                            <i class="icon icon-truck"></i>

                            Fornecedor</p>

                    </a>
                </li>


                <li class="">
                    <a href="${pageContext.request.contextPath}/garcon/movimentacao">
                        <p>
                            <!--                                     <img alt="" src="img/lotomaniaf.png" class="material-icons"></img> -->
                            <i class="material-icons">room_service</i>
                            Garcon</p>
                    </a>
                </li>


                <li class="">
                    <a href="${pageContext.request.contextPath}/mesas/movimentacao">
                        <p>
                            <i class="material-icons">table</i>
                            Mesas</p>
                    </a>
                </li>


                <li class="dropdown">

                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">

                        <i class="material-icons">shopping_basket</i>
                        Compras
                        <b class="caret"></b>

                    </a>
                    
                    <ul class="dropdown-menu">

                        <li> <a href="${pageContext.request.contextPath}/pedidocompra/movimentacao">
                       
	                        <i class="material-icons">shopping_basket</i>
	                        Pedido Compra
	
	                        </a>
	                         
                        
                        </li>
                        
                        <li><a href="${pageContext.request.contextPath}/devolucaocompra/movimentacao">
                        
                        <i class="material-icons">shopping_basket</i>
                        
                        Devolucao de Compra
                        
                        </a>
                        
                        </li>
                        
                     <li><a href="${pageContext.request.contextPath}/recebimento/movimentacao">
                        
                        <i class="material-icons">shopping_basket</i>
                        
                        Recebimento
                        
                        </a>
                        
                        </li>
<!--                         <li><a href="#">Devolucao de Compra</a></li> -->
                    </ul>

                </li>


                <li class="dropdown">

                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">

                        <p><i class="material-icons">monetization_on</i>Financeiro
                          <b class="caret"></b>
                        
                        </p>

                    </a>
                    <ul class="dropdown-menu">

                        <li><a href="${pageContext.request.contextPath}/banco/movimentacao"><i class="material-icons">monetization_on</i>Banco</a></li>
                        <li><a href="${pageContext.request.contextPath}/caixa/movimentacao"><i class="material-icons">monetization_on</i>Caixa</a></li>
                        <li><a href="${pageContext.request.contextPath}/conta/movimentacao"><i class="material-icons">monetization_on</i>Conta</a></li>
                        <li><a href="${pageContext.request.contextPath}/formapagamento/movimentacao"><i class="material-icons">monetization_on</i>Forma de
                            Pagamento</a></li>
                        <li><a href="${pageContext.request.contextPath}/contaspagar/movimentacao"><i class="material-icons">monetization_on</i>A Pagar</a></li>
                        <li><a href="${pageContext.request.contextPath}/contasreceber/movimentacao"><i class="material-icons">monetization_on</i>A Receber</a></li>
                        <li><a href="${pageContext.request.contextPath}/despesa/movimentacao"><i class="material-icons">monetization_on</i>Despesa</a></li>
                        <li><a href="${pageContext.request.contextPath}/pagamento/movimentacao"><i class="material-icons">monetization_on</i>Pagamento</a></li>
                    </ul>

                </li>


                <li class="dropdown">

                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">

                       <p> <i class="material-icons">business_center</i>Produto
                       <b class="caret"></b>
						</p>
                    </a>
                     
                    <ul class="dropdown-menu">

                        <li><a href="${pageContext.request.contextPath}/produto/movimentacao"><i class="material-icons">business_center</i>Produto</a></li>
                        <li><a href="${pageContext.request.contextPath}/produtocomposto/movimentacao"><i class="material-icons">business_center</i>Produto
                            Composto</a></li>
                       <li><a href="#"> <i class="material-icons">business_center</i>Conf Produto</a></li>

                    </ul>

                </li>

                <li class="dropdown">

                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">

                        <p><i class="material-icons">shopping_cart</i>Vendas
                         <b class="caret"></b>
                        
                        </p>
						
                    </a>
                    <ul class="dropdown-menu">

                        <li><a href="${pageContext.request.contextPath}/pedidovenda/movimentacao"><i class="material-icons">shopping_cart</i>Pedido Venda</a></li>
                        <li><a href="${pageContext.request.contextPath}/devolucaovenda/movimentacao"><i class="material-icons">shopping_cart</i>Devolucao Venda</a></li>
                        <li><a href="#"><i class="material-icons">shopping_cart</i>Conf Vendas</a></li>

                    </ul>

                </li>


                <!-- 									                   <li class=""> -->
                <%-- 			                        <a  href="${pageContext.request.contextPath}/jogobicho/movimentacao}" > --%>
                <!-- 			                        <p> -->
                <!--                                     <i class="material-icons">pets</i> -->
                <!-- 			                          Bicho</p> -->
                <!-- 			                        </a> -->
                <!-- 			                    </li> -->
            </ul>
        </div>
        
        

        
    </div>

<!-- </div> -->
			        
			  
        
