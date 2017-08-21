<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<div id="content">

  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Mesa</a> >> <a href="#" class="current">Movimentação de Mesa</a> </div>
    <h1>Salão Listagem e Visão Geral</h1>
  </div>
  
  
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
   <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Movimentação Salão</h5>
          
<%--                      <div class="widget-title"> <span class="icon"><a href="${pageContext.request.contextPath}/mesa/cadastro"><i class="icon-plus" color="blue"></i></a> </span> --%>
         
            </div>
          </div>
          
		  <ul class="quick-actions">

              
           		<c:forEach var="mesa" items="${mesasList}" varStatus="id">
              
                <li class="bg_lb span1"> <a href="${pageContext.request.contextPath}/mesa/detalhes?id=${mesa.id}">
         		<i class="icon-dashboard"></i>
         	
         		 <div class="huge">${mesa.id}</div>
                 <div>${mesa.numero}</div>
                  <div> ${mesa.status}</div> 
                                     	<span class="label label-success">${mesa.pedidos.size()}</span> 
                                      </a> 
                                      
                                      </li>
       
                
                </c:forEach>

			</ul>
          </div>
        </div>
        </div>
        </div>
        </div>
        
        
        <div class="row-fluid">
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Soluções em Tecnologia</a> </div>
</div>