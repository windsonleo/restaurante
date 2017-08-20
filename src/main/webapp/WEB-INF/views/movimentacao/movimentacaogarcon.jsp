<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Garcon</a> >> <a href="#" class="current">Movimenta��o de Garcon</a> </div>
    <h1>Listagem e Vis�o Geral</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
   <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Movimenta��o Garcon</h5>
          
                     <div class="widget-titlee"> <span class="icon"><a href="${pageContext.request.contextPath}/garcon/cadastro"><i class="icon-plus" color="blue"></i></a> </span>
         
            </div>
          </div>
          
          
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                                        <th>Id</th>
									    <th>Nome</th>
									    <th>Foto</th>
									    <th>Ativo?</th>
<!-- 									    <th>Data Nasciemnto</th> -->
<!-- 									     <th>Genero</th> -->
<!-- 									     <th>Preferencia</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>A��o</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="garcon" items="${garconList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${garcon.id != null}">
  
  <tr class="gradeX">

			      <td>${garcon.id}</td>
                  <td>${garcon.nome}</td>
                  <td ><input type="text" value="${garcon.foto}"></td>
                  <td>${garcon.isativo}</td>
                 <td class="options-widt">
								
								
								<a
									href="${pageContext.request.contextPath}/garcon/editar?id=${garcon.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/garcon/informacoes?id=${garcon.id}"
									title="Informa��es" ><i class="icon-info-sign"></i></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/garcon/delete?id=${garcon.id}"
									title="deletar" class="fa fa-remove fa-2x" ><i class="icon-minus-sign"></i> </a>
									
									
									
									
									
										
					</td>
                  
                  
                </tr>
                
                </c:when>
                </c:choose>
                
                
                </c:forEach>

              </tbody>
            </table>
          </div>
        </div>
        </div>
        </div>
        </div>
        
<!--         <div class="pagination alternate"> </div> -->
        
        
        </div>
        
        <div class="row-fluid">
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Solu��es em Tecnologia</a> </div>
</div>
        
