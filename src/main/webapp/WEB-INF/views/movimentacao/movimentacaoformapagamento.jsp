<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>






<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Forma de Pagamento</a> >> <a href="#" class="current">Movimenta��o de Forma de Pagamento</a> </div>
    <h1>Listagem e Vis�o Geral</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
   <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Movimenta��o Forma de Pagamento</h5>
          
                     <div class="widget-title"> <span class="icon"><a href="${pageContext.request.contextPath}/formapagamento/cadastro"><i class="icon-plus" color="blue"></i></a> </span>
         
            </div>
          </div>
          
          
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                                        <th>Id</th>
									    <th>Nome</th>
									    <th>Tipo</th>
									    <th>Parcela</th>
									    <th>% Desconto</th>
									     <th>Ativo?</th>
<!-- 									     <th>Pagamentos</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>A��o</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="formapagamento" items="${formapagamentoList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${formapagamento.id != null}">
  
  <tr class="gradeX">

			      <td>${formapagamento.id}</td>
                  <td>${formapagamento.nome}</td>
                  <td >${formapagamento.tipo}></td>
                  <td>${formapagamento.parcelas}</td>
                   <td>${formapagamento.percdesconto}</td>
                   <td>${formapagamento.isativo}</td>
                 <td class="options-widt">
								
								
								<a
									href="${pageContext.request.contextPath}/formapagamento/editar?id=${formapagamento.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/formapagamento/informacoes?id=${formapagamento.id}"
									title="Informa��es" ><i class="icon-info-sign"></i></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/formapagamento/delete?id=${formapagamento.id}"
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
        