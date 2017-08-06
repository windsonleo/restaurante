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
                <img src="${pageContext.request.contextPath}/resources/images/logonomenova.png" /></a>
            </div>
            
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
            
            
                             <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Compra<b class="caret"></b></a>
                    <ul class="dropdown-menu">
<li>
                                <a href="${pageContext.request.contextPath}/banco/movimentacao"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Pedido Compra</a>
                            </li>
                            
                            <li>
                                <a href="#"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Recebimento </a>
                            </li>
                            
                          <li>
                        <a href="${pageContext.request.contextPath}/formapagamento/movimentacao"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Devolução</a>
                    </li>
                            
<!--                              <li> -->
<!--                                 <a href="#"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Contas a Pagar</a> -->
<!--                             </li> -->
                            
<!--                                         <li> -->
<!--                                 <a href="#"> <i class="fa fa-user" style="color:"";" aria-hidden="true"></i>Contas a Receber</a> -->
<!--                             </li> -->
                    </ul>
                </li>
            
            
            
                 <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Empresa<b class="caret"></b></a>
                    <ul class="dropdown-menu">
<li>
                                <a href="${pageContext.request.contextPath}/empresa/movimentacao"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Sobre</a>
                            </li>
                            
                            <li>
                                <a href="${pageContext.request.contextPath}/empresa/metas"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Metas </a>
                            </li>
                            
<!--                           <li> -->
<%--                         <a href="${pageContext.request.contextPath}/formapagamento/movimentacao"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Formas de Pagamento</a> --%>
<!--                     </li> -->
                            
<!--                              <li> -->
<!--                                 <a href="#"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Contas a Pagar</a> -->
<!--                             </li> -->
                            
<!--                                         <li> -->
<!--                                 <a href="#"> <i class="fa fa-user" style="color:"";" aria-hidden="true"></i>Contas a Receber</a> -->
<!--                             </li> -->
                    </ul>
                </li>
            
            
            
            
                            <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Financeiro<b class="caret"></b></a>
                    <ul class="dropdown-menu">
