<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Recebimento" class="tip-bottom"><i ><img src="${pageContext.request.contextPath}/resources/images/icons/16/compras.png" /></i> Recebimento</a> <a href="#" class="current">Movimenta��o de Recebimento</a> </div>
    <h1>Listagem e Vis�o Geral</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
   <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-icon" ><img src="${pageContext.request.contextPath}/resources/images/icons/16/compras.png" /></i></span>
            <h5>Movimenta��o Recebimento</h5>
          
                     <div class="widget-title"> <span class="icon"><a href="${pageContext.request.contextPath}/recebimento/cadastro"><i class="icon-plus" color="blue"></i></a> </span>
         
            </div>
          </div>
          
          
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
                 
              <thead>
               <tr>
                                        <th>Id</th>
									    <th>Data</th>
<!-- 									    <th>Situa��o</th> -->
									    
									    <th>Status</th>
<!-- 									    <th>Origem</th> -->
<!-- 									    <th>Total</th> -->
   									    <th>Fornecedor</th>
<!--    									    <th>Mesa</th> -->
<!--    									    <th>Garcon</th> -->
									     <th>Itens</th>
									     <th>Pago</th>
									    <th>A��o</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="recebimento" items="${recebimentoList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${recebimento.id != null}">
  
  <tr class="gradeX">

			      <td>${recebimento.id}</td>
                  <td>${recebimento.data}</td>
<%-- 				<td>${recebimento.situacao}</td> --%>
			<c:choose>
				    <c:when test="${recebimento.status=='ABERTO'}">

                  <td><span class="label label-info">${recebimento.status}</span></td>

				
				    </c:when> 
				    
				   <c:when test="${recebimento.status=='PENDENTE'}">

                  <td><span class="label label-warning">${recebimento.status}</span></td>

				
				    </c:when>
				    
				    <c:when test="${recebimento.status=='PRONTO'}">

                  <td><span class="label label-success">${recebimento.status}</span></td>

				
				    </c:when> 
				    
				    <c:when test="${recebimento.status=='CANCELADO'}">

                  <td><span class="label label-important">${recebimento.status}</span></td>

				
				    </c:when>  
				    
				    <c:when test="${recebimento.status=='FECHADO'}">

                  <td><span class="label label-ly">${recebimento.status}</span></td>

				
				    </c:when> 
				    
				    <c:otherwise>


				    </c:otherwise>
				
				</c:choose>

<%--                   <td><span class="label label-info">${recebimento.status}</span></td> --%>
<%--                  <td>${recebimento.origempedido}</td> --%>
<%--                  <td>${recebimento.total}</td> --%>
                 <td>${recebimento.fornecedor}</td>
<%--                  <td>${recebimento.mesa}</td> --%>
<%--                  <td>${recebimento.garcon}</td> --%>
                  <td>${recebimento.items}</td>
                  
                  	<c:choose>
				    <c:when test="${recebimento.ispago}">

                  <td><span class="label label-success">${recebimento.ispago}</span></td>

				    </c:when> 
				    
				    <c:otherwise>

                  <td><span class="label label-important">${recebimento.ispago}</span></td>

				    </c:otherwise>
				</c:choose>
<!--                   class="date badge badge-important"> -->
<%--                    <td> ${recebimento.ispago}</td> --%>
                
                
                 <td class="options-width">
								
								
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
									title="Informa��es" ><i class="icon-info-sign"></i></a>
									
									
									<a href="#myAlert${recebimento.id}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a>
									
			<div id="myAlert${recebimento.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">�</button>
                <h3>Alerta de Exclus�o</h3>
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
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Solu��es em Tecnologia</a> </div>
</div>