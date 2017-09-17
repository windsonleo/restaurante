<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>




<div id="content" >
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Sushi Senpai</a> >> <a href="#" class="current">Card�pio </a></div>
    
<%--     <c:if test="${mensagem}"> --%>
<!--     	<div class="alert alert-success" > -->
<%--     	${mensagem} --%>
<!--     	</div> -->
    	
<%--     	</c:if> --%>

<%--     <c:if test="${erros != null}"> --%>
<!-- 		<div class="alert alert-danger" > -->
<%-- 		<span>${erros}</span> --%>
<!-- 		</div> -->
		
<%-- 		</c:if> --%>

  
    
    
<!--     <h1>Card�pio</h1> -->

    
  </div>
  <div class="container-fluid"><hr>
  
  <c:if test="${erros != null }">
            <div class="alert alert-error alert-block"> <a class="close" data-dismiss="alert" href="#">�</a>
              <h4 class="alert-heading">Erros!</h4>
              
              ${erros}
            </div>
            
    </c:if>
    
      <c:if test="${mensagem != null }">
            <div class="alert alert-success alert-block"> <a class="close" data-dismiss="alert" href="#">�</a>
              <h4 class="alert-heading">Sucesso!</h4>
              
              ${mensagem}
            </div>
            
    </c:if>
               
               
<!--     <div class="row-fluid"> -->
   
<%--           <img src="${pageContext.request.contextPath}/resources/images/cardapio.png" alt="" > </a> --%>
<%--                 <div class="actions"> <a title="" class="" href="#"><i class="icon-pencil"></i></a> <a class="lightbox_trigger" href="${pageContext.request.contextPath}/resources/images/cardapio.png"><i class="icon-search"></i></a> </div> --%>
            
<!--              </div> -->


		<div id="cardapio" class="cardapio">
				<c:forEach var="categoria" items="${categoriaList}" varStatus="id">
				                    <tr class="">
				                  <td class="lb_nome_cardapio">${categoria.nome}</td> </br>
				
				<c:forEach var="produto" items="${categoria.produtos}" varStatus="id">

<%-- 		<c:choose> --%>
		
<%-- 		  <c:when test="${categoria.id != null}"> --%>
              
             
                  
<%-- 			      <td>${categoria.id}</td> --%>
<%--                   <td class="lb_nome_cardapio" >${categoria.nome}</td> </br> --%>
                  
                  <td class="lb_nome_produto" >${produto.nome} .................................................R$ : ${produto.precovenda}</td> </br>
                  <td class="lb_produto_descricao">(${produto.descricao})</td></br>
                 
                 </c:forEach> 
                  </tr>
                  
                  <tr>
                  
                  
                  </tr>
								
								

									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/categoria/delete?id=${categoria.id}" --%>
<!-- 									title="deletar" class="fa fa-remove fa-2x" ><i class="icon-minus-sign"></i> </a> -->
									
									
									
									
				
                
<%--                 </c:when> --%>
                
<%--                 </c:choose> --%>
                </c:forEach>

</div>

     
      </div>
    </div>

<!--             </div> -->
<!--             </div> -->
         
      
<div class="row-fluid">
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Solu��es em Tecnologia</a> </div>
</div>
