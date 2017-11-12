<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>






<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Forma de Pagamento" class="tip-bottom"><i ><img src="${pageContext.request.contextPath}/resources/images/icons/16/financeiro.png" ></i> Forma de Pagamento</a> <a href="#" class="current">Movimentação de Forma de Pagamento</a> </div>
    <h1>Listagem e Visão Geral</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
   <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/16/financeiro.png" ></i></span>
            <h5>Movimentação Forma de Pagamento</h5>
          
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
									    <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="formapagamento" items="${formapagamentoList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${formapagamento.id != null}">
  
  <tr class="gradeX">

			      <td>${formapagamento.id}</td>
                  <td>${formapagamento.nome}</td>
                  <td >${formapagamento.tipo}</td>
                  <td>${formapagamento.parcelas}</td>
                   <td>${formapagamento.percdesconto}</td>
                   <td><span class="label label bg_lb">${formapagamento.ativo}</span></td>
                 <td class="options-width">
								
								
								<a
									href="${pageContext.request.contextPath}/formapagamento/editar?id=${formapagamento.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/formapagamento/informacoes?id=${formapagamento.id}"
									title="Informações" ><i class="icon-info-sign"></i></a>
									


	<a href="#myAlert${formapagamento.id}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a>
									
			<div id="myAlert${formapagamento.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>Alerta de Exclusão</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/formapagamento/delete?id=${formapagamento.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>	




									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/formapagamento/delete?id=${formapagamento.id}" --%>
<!-- 									title="deletar" class="fa fa-remove fa-2x" ><i class="icon-minus-sign"></i> </a> -->
									
									
									
									
									
										
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
        