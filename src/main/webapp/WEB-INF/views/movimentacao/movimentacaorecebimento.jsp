<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Recebimento</a> >> <a href="#" class="current">Movimentação de Recebimento</a> </div>
    <h1>Listagem e Visão Geral</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
   <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Movimentação Recebimento</h5>
          
                     <div class="widget-title"> <span class="icon"><a href="${pageContext.request.contextPath}/recebimento/cadastro"><i class="icon-plus" color="blue"></i></a> </span>
         
            </div>
          </div>
          
          
          <div class="widget-content nopadding">
            <table class="table table-hover table-bordered">
              <thead>
               <tr>
                                        <th>Id</th>
									    <th>Data</th>
									    <th>Situação</th>
									    
									    <th>Status</th>
									    <th>Origem</th>
									    <th>Total</th>
   									    <th>Cliente</th>
   									    <th>Mesa</th>
   									    <th>Garcon</th>
									     <th>Itens</th>
									     <th>Ativo</th>
									    <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="recebimento" items="${recebimentoList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${recebimento.id != null}">
  
  <tr class="gradeX">

			      <td>${recebimento.id}</td>
                  <td>${recebimento.data}</td>
				<td>${recebimento.situacao}</td>
                  <td><span class="label label-info">${recebimento.status}</span></td>
                 <td>${recebimento.origempedido}</td>
                 <td>${recebimento.total}</td>
                 <td>${recebimento.cliente}</td>
                 <td>${recebimento.mesa}</td>
                 <td>${recebimento.garcon}</td>
                  <td>${recebimento.items}</td>
                   <td> ${recebimento.isativo}</td>
                 <td class="options-widt">
								
								
								<a
									href="${pageContext.request.contextPath}/recebimento/additem?id=${recebimento.id}"
									title="Add Item"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/recebimento/addpagamento?id=${recebimento.id}"
									title="Pagamento" ><i class="icon-info-sign"></i></a>									
								
								
								<a
									href="${pageContext.request.contextPath}/recebimento/editar?id=${recebimento.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/recebimento/informacoes?id=${recebimento.id}"
									title="Informações" ><i class="icon-info-sign"></i></a>
									
									
									<a href="#myAlert${recebimento.id}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a>
									
			<div id="myAlert${recebimento.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>Alerta de Exclusão</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/recebimento/delete?id=${recebimento.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>

									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/recebimento/delete?id=${recebimento.id}" --%>
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