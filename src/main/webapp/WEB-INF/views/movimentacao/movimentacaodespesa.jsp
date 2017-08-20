<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>



<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Despesa</a> >> <a href="#" class="current">Movimentação de Despesa</a> </div>
    <h1>Listagem e Visão Geral</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
   <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Movimentação Despesa</h5>
          
                     <div class="widget-titlee"> <span class="icon"><a href="${pageContext.request.contextPath}/despesa/cadastro"><i class="icon-plus" color="blue"></i></a> </span>
         
            </div>
          </div>
          
          
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                 <tr>
                                        <th>Id</th>
									    <th>Nome</th>
<!-- 									    <th>Telefone</th> -->
<!-- 									    <th>Email</th> -->
<!-- 									    <th>Data Nasciemnto</th> -->
<!-- 									     <th>Genero</th> -->
<!-- 									     <th>Preferencia</th> -->
									     <th>Ativo</th>
<!-- 									     <th>Obs</th> -->
									    <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="despesa" items="${despesaList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${despesa.id != null}">
  
                <tr class="gradeX">

			      <td>${despesa.id}</td>
                  <td>${despesa.nome}</td>
<%--                   <td ><input type="tel" value="${despesa.telefone}"></td> --%>
<%--                   <td><input type="email" value="${despesa.email}"></td> --%>
<%--                    <td>${despesa.datanascimento}</td> --%>
<%--                    <td>${despesa.genero}</td> --%>
<%--                    <td>${despesa.preferencia}</td> --%>
                   <td> ${despesa.isativo}</td>
                 <td class="options-widt">
								
								
								<a
									href="${pageContext.request.contextPath}/despesa/editar?id=${despesa.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/despesa/informacoes?id=${despesa.id}"
									title="Informações" ><i class="icon-info-sign"></i></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/despesa/delete?id=${despesa.id}"
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
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Soluções em Tecnologia</a> </div>
</div>
        