<li>
                                <a href="${pageContext.request.contextPath}/banco/movimentacao"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Banco</a>
                            </li>
                            
                                <li >
                        <a href="${pageContext.request.contextPath}/caixa/movimentacao"><i class="fa fa-institution" style="color:"";" aria-hidden="true"></i> Caixa</a>
                    </li>
                            
                            <li>
                                <a href="#"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Conta </a>
                            </li>
                            
                          <li>
                        <a href="${pageContext.request.contextPath}/formapagamento/movimentacao"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Formas Pag</a>
                    </li>
                            
                             <li>
                                <a href="#"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> À Pagar</a>
                            </li>
                            
                                        <li>
                                <a href="#"> <i class="fa fa-user" style="color:"";" aria-hidden="true"></i>À Receber</a>
                            </li>
                            
                                      <li>
                        <a href="${pageContext.request.contextPath}/despesa/movimentacao"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Despesas</a>
                        
                                                    <li>
                        <a href="${pageContext.request.contextPath}/pagamento/movimentacao"><i class="fa fa-shopping-cart" aria-hidden="true" style="color:"";"></i> Pagamentos</a>
                    </li>
                    </li>
                    </ul>
                </li>
                
                                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Estoque<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                         <li>
                                <a href="#"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Balanço</a>
                            </li>
                            
                            <li>
                                <a href="${pageContext.request.contextPath}/estoque/movimentacao"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Movimentacao </a>
                            </li>
                            
                          <li>
                        <a href="${pageContext.request.contextPath}/formapagamento/movimentacao"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Relatório</a>
                    </li>
                    </ul>
                </li>
                
                                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i>Relatórios <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                    
                           <li>
                            <a href="${pageContext.request.contextPath}/usuario/profile?id=${usuarioAtt.id}"><i class="fa fa-fw fa-user"></i> Categoria</a>
                        </li>
                        
                               <li>
                            <a href="${pageContext.request.contextPath}/usuario/profile?id=${usuarioAtt.id}"><i class="fa fa-fw fa-user"></i> Cliente</a>
                        </li>
                        
                               <li>
                            <a href="${pageContext.request.contextPath}/usuario/profile?id=${usuarioAtt.id}"><i class="fa fa-fw fa-user"></i> Compras</a>
                        </li>
                        
                               <li>
                            <a href="${pageContext.request.contextPath}/usuario/profile?id=${usuarioAtt.id}"><i class="fa fa-fw fa-user"></i> Empresa</a>
                        </li>
                        
                               <li>
                            <a href="${pageContext.request.contextPath}/usuario/profile?id=${usuarioAtt.id}"><i class="fa fa-fw fa-user"></i> Entregas</a>
                        </li>
                        
                               <li>
                            <a href="${pageContext.request.contextPath}/usuario/profile?id=${usuarioAtt.id}"><i class="fa fa-fw fa-user"></i> Fornecedor</a>
                        </li>
                        
                               <li>
                            <a href="${pageContext.request.contextPath}/usuario/profile?id=${usuarioAtt.id}"><i class="fa fa-fw fa-user"></i> Financeiro</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/usuario/profile?id=${usuarioAtt.id}"><i class="fa fa-fw fa-user"></i> Fornecedor</a>
                        </li>
                        
                                                <li>
                            <a href="${pageContext.request.contextPath}/usuario/profile?id=${usuarioAtt.id}"><i class="fa fa-fw fa-user"></i> Garcon</a>
                        </li>
                                                <li>
                            <a href="${pageContext.request.contextPath}/usuario/profile?id=${usuarioAtt.id}"><i class="fa fa-fw fa-user"></i> Mesa</a>
                        </li>
                                                <li>
                            <a href="${pageContext.request.contextPath}/usuario/profile?id=${usuarioAtt.id}"><i class="fa fa-fw fa-user"></i> Produto</a>
                        </li>
                                                <li>
                            <a href="${pageContext.request.contextPath}/usuario/profile?id=${usuarioAtt.id}"><i class="fa fa-fw fa-user"></i> Usuario</a>
                        </li>
                                                <li>
                            <a href="${pageContext.request.contextPath}/usuario/profile?id=${usuarioAtt.id}"><i class="fa fa-fw fa-user"></i> Venda</a>
                        </li>
                                                <li>
                            <a href="${pageContext.request.contextPath}/usuario/profile?id=${usuarioAtt.id}"><i class="fa fa-fw fa-user"></i> Cliente</a>
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
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/home" ><i class="fa fa-tachometer" style="color:white;" aria-hidden="true"></i> Home</a>
                    </li>
                    
<!--                       <li > -->
<%--                         <a href="${pageContext.request.contextPath}/caixa/movimentacao"><i class="fa fa-institution" style="color:"";" aria-hidden="true"></i> Caixa</a> --%>
<!--                     </li> -->
                    
                         <li>
                        <a href="${pageContext.request.contextPath}/categoria/movimentacao"><i class="fa fa-institution" style="color:white;" aria-hidden="true"></i> Categoria</a>
                    </li>
                    
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/cliente/movimentacao"><i class="fa fa-user" style="color:white;" aria-hidden="true"></i> Clientes</a>
                    </li>
                    
<!--                      <li> -->
<%--                         <a href="${pageContext.request.contextPath}/despesa/movimentacao"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Despesas</a> --%>
<!--                     </li> -->
                    
<!--                                <li> -->
<%--                         <a href="${pageContext.request.contextPath}/empresa/movimentacao"><i class="fa fa-truck" style="color:"";" aria-hidden="true"></i> Empresa</a> --%>
<!--                     </li> -->
                    
                    
                      <li>
                        <a href="${pageContext.request.contextPath}/pedidovenda/entregas"><i class="fa fa-truck" style="color:white;" aria-hidden="true"></i> Entregas</a>
                    </li>
                    
                    
