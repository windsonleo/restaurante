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
				 <li><a href="${pageContext.request.contextPath}/"><i class="icon-key"></i> Cadastro</a></li>
		
<%-- 			        <li><a href="${pageContext.request.contextPath}/"><i class="icon-key"></i> Sair</a></li> --%>
			    

			      </ul>
		    </li>
		    
<%-- 		      <sec:authorize access="hasRole('ROLE_ADM')"> --%>
<!-- 		      <tt>GrantedAuthority</tt>s. -->
<!--  					<li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messagess" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">Empresa</span><b class="caret"></b></a> -->
			     
<!-- 			      <ul class="dropdown-menu"> -->
<%-- 		        	<li><a href="${pageContext.request.contextPath}/empresa/movimentacao"><i class="icon-check"></i> Sobre</a></li> --%>
<!-- 		        	 <li class="divider"></li> -->
		        	
<%-- 			        <li ><a href="${pageContext.request.contextPath}/empresa/metas"><i class="icon-check">Metas</i></a></li> --%>
		    
<!-- 		    </ul> -->
<!-- 		    </li> -->
		        
		    
<%-- 		    </sec:authorize> --%>
		    
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
  <input type="text" placeholder="Search here..."/>
  <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
</div>

<!--     <div class="col-sm-2 col-md-2"> -->
<!--              <form class="navbar-form navbar-right" role="search"> -->
<!--               <div class="input-group"><a href="#" class="btn btn-warning">Post Your Ads</a></div> -->
<!--              </form> -->
<!--             </div> -->
<!--close-top-serch-->

    <div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i>Sushi Senpai</a>
  <ul>
        <li class="active"><a href="${pageContext.request.contextPath}/sushisenpai/cardapio"><i class="icon icon-home"></i> <span>Cardápio</span></a> </li>
  
  
      
    
    
          <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>Categoria</span> <span class="label label-primary">${categoriaList.size()}</span></a>

      <ul>

		<c:forEach var="categoria" items="${categoriaList}" varStatus="id">

    <li><a href="${pageContext.request.contextPath}/sushisenpai/cardapio/produtoporcategoria?id=${categoria.id}"><i class="icon icon-pencil"></i> <span>${categoria.nome}</span></a></li>
	
	</c:forEach>
  </ul>
</div>      
        