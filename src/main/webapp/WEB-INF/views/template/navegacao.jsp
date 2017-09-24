  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  
<%@ page session="false" %>
   
<div id="header">
  <h3><a href="dashboard.html"><img src="${pageContext.request.contextPath}/resources/images/logologinn.png"></img></a></h3>
</div>

<!--top-Header-menu-->

	<div id="user-nav" class="navbar navbar-inverse">
	
	  <ul class="nav">
		    <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user" color="blue"></i>  <span class="text">Bem - Vindo  ${usuarioAtt}</span><b class="caret"></b></a>
			      <ul class="dropdown-menu">
			        <li><a href="${pageContext.request.contextPath}/usuario/profile?id=${usuarioAtt.id }"><i class="icon-user"></i>Meu Perfil</a></li>
			        <li class="divider"></li>
			        <li><a href="${pageContext.request.contextPath}/usuario/tarefas"><i class="icon-tasks"></i> Minhas Tarefas</a></li>
			        <li class="divider"></li>
			        <li><a href="${pageContext.request.contextPath}/"><i class="icon-key"></i> Sair</a></li>
			    

			      </ul>
		    </li>
		    
		      <sec:authorize access="hasRole('ROLE_ADM')">
		      <tt>GrantedAuthority</tt>s.
 					<li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messagess" class="dropdown-toggle"><i class="icon-group"></i>  <span class="text">Empresa</span><b class="caret"></b></a>
			     
			      <ul class="dropdown-menu">
		        	<li><a href="${pageContext.request.contextPath}/empresa/movimentacao"><i class="icon-book"></i> Sobre</a></li>
		        	 <li class="divider"></li>
		        	
			        <li ><a href="${pageContext.request.contextPath}/empresa/metas"><i class="icon-list-ul"></i> Metas</a></li>
		    
		    </ul>
		    </li>
		        
		    
		    </sec:authorize>
		    
<!-- 		    <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">Messages</span> <span class="label label-important">5</span> <b class="caret"></b></a> -->
<!-- 			      <ul class="dropdown-menu"> -->
<!-- 			        <li><a class="sAdd" title="" href="#"><i class="icon-plus"></i> new message</a></li> -->
<!-- 			        <li class="divider"></li> -->
<!-- 			        <li><a class="sInbox" title="" href="#"><i class="icon-envelope"></i> inbox</a></li> -->
<!-- 			        <li class="divider"></li> -->
<!-- 			        <li><a class="sOutbox" title="" href="#"><i class="icon-arrow-up"></i> outbox</a></li> -->
<!-- 			        <li class="divider"></li> -->
<!-- 			        <li><a class="sTrash" title="" href="#"><i class="icon-trash"></i> trash</a></li> -->
<!-- 			      </ul> -->
<!-- 		    </li> -->
<!-- 		    <li class=""><a title="" href="#"><i class="icon icon-cog"></i> <span class="text">Settings</span></a></li> -->
		    <li class=""><a title="" href="${pageContext.request.contextPath}/"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
	  </ul>
	</div>
<!--close-top-Header-menu-->


<!--start-top-serch-->
<!-- 	<div id="search"> -->
<!-- 	  <input id="searchnow" type="text" placeholder="Pesquise Aqui..." value="" name="sugestion"/> -->
<!-- 	  <button type="submit" class="tip-bottom" title="Search" ><i class="icon-search icon-white"></i></button> -->
<!-- 	</div> -->

<div id="search">
  <input type="text" placeholder="Search here..." name="sugestion" id="sugestion"/>
  <button id="seila"  nome="seila"type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
</div>

