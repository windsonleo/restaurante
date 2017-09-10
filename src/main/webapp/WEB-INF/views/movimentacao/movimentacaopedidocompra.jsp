<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Pedidovenda</a> >> <a href="#" class="current">Movimenta��o de PedidoCompra</a> </div>
    <h1>Listagem e Vis�o Geral</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
   <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Movimenta��o PedidoCompra</h5>
          
                     <div class="widget-title"> <span class="icon"><a href="${pageContext.request.contextPath}/pedidocompra/cadastro"><i class="icon-plus" color="blue"></i></a> </span>
         
            </div>
          </div>
          
          
          <div class="widget-content nopadding">
            <table class="table table-hover table-bordered">
              <thead>
               <tr>
                                        <th>Id</th>
									    <th>Data</th>
<!-- 									    <th>Situa��o</th> -->
									    
									    <th>Status</th>
<!-- 									    <th>Origem</th> -->
									    <th>Total</th>
   									    <th>Fornecedor</th>
<!--    									    <th>Itens</th> -->
<!--    									    <th>Garcon</th> -->
									     <th>Itens</th>
									     <th>Ativo</th>
									    <th>A��o</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="pedidocompra" items="${pedidocompraList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${pedidocompra.id != null}">
  
  <tr class="gradeX">

			      <td>${pedidocompra.id}</td>
                  <td>${pedidocompra.data}</td>
<%-- 				<td>${pedidocompra.situacao}</td> --%>
                  <td><span class="label label-info">${pedidocompra.status}</span></td>
<%--                  <td>${pedidocompra.origempedido}</td> --%>
                 <td>${pedidocompra.total}</td>
                 <td>${pedidocompra.fornecedor}</td>
<%--                  <td>${pedidocompra.mesa}</td> --%>
<%--                  <td>${pedidocompra.garcon}</td> --%>
                  <td>${pedidocompra.items}</td>
                   <td> ${pedidocompra.isativo}</td>
                 <td class="options-widt">
								
								
								<a
									href="${pageContext.request.contextPath}/pedidocompra/additem?id=${pedidocompra.id}"
									title="Add Item"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/pedidocompra/addpagamento?id=${pedidocompra.id}"
									title="Pagamento" ><i class="icon-info-sign"></i></a>									
								
								
								<a
									href="${pageContext.request.contextPath}/pedidocompra/editar?id=${pedidocompra.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/pedidocompra/informacoes?id=${pedidocompra.id}"
									title="Informa��es" ><i class="icon-info-sign"></i></a>
									
									
									<a href="#myAlert${pedidocompra.id}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a>
									
			<div id="myAlert${pedidocompra.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">�</button>
                <h3>Alerta de Exclus�o</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/pedidocompra/delete?id=${pedidocompra.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>

									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/pedidocompra/delete?id=${pedidocompra.id}" --%>
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
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Solu��es em Tecnologia</a> </div>
</div>