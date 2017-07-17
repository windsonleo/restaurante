  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
  
    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brad" href="index.html"><img src="${pageContext.request.contextPath}/resources/images/logonome.png" /></a>
            </div>
            
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${usuarioAtt.username} <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="${pageContext.request.contextPath}/usuario/profile?id=${usuarioAtt.id}"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
<!--                         <li> -->
<!--                             <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a> -->
<!--                         </li> -->
<!--                         <li> -->
<!--                             <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a> -->
<!--                         </li> -->
                        <li class="divider"></li>
                        <li>
                            <a href="${pageContext.request.contextPath}/"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            
            
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    
<!--                     class="active" -->
                    
                    <li >
                        <a href="${pageContext.request.contextPath}/home"><i class="fa fa-tachometer" style="color:red;" aria-hidden="true"></i> Home</a>
                    </li>
                    
                         <li>
                        <a href="${pageContext.request.contextPath}/caixa/movimentacao"><i class="fa fa-institution" style="color:red;" aria-hidden="true"></i> Caixa</a>
                    </li>
                    
                         <li>
                        <a href="${pageContext.request.contextPath}/categoria/movimentacao"><i class="fa fa-institution" style="color:red;" aria-hidden="true"></i> Categoria</a>
                    </li>
                    
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/cliente/movimentacao"><i class="fa fa-user" style="color:red;" aria-hidden="true"></i> Clientes</a>
                    </li>
                    
                    
                      <li>
                        <a href="${pageContext.request.contextPath}/pedidovenda/entregas"><i class="fa fa-truck" style="color:red;" aria-hidden="true"></i> Entregas</a>
                    </li>
                    
                           <li>
                        <a href="${pageContext.request.contextPath}/formapagamento/movimentacao"><i class="fa fa-user" style="color:red;" aria-hidden="true"></i> FormaPagamento</a>
                    </li>
                    
                    
                         <li>
                        <a href="${pageContext.request.contextPath}/fornecedor/movimentacao"><i class="fa fa-user" style="color:red;" aria-hidden="true"></i> Fornecedor</a>
                    </li>
                    
                         <li>
                        <a href="${pageContext.request.contextPath}/garcon/movimentacao"><i class="fa fa-user" style="color:red;" aria-hidden="true"></i> Garçon</a>
                    </li>
                    
                          <li>
                        <a href="${pageContext.request.contextPath}/mesa/movimentacao"><i class="fa fa-table" style="color:red;" aria-hidden="true"></i> Mesas</a>
                    </li>
                    
                            <li>
                        <a href="${pageContext.request.contextPath}/pagamento/movimentacao"><i class="fa fa-shopping-cart" aria-hidden="true" style="color:red;"></i> Pagamentos</a>
                    </li>
                    
                      <li>
                        <a href="${pageContext.request.contextPath}/pedidovenda/movimentacao"><i class="fa fa-shopping-cart" aria-hidden="true" style="color:red;"></i> Pedidos de Venda</a>
                    </li>
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/produto/movimentacao"><i class="fa fa-briefcase" aria-hidden="true" style="color:red;"></i> Produtos</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/usuario/movimentacao"><i class="fa fa-user" style="color:red;" aria-hidden="true"></i> Usuarios</a>
                    </li>
                    
<!--                        <li> -->
<%--                         <a href="${pageContext.request.contextPath}/passeio/movimentacao"><i class="fa fa-anchor"></i> Programas</a> --%>
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="bootstrap-elements.html"><i class="fa fa-fw fa-desktop"></i> Bootstrap Elements</a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="bootstrap-grid.html"><i class="fa fa-fw fa-wrench"></i> Bootstrap Grid</a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Dropdown <i class="fa fa-fw fa-caret-down"></i></a> -->
<!--                         <ul id="demo" class="collapse"> -->
<!--                             <li> -->
<!--                                 <a href="#">Dropdown Item</a> -->
<!--                             </li> -->
<!--                             <li> -->
<!--                                 <a href="#">Dropdown Item</a> -->
<!--                             </li> -->
<!--                         </ul> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="blank-page.html"><i class="fa fa-fw fa-file"></i> Blank Page</a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a href="index-rtl.html"><i class="fa fa-fw fa-dashboard"></i> RTL Dashboard</a> -->
<!--                     </li> -->
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>