<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Delivery" class="tip-bottom"><i ><img src="${pageContext.request.contextPath}/resources/images/icons/16/entregas.png" /></i> Delivery</a> <a href="#" class="current">Movimenta��o de  Delivery</a> </div>
    <h1>Listagem e Vis�o Geral</h1>
    
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
   <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-icon"> <img src="${pageContext.request.contextPath}/resources/images/icons/16/entregas.png" /></i> 	     
         
            <h5>Movimenta��o Delivery</h5>
          <button type="submit" class="btn btn-sm btn-success" onClick="window.location='AdicionarDelivery'">Add</button> </span>
<%--              <div class="widget-title"> <span class="icon"><a href="${pageContext.request.contextPath}/pedidovenda/cadastro"><i class="icon" color="blue"></i></a> </span> --%>
         
<!--             </div> -->
          </div>
          
          
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
            
                     
              <thead>
               <tr>
                                        <th>Id</th>
									    <th>Data</th>
									    <th>Situa��o</th>
									    
									    <th>Status</th>
									    <th>Origem</th>
									    <th>Total</th>
   									    <th>Cliente</th>
   									    <th>Mesa</th>
   									    <th>Garcon</th>
									     <th>Itens</th>
									     <th>Ativo</th>
									     <th>Pago</th>
									    <th>A��o</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="pedidovenda" items="${pedidovendaList}" varStatus="origempedido">


		  			<tr class="gradeX">
		
		 				<td>${pedidovenda.id}</td>
		                  <td>${pedidovenda.data}</td>
						<td>${pedidovenda.situacao}</td>
		                  
<%-- 		                  <td><span class="label label-info">${pedidovenda.status}</span></td> --%>
		                
		                	<c:choose>
				    <c:when test="${pedidovenda.status=='ABERTO'}">

                  <td><span class="label label-info">${pedidovenda.status}</span></td>

				
				    </c:when> 
				    
				   <c:when test="${pedidovenda.status=='PENDENTE'}">

                  <td><span class="label label-warning">${pedidovenda.status}</span></td>

				
				    </c:when>
				    
				    <c:when test="${pedidovenda.status=='PRONTO'}">

                  <td><span class="label label-success">${pedidovenda.status}</span></td>

				
				    </c:when> 
				    
				    <c:when test="${pedidovenda.status=='CANCELADO'}">

                  <td><span class="label label-important">${pedidovenda.status}</span></td>

				
				    </c:when>  
				    
				    <c:when test="${pedidovenda.status=='FECHADO'}">

                  <td><span class="label label-ly">${pedidovenda.status}</span></td>

				
				    </c:when> 
				    
				    <c:otherwise>


				    </c:otherwise>
				
				</c:choose>
		                
		                
		                 <td>${pedidovenda.origempedido}</td>
		                 <td>${pedidovenda.total}</td>
		                 <td>${pedidovenda.cliente}</td>
		                 <td>${pedidovenda.mesa}</td>
		                 <td>${pedidovenda.garcon}</td>
		                  <td>${pedidovenda.items}</td>
		                   <td><span class="label label bg_lb"> ${pedidovenda.ativo}</span></td>
		                   
		                   <td>
		                   
                  	<c:choose>
				    <c:when test="${pedidovenda.ispago}">

                  <td><span class="label label-success">${pedidovenda.ispago}</span></td>

				    </c:when> 
				    
				    <c:otherwise>

                  <td><span class="label label-important">${pedidovenda.ispago}</span></td>

				    </c:otherwise>
				</c:choose>		                   
		                   
		                   
		                   </td>
		                   
		                   
		                   
		                   
		                   <td class="options-width">
								
								
								<a
									href="${pageContext.request.contextPath}/pedidovenda/informacao?id=${pedidovenda.id}"
									title="informa��o" class="fa fa-info fa-2x"></a>
									
											<a
									href="${pageContext.request.contextPath}/pedidovenda/additem?id=${pedidovenda.id}"
									title="additem" class="fa fa-plus-square fa-2x"></a>
									
										<a
									href="${pageContext.request.contextPath}/pedidovenda/editar?id=${pedidovenda.id}"
									title="editar" class="fa fa-pencil fa-2x"></a>
	
	
	
	
	
		<a href="#myAlert${pedidovenda.id}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a>
									
			<div id="myAlert${pedidovenda.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">�</button>
                <h3>Alerta de Exclus�o</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/pedidovenda/delete?id=${pedidovenda.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>								
									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/pedidovenda/delete?id=${pedidovenda.id}" --%>
<!-- 									title="deletar" class="fa fa-remove fa-2x" ></a> -->
									
									
										
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
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Solu��es em Tecnologia</a> </div>
</div>