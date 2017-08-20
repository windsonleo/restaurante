<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!--main-container-part-->

<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
  </div>
<!--End-breadcrumbs-->

<!--Action boxes-->
  <div class="container-fluid">
    <div class="quick-actions_homepage">
      <ul class="quick-actions">
        <li class="bg_lb"> <a href="${pageContext.request.contextPath}/cliente/"> <i class="icon-dashboard"></i> <span class="label label-important">${clientesnovos.size()}</span> Clientes </a> </li>
        <li class="bg_lg span3"> <a href="${pageContext.request.contextPath}/produto/"> <i class="icon-signal"></i> Produtos</a> </li>
        <li class="bg_ly"> <a href="${pageContext.request.contextPath}/pedidovenda/"> <i class="icon-inbox"></i><span class="label label-success">${pedidovendasnovos.size()}</span> Pedidos </a> </li>
        <li class="bg_lo"> <a href="${pageContext.request.contextPath}/mesa/salao"> <i class="icon-th"></i> Mesas</a> </li>
        <li class="bg_ls"> <a href="${pageContext.request.contextPath}/garcon/"> <i class="icon-fullscreen"></i> Garçon</a> </li>
        <li class="bg_lo span3"> <a href="${pageContext.request.contextPath}/pagamento/movimentacao"> <i class="icon-th-list"></i> Pagamentos</a> </li>
        <li class="bg_ls"> <a href="${pageContext.request.contextPath}/fornecedor/movimentacao"> <i class="icon-tint"></i> Fornecedor</a> </li>
        <li class="bg_lb"> <a href="${pageContext.request.contextPath}/estoque/movimentacao"> <i class="icon-pencil"></i>Estoque</a> </li>
<!--         <li class="bg_lg"> <a href="calendar.html"> <i class="icon-calendar"></i> Calendar</a> </li> -->
<!--         <li class="bg_lr"> <a href="error404.html"> <i class="icon-info-sign"></i> Error</a> </li> -->

      </ul>
    </div>
<!--End-Action boxes-->    

<!--Chart-box-->    
    <div class="row-fluid">
      <div class="widget-box">
        <div class="widget-title bg_lg"><span class="icon"><i class="icon-signal"></i></span>
          <h5>Site Analytics</h5>
        </div>
        <div class="widget-content" >
          <div class="row-fluid">
            <div class="span9">
              <div class="chart"></div>
            </div>
            <div class="span3">
              <ul class="site-stats">
                <li class="bg_lh"><i class="icon-user"></i> <strong>${usuarios.size() }</strong> <small>Total Users</small></li>
                <li class="bg_lh"><i class="icon-plus"></i> <strong>${usuarios.size() }</strong> <small>New Users </small></li>
                <li class="bg_lh"><i class="icon-shopping-cart"></i> <strong>${pedidovendasnovos.size() }</strong> <small>Total Shop</small></li>
                <li class="bg_lh"><i class="icon-tag"></i> <strong>${pedidovendasnovos.size() }</strong> <small>Total Orders</small></li>
                <li class="bg_lh"><i class="icon-repeat"></i> <strong>10</strong> <small>Pending Orders</small></li>
                <li class="bg_lh"><i class="icon-globe"></i> <strong>8540</strong> <small>Online Orders</small></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
            
       <div class="widget-box">
          
          <div class="widget-title"> <span class="icon"><i class="icon-ok"></i></span>
            <h5>Progresso das Metas </h5>
          </div>
            <ul class="unstyled">
              <li> <span class="icon24 icomoon-icon-arrow-up-2 green"></span> 81% Meta de Pedido de Vendas <span class="pull-right strong">567</span>
                <div class="progress progress-striped ">
                  <div style="width: 81%;" class="bar"></div>
                </div>
              </li>
              <li> <span class="icon24 icomoon-icon-arrow-up-2 green"></span> 72% Metas de Clientes Novos <span class="pull-right strong">507</span>
                <div class="progress progress-success progress-striped ">
                  <div style="width: 72%;" class="bar"></div>
                </div>
              </li>
              <li> <span class="icon24 icomoon-icon-arrow-down-2 red"></span> 53% Meta de Pagamentos <span class="pull-right strong">457</span>
                <div class="progress progress-warning progress-striped ">
                  <div style="width: 53%;" class="bar"></div>
                </div>
              </li>
              <li> <span class="icon24 icomoon-icon-arrow-up-2 green"></span> 3% Meta de Pedidos Delivery <span class="pull-right strong">8</span>
                <div class="progress progress-danger progress-striped ">
                  <div style="width: 3%;" class="bar"></div>
                </div>
              </li>
            </ul>
          </div>
        </div>
        
        
        
        </div>
        </div>


<div class="row-fluid">
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Soluções em Tecnologia</a> </div>
</div>
