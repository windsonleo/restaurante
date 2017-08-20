<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<div id="content">

  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Mesa</a> >> <a href="#" class="current">Movimentação de Mesa</a> </div>
    <h1>Listagem e Visão Geral</h1>
  </div>
  
  
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
   <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Movimentação Mesa</h5>
          
                     <div class="widget-title"> <span class="icon"><a href="${pageContext.request.contextPath}/mesa/cadastro"><i class="icon-plus" color="blue"></i></a> </span>
         
            </div>
          </div>
          
          
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                  <th>Id</th>
                  <th>Numero</th>
                  <th>Status</th>
                  
                  <th>Ação(s)</th>
                  
                  
                  
                </tr>
              </thead>
              <tbody>
              
           		<c:forEach var="mesa" items="${mesasList}" varStatus="id">
              
                <tr class="gradeX">
                  <td>${mesa.id }</td>
                  <td>${mesa.numero }</td>
                  <td>${mesa.status}</td>
                 <td class="options-widt">
								
								
								<a
									href="${pageContext.request.contextPath}/mesa/editar?id=${mesa.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/mesa/informacoes?id=${mesa.id}"
									title="Informações" ><i class="icon-info-sign"></i></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/mesa/delete?id=${mesa.id}"
									title="deletar" class="fa fa-remove fa-2x" ><i class="icon-minus-sign"></i> </a>
									
									
									
									
									
										
					</td>
                  
                  
                </tr>
                
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