<!--                                        <li> -->
<!--                         <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Estoque <i class="fa fa-fw fa-caret-down"></i></a> -->
<!--                         <ul id="demo" class="collapse"> -->
                        
<!--                            <li> -->
<!--                                 <a href="#"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Balanço</a> -->
<!--                             </li> -->
                            
<!--                             <li> -->
<%--                                 <a href="${pageContext.request.contextPath}/estoque/movimentacao"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Movimentacao </a> --%>
<!--                             </li> -->
                            
<!--                           <li> -->
<%--                         <a href="${pageContext.request.contextPath}/formapagamento/movimentacao"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Relatório</a> --%>
<!--                     </li> -->
                            

                            
<!--                         </ul> -->
                        
<!--                     </li> -->
                    
                    
                    
                    
<!--                             <li> -->
<%--                         <a href="${pageContext.request.contextPath}/financeiro/movimentacao"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Financeiro</a> --%>
<!--                     </li> -->
                    
<!--                    <li> -->
<!--                         <a href="javascript:;" data-toggle="collapse" data-target="#demo2"><i class="fa fa-fw fa-arrows-v"></i> Financeiro <i class="fa fa-fw fa-caret-down"></i></a> -->
<!--                         <ul id="demo2" class="collapse"> -->
                        
<!--                            <li> -->
<%--                                 <a href="${pageContext.request.contextPath}/banco/movimentacao"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Banco</a> --%>
<!--                             </li> -->
                            
<!--                             <li> -->
<!--                                 <a href="#"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Conta </a> -->
<!--                             </li> -->
                            
<!--                           <li> -->
<%--                         <a href="${pageContext.request.contextPath}/formapagamento/movimentacao"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Formas de Pagamento</a> --%>
<!--                     </li> -->
                            
<!--                              <li> -->
<!--                                 <a href="#"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Contas a Pagar</a> -->
<!--                             </li> -->
                            
<!--                                         <li> -->
<!--                                 <a href="#"> <i class="fa fa-user" style="color:"";" aria-hidden="true"></i>Contas a Receber</a> -->
<!--                             </li> -->
                            
<!--                         </ul> -->
                        
<!--                     </li> -->
                    
                       
                    
                    
                         <li>
                        <a href="${pageContext.request.contextPath}/fornecedor/movimentacao"><i class="fa fa-user" style="color:white;" aria-hidden="true"></i> Fornecedor</a>
                    </li>
                    
                         <li>
                        <a href="${pageContext.request.contextPath}/garcon/movimentacao"><i class="fa fa-user" style="color:white;" aria-hidden="true"></i> Garçon</a>
                    </li>
                    
                          <li>
                        <a href="${pageContext.request.contextPath}/mesa/movimentacao"><i class="fa fa-table" style="color:white;" aria-hidden="true"></i> Mesas</a>
                    </li>
                    

                    
                                
                    <li>
                        <a href="${pageContext.request.contextPath}/produto/movimentacao"><i class="fa fa-briefcase" aria-hidden="true" style="color:white;"></i> Produtos</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/usuario/movimentacao"><i class="fa fa-user" style="color:white;" aria-hidden="true"></i> Usuarios</a>
                    </li>
                    
                  <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo2"><i class="fa fa-fw fa-arrows-v"></i> Vendas <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo2" class="collapse">
                        
                                     <li>
                        <a href="${pageContext.request.contextPath}/pedidovenda/movimentacao"><i class="fa fa-shopping-cart" aria-hidden="true" style="color:"";"></i> Pedidos de Venda</a>
                    </li>
                            <li>
                                <a href="#"><i class="fa fa-user" style="color:"";" aria-hidden="true"></i> Devolução de Venda </a>
                            </li>
                            
                            
                        </ul>
                        
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
        
   
        
        