<!--     <div class="col-sm-2 col-md-2"> -->
<!--              <form class="navbar-form navbar-right" role="search"> -->
<!--               <div class="input-group"><a href="#" class="btn btn-warning">Post Your Ads</a></div> -->
<!--              </form> -->
<!--             </div> -->
<!--close-top-serch-->

    <div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Home</a>
  <ul>
        <li class="active"><a href="${pageContext.request.contextPath}/home"><i class="icon icon-home"></i> <span>Home</span></a> </li>
  
  
  	<sec:authorize access="hasRole('ROLE_COMPRA')">
  
  		
      <li class=""><a href="${pageContext.request.contextPath}/categoria/movimentacao"><i ><img src="${pageContext.request.contextPath}/resources/images/icons/16/categoria.png" /></i> <span>Categoria</span></a> </li>
  
      <li class=""><a href="${pageContext.request.contextPath}/cliente/movimentacao"><i ><img src="${pageContext.request.contextPath}/resources/images/icons/16/cliente.png" /></i> <span>Cliente</span></a> </li>
      
          <li class="submenu"> <a href="#"><i ><img src="${pageContext.request.contextPath}/resources/images/icons/16/compras.png" /></i> <span>Compras</span> <span class="label label-primary">3</span></a>
      <ul>
        <li><a href="${pageContext.request.contextPath}/pedidocompra/movimentacao">Pedido Compra</a></li>
        <li><a href="${pageContext.request.contextPath}/recebimento/movimentacao">Recebimento</a></li>
        <li><a href="form-wizard.html">Devolução</a></li>
      </ul>
    </li>
      
      
  
    <li> <a href="${pageContext.request.contextPath}/pedidovenda/movimentacao"><i ><img src="${pageContext.request.contextPath}/resources/images/icons/16/entregas.png" /></i> <span>Entregas</span></a> </li>
  </sec:authorize>
        
         <sec:authorize access="hasRole('ROLE_FINANCEIRO')">
        
        
        <li class="submenu"> <a href="#"><i ><img src="${pageContext.request.contextPath}/resources/images/icons/16/financeiro.png" /></i> <span>Financeiro</span> <span class="label label-primary">5</span></a>
      <ul>
        <li><a href="${pageContext.request.contextPath}/banco/movimentacao">Banco</a></li>
        <li><a href="${pageContext.request.contextPath}/caixa/movimentacao"">Caixa</a></li>
        <li><a href="${pageContext.request.contextPath}/conta/movimentacao"">Conta</a></li>
        <li><a href="${pageContext.request.contextPath}/formapagamento/movimentacao"">Forma de Pagamento</a></li>
        <li><a href="chat.html">Á Pagar</a></li>
        <li><a href="chat.html">Á Receber</a></li>
        <li><a href="${pageContext.request.contextPath}/despesa/movimentacao"">Despesa</a></li>
        <li><a href="${pageContext.request.contextPath}/pagamento/movimentacao"">Pagamento</a></li>
        
      </ul>
    </li>
     <tt>GrantedAuthority</tt>s.
    
    </sec:authorize>
    
      	<sec:authorize access="hasRole('ROLE_COMPRA')">
    
    <li><a href="${pageContext.request.contextPath}/fornecedor/movimentacao"><i ><img src="${pageContext.request.contextPath}/resources/images/icons/16/fornecedor.png" /></i> <span>Fornecedor</span></a></li>
    <li><a href="${pageContext.request.contextPath}/garcon/movimentacao"><i ><img src="${pageContext.request.contextPath}/resources/images/icons/16/garçon.png" /></i> <span>Garçon</span></a></li>

    <li><a href="${pageContext.request.contextPath}/mesa/movimentacao"><i ><img src="${pageContext.request.contextPath}/resources/images/icons/16/mesa.png" /></i> <span>Mesa</span></a></li>
    
        <li class="submenu"> <a href="#"><i ><img src="${pageContext.request.contextPath}/resources/images/icons/16/produto.png" /></i> <span>Produto</span> <span class="label label-important">3</span></a>
      <ul>
        <li><a href="${pageContext.request.contextPath}/produto/movimentacao">Produto</a></li>
        <li><a href="${pageContext.request.contextPath}/produtocomposto/movimentacao">Produto Composto</a></li>
        <li><a href="form-wizard.html">Conf. Produto</a></li>
      </ul>
    </li>
    
    </sec:authorize>
    
          	<sec:authorize access="hasRole('ROLE_VENDA')">
    
    
            <li class="submenu"> <a href="#"><i ><img src="${pageContext.request.contextPath}/resources/images/icons/16/venda.png" /></i> <span>Venda</span> <span class="label label-important">3</span></a>
      <ul>
        <li><a href="${pageContext.request.contextPath}/pedidovenda/movimentacao">Pedido Venda</a></li>
        <li><a href="form-validation.html">Devolução Venda</a></li>
        <li><a href="#">Conf. Venda</a></li>
      </ul>
    </li>
        </sec:authorize>
    
      <sec:authorize access="hasRole('ROLE_ADM')">
    
    
    <li><a href="${pageContext.request.contextPath}/usuario/movimentacao"><i ><img src="${pageContext.request.contextPath}/resources/images/icons/16/usuário.png" /></i> <span>Usuario</span></a></li>
 <tt>GrantedAuthority</tt>s.

</sec:authorize>
  </ul>
</div>      
        