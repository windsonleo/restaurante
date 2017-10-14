<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i ><img src="${pageContext.request.contextPath}/resources/images/icons/16/entregas.png" /></i> Pedidovenda</a> <a href="#" class="current">Movimentação de Pedidovenda</a> </div>
    <h1>Listagem e Visão Geral</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
   <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i ><img src="${pageContext.request.contextPath}/resources/images/icons/16/entregas.png" ></i></span>
            <h5>Movimentação Pedido Venda</h5>
          
                     <div class="widget-title"> <span class="icon"><a href="${pageContext.request.contextPath}/pedidovenda/cadastro"><i class="icon-plus" color="blue"></i></a> </span>
         
            </div>
          </div>
          
          
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">

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
                                
                                
                                <c:forEach var="pedidovenda" items="${pedidovendaList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${pedidovenda.id != null}">
  
  <tr class="gradeX">

			      <td>${pedidovenda.id}</td>
                  <td>${pedidovenda.data}</td>
				<td>${pedidovenda.situacao}</td>
                  <td><span class="label label-info">${pedidovenda.status}</span></td>
                 <td>${pedidovenda.origempedido}</td>
                 <td>${pedidovenda.total}</td>
                 <td>${pedidovenda.cliente}</td>
                 <td>${pedidovenda.mesa}</td>
                 <td>${pedidovenda.garcon}</td>
                  <td>${pedidovenda.items}</td>
                   <td><span class="label label bg_lb"> ${pedidovenda.isativo}</span></td>
                 
                 <td class="options-widt">
								
								
								<a
									href="${pageContext.request.contextPath}/pedidovenda/additem?id=${pedidovenda.id}"
									title="Add Item"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/pedidovenda/addpagamento?id=${pedidovenda.id}"
									title="Pagamento" ><i class="icon-info-sign"></i></a>									
								
								
								<a
									href="${pageContext.request.contextPath}/pedidovenda/editar?id=${pedidovenda.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/pedidovenda/informacoes?id=${pedidovenda.id}"
									title="Informações" ><i class="icon-info-sign"></i></a>
									
												<a
									href="${pageContext.request.contextPath}/pedidovenda/finalizacaovenda?id=${pedidovenda.id}"
									title="Finalizar" ><i class="icon-bolt"></i></a>
									
									
									<a href="#myAlert${pedidovenda.id}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a>
									
			<div id="myAlert${pedidovenda.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>Alerta de Exclusão</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/pedidovenda/delete?id=${pedidovenda.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>

									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/pedidovenda/delete?id=${pedidovenda.id}" --%>
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