<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Pagamento</a> >> <a href="#" class="current">Movimentação de Pagamento</a> </div>
    <h1>Listagem e Visão Geral</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
   <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Movimentação Pagamento</h5>
          
                     <div class="widget-titlee"> <span class="icon"><a href="${pageContext.request.contextPath}/pagamento/cadastro"><i class="icon-plus" color="blue"></i></a> </span>
         
            </div>
          </div>
          
          
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
               <tr>
                                        <th>Id</th>
<!--    									    <th>Data</th> -->
<!--    									    <th>Pedidos</th> -->
<!-- 									    <th>Forma Pagamento</th> -->
									    <th>Valor total</th>
									    <th>Status</th>
									     <th>Valor Pagor</th>
									     <th>Caixa</th>
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="pagamento" items="${pagamentoList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${pagamento.id != null}">
  
  <tr class="gradeX">

			      <td>${pagamento.id}</td>
<%--                   <td>${pagamento.datapagamento}</td> --%>
<%--                   <td >${pagamento.pedidos}</td> --%>
<%--                   <td>${pagamento.formaPagamentos}</td> --%>
                   <td>${pagamento.valorTotalPagamento}</td>
                   <td>${pagamento.status}</td>
                   <td>${pagamento.valorPago}</td>
                   <td> ${pagamento.caixa}</td>
                 <td class="options-widt">
								
								
								<a
									href="${pageContext.request.contextPath}/pagamento/editar?id=${pagamento.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/pagamento/informacoes?id=${pagamento.id}"
									title="Informações" ><i class="icon-info-sign"></i></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/pagamento/delete?id=${pagamento.id}"
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
      