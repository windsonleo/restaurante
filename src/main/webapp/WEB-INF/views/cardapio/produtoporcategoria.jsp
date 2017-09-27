<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>




<div id="contenttt" class="contentcardapio" >
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/sushisenpai/cardapio" title="Go to Cardápio" class="tip-bottom"><i class="icon-home"></i> Sushi Senpai</a> >> <a href="#">Cardápio </a> >> <a href="#" class="current">Produto por Categoria >> ${categoria.nome}</a> </div>
    
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

  
    
    
<!--     <h1>Cardápio</h1> -->

    
  </div>
  <div class="container-fluid"><hr>
  
<%--   <c:if test="${erros != null }"> --%>
<!--             <div class="alert alert-error alert-block"> <a class="close" data-dismiss="alert" href="#">×</a> -->
<!--               <h4 class="alert-heading">Erros!</h4> -->
              
<%--               ${erros} --%>
<!--             </div> -->
            
<%--     </c:if> --%>
    
<%--       <c:if test="${mensagem != null }"> --%>
<!--             <div class="alert alert-success alert-block"> <a class="close" data-dismiss="alert" href="#">×</a> -->
<!--               <h4 class="alert-heading">Sucesso!</h4> -->
              
<%--               ${mensagem} --%>
<!--             </div> -->
            
<%--     </c:if> --%>
               
               
<!--     <div class="row-fluid"> -->
   
<%--           <img src="${pageContext.request.contextPath}/resources/images/cardapio.png" alt="" > </a> --%>
<%--                 <div class="actions"> <a title="" class="" href="#"><i class="icon-pencil"></i></a> <a class="lightbox_trigger" href="${pageContext.request.contextPath}/resources/images/cardapio.png"><i class="icon-search"></i></a> </div> --%>
            
<!--              </div> -->


		<div id="cardapio" class="cardapio">

				                    <ul class="">
				                  <li class="lb_nome_cardapio">${categoria.nome}</li>
				
				<c:forEach var="produto" items="${produtos}" varStatus="id">

<%-- 		<c:choose> --%>
		
<%-- 		  <c:when test="${categoria.id != null}"> --%>
              
             
                  
<%-- 			      <td>${categoria.id}</td> --%>
<%--                   <td class="lb_nome_cardapio" >${categoria.nome}</td> </br> --%>
                  
                  <li class="lb_nome_produto" >${produto.nome} ..........................................................................................................................................................................................<label class="preco"> R$ :${produto.precovenda}</label></li>
                  <p class="lb_produto_descricao">(${produto.descricao}) <a href="#myModal${produto.id}" data-toggle="modal" class="lb_produto_descricao"> <i class="icon icon-picture"> </i> </a></p>
                  
                  
                  
                  
            <div id="myModal${produto.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>${produto.nome}</h3>
              </div>
              <div class="modal-body">
                <p>${produto.descricao}</p>
                <p><img src="${pageContext.request.contextPath}/resources/images/produto/${produto.foto}.jpg"></p>
              </div>
            </div>
                 </c:forEach> 
                  </ul>
            
                  
                  
               		
								

									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/categoria/delete?id=${categoria.id}" --%>
<!-- 									title="deletar" class="fa fa-remove fa-2x" ><i class="icon-minus-sign"></i> </a> -->
									
									
									
									
				
                
<%--                 </c:when> --%>
                
<%--                 </c:choose> --%>
          

</div>

     
      </div>
    </div>

<!--             </div> -->
<!--             </div> -->
         
      
<div class="row-fluid">
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Soluções em Tecnologia</a> </div>
</div>

