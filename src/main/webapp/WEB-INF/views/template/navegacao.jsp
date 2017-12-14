<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page session="false" %>

<!-- <div class="profile clearfix"> -->

<!-- </div> -->

<div id="header">

    <div class="sidebar" data-color="blue" data-image="../resources/images/sidebar-3.jpg"
         data-image="${pageContext.request.contextPath}/resources/images/sidebar-1.jpg}">
        <!--
    Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

    Tip 2: you can also add an image using data-image tag
-->
        <div class="logo">
            <!-- 			                <a href="http://www.creative-tim.com" class="simple-text"> -->

            <%--   <img class="image-responsive" src="${pageContext.request.contextPath}/resources/images/logosenpai.png"></img> --%>

            <!-- 			                   <i class="fa fa-paw"></i> Senpai -->
            <!-- 			                </a> -->

            <div class="logo">
                <a href="${pageContext.request.contextPath}/" class="simple-text">
                    <i class="fa fa-paw"></i> Tecsoluction
                </a>
            </div>
        </div>

        <div class="sidebar-wrapper">
            <ul class="nav" id="menu">
                <li class="active">
                    <a href="${pageContext.request.contextPath}/">
                        <i class="material-icons">dashboard</i>
                        <p>Dashbord</p>
                    </a>
                </li>

                <li class="">
                    <a href="${pageContext.request.contextPath}/usuario/movimentacao">
                        <i class="material-icons">person</i>
                        <p>Usuario</p>
                    </a>
                </li>

                <li class="">
                    <a href="${pageContext.request.contextPath}/cliente/movimentacao">
                        <i class="material-icons">person</i>
                        <p>Cliente</p>
                    </a>
                </li>

                <li class="">
                    <a href="${pageContext.request.contextPath}/categoria/movimentacao">
                        <p>

                            <!--                                     <img alt="" src="img/lotofacilf.png" class="material-icons"></img> -->
                            <i class="material-icons">account_balance_wallet</i>

                            Categoria </p>
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

                        <p><i class="material-icons">shopping_basket</i>Compras</p>

                    </a>
                    <ul class="dropdown-menu">

                        <li><a href="${pageContext.request.contextPath}/pedidocompra/movimentacao">Pedido Compra</a>
                        </li>
                        <li><a href="${pageContext.request.contextPath}/recebimento/movimentacao">Recebimento</a></li>
                        <li><a href="#">Devolucao de Compra</a></li>
                    </ul>

                </li>


                <li class="dropdown">

                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">

                        <p><i class="material-icons">monetization_on</i>Financeiro</p>

                    </a>
                    <ul class="dropdown-menu">

                        <li><a href="${pageContext.request.contextPath}/banco/movimentacao">Banco</a></li>
                        <li><a href="${pageContext.request.contextPath}/caixa/movimentacao">Caixa</a></li>
                        <li><a href="${pageContext.request.contextPath}/conta/movimentacao">Conta</a></li>
                        <li><a href="${pageContext.request.contextPath}/formapagamento/movimentacao">Forma de
                            Pagamento</a></li>
                        <li><a href="chat.html">A Pagar</a></li>
                        <li><a href="chat.html">A Receber</a></li>
                        <li><a href="${pageContext.request.contextPath}/despesa/movimentacao">Despesa</a></li>
                        <li><a href="${pageContext.request.contextPath}/pagamento/movimentacao">Pagamento</a></li>
                    </ul>

                </li>


                <li class="dropdown">

                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">

                        <p><i class="material-icons">business_center</i>Produto</p>

                    </a>
                    <ul class="dropdown-menu">

                        <li><a href="${pageContext.request.contextPath}/produto/movimentacao">Produto</a></li>
                        <li><a href="${pageContext.request.contextPath}/produtocomposto/movimentacao">Produto
                            Composto</a></li>
                        <li><a href="#">Conf Produto</a></li>

                    </ul>

                </li>

                <li class="dropdown">

                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">

                        <p><i class="material-icons">shopping_cart</i>Vendas</p>

                    </a>
                    <ul class="dropdown-menu">

                        <li><a href="${pageContext.request.contextPath}/pedidovenda/movimentacao">Pedido Venda</a></li>
                        <li><a href="form-validation.html">Devolucao Venda</a></li>
                        <li><a href="#">Conf Vendas</a></li>

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

</div>
			        
			  
        
