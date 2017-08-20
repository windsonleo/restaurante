<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>







<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Cliente</a> >> <a href="#" class="current">Movimenta��o de Cliente</a> </div>
    <h1>Listagem e Vis�o Geral</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
   <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Movimenta��o Cliente</h5>
          
                     <div class="widget-titlee"> <span class="icon"><a href="${pageContext.request.contextPath}/cliente/cadastro"><i class="icon-plus" color="blue"></i></a> </span>
         
            </div>
          </div>
          
          
          
          
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
               <tr>
		             <th>Id</th>
				    <th>Nome</th>
				    <th>Telefone</th>
				    <th>Email</th>
				    <th>Data Nasciemnto</th>
				     <th>Genero</th>
		<!-- 									     <th>Preferencia</th> -->
				     <th>Ativo</th>
				     
				    <th>A��o</th>
                </tr>
              </thead>
              <tbody>
              
           		 <c:forEach var="cliente" items="${clienteList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${cliente.id != null}">
  
   <tr class="gradeX">

			      <td>${cliente.id}</td>
                  <td>${cliente.nome}</td>
                  <td ><input type="tel" value="${cliente.telefone}"></td>
                  <td><input type="email" value="${cliente.email}"></td>
                   <td>${cliente.datanascimento}</td>
                   <td>${cliente.genero}</td>
<%--                    <td>${cliente.preferencia}</td> --%>
                   <td> ${cliente.isativo}</td>
              
              

                 <td class="options-widt">
								
								
								<a
									href="${pageContext.request.contextPath}/cliente/editar?id=${cliente.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/cliente/informacoes?id=${cliente.id}"
									title="Informa��es" ><i class="icon-info-sign"></i></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/cliente/delete?id=${cliente.id}"
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
        