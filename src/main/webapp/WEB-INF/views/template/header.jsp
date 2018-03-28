<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page session="true" %>


<div class="navigation-example">
<nav class="navbar navbar-transparent">
   <div class="container-fluid">
      <div class="navbar-header">
         <button type="button" class="navbar-toggle" data-toggle="collapse">
         <span class="sr-only">Toggle navigation</span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         </button>
         
       <h4 class="simple-text"> <i class="fa fa-paw"> </i> Tecsoluction </h4>
<!--          <img class="image-responsive" -->
<%--             src="${pageContext.request.contextPath}/resources/images/logosenpai.png"/> --%>
      </div>
      
      
      <div class="collapse navbar-collapse">
         <ul class="nav navbar-nav navbar-right">
           
             <sec:authorize access="hasRole('ROLE_ADM')">
            <li>
               <a href="${pageContext.request.contextPath}/empresa/movimentacao" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="material-icons">store</i>
                  <p class="hidden-lg hidden-md">Empresa</p>
               </a>
               <ul class="dropdown-menu">
                  <li>
                     <a href="${pageContext.request.contextPath}/empresa/movimentacao">Movimentacao</a>
                  </li>
                  <li>
                     <a href="${pageContext.request.contextPath}/empresa/cadastro">Cadastro</a>
                  </li>
<!--                   <li> -->
<!--                      <a href="#">Fiscal</a> -->
<!--                   </li> -->
                  <!--                             <li> -->
                  <!--                                 <a href="#">Another Notification</a> -->
                  <!--                             </li> -->
                  <!--                             <li> -->
                  <!--                                 <a href="#">Another One</a> -->
                  <!--                             </li> -->
               </ul>
            </li>
            
            </sec:authorize>
            
            
            <li class="dropdown">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="material-icons">notifications</i>
                  <span class="notification" >${itemsprontos.size()}</span>
                  <p class="hidden-lg hidden-md">Notifications</p>
               </a>
               
               <ul class="dropdown-menu">
                  
               <c:forEach var="pedv" items="${itemsprontospv}">
                  <li>
                     <a href="${pageContext.request.contextPath}/pedidovenda/item/detalhes?id=${pedv.id}">${pedv.mesa}</a>
                  </li>
                 </c:forEach>

              
               </ul>
            </li>
            
            <li>
               <%--                                 <a href="${pageContext.request.contextPath}/usuario/profile" class="dropdown-toggle" data-toggle="dropdown"> --%>
               <a href="${pageContext.request.contextPath}/usuario/profile?id=${usuarioAtt.id}">
                  <i class="material-icons">face</i>
                  <p class="hidden-lg hidden-md">Profile</p>
               </a>
            </li>
            <li>
               <%--                                 <a href="${pageContext.request.contextPath}/usuario/profile" class="dropdown-toggle" data-toggle="dropdown"> --%>
               <a href="${pageContext.request.contextPath}/logout">
                  <i class="material-icons">power_off</i>
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
