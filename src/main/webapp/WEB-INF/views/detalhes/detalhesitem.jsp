<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true"%>


<div id="content">
	<div class="container-fluid">
		<hr>
		<div class="row-fluid">


		<table class="table">
					<tbody>

							<tr>

										<td>
											<div class="image-responsive">
												<i class="material-icons" style="color: green;">
													shopping_cart</i>
											</div>
										</td>

										<td>
											<!-- 														                <div class="user-thumb"> <img width="40" height="40" alt="User" src="resources/images/demo/av3.jpg"> </div> -->

											<div class="article-post">

												<span class="user-info"> ${pedidovenda.id} </span></br> <span
													class="user-info"> cliente : ${pedidovenda.cliente} </span>
												<p>
													<span class="user-info"> Data: <fmt:formatDate
															pattern="dd/MM/yyyy" value="${pedidovenda.data}" /> <a href="#"></a>
														Itens : ${pedidovenda.items}
													</span>
													
													 <c:forEach var="item" items="${pedidovenda.items}">
													 
																                  <tr>
																	                  <td>
																	                  ${item.key }
																	                  </td>
																	                  
																	                 <td>
																	                  ${item.value }
																	                  </td>
																	                  
																	                 <td >
																	                 <label class="label label-warning"> ${item.key.situacao }</label> 
																	                  </td> 
																	                  
															 <td class="td-actions text-right">
                                                           
                                                           
                                                            <button type="button" rel="tooltip" title="Entregar" class="btn btn-danger btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/pedidovenda/item/entregar?id=${pedidovenda.id}&key=${item.key }' " >
                                                                <i class="material-icons">done_all</i>
                                                            </button>                                                           
                                                           
<%--                                                             <button type="button" rel="tooltip" title="Pronto" class="btn btn-info btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/pedidovenda/item/pronto?id=${pv.id}&key=${item.key }' "> --%>
<!--                                                                 <i class="material-icons">edit</i> -->
<!--                                                             </button> -->
                                                           
<%--                                                             <button type="button" rel="tooltip" title="Cancelado" class="btn btn-danger btn-simple btn-xs" onclick="window.location='${pageContext.request.contextPath}/pedidovenda/item/cancelar?id=${pv.id}&key=${item.key }' " > --%>
<!--                                                                 <i class="material-icons">close</i> -->
<!--                                                             </button> -->
                                                        </td>
															                  
															                  </tr>
													
													</c:forEach>
												</p>

												<%-- 															                  <div class="fr"> <a href="${pageContext.request.contextPath}/pedidocompra/aprovar?id=${pedidocompra.id}" class="btn btn-success btn-mini">Aprovar</a> <a href="${pageContext.request.contextPath}/pedidocompra/cancelar?id=${pedidocompra.id}" class="btn btn-danger btn-mini">Cancelar</a></div> --%>

											</div>

										</td>

										<!-- 														 <td class="td-actions text-right"> -->
										<!--                                                             <button type="button" rel="tooltip" title="Edit Task" class="btn btn-info btn-simple btn-xs"> -->
										<!--                                                                 <i class="material-icons">edit</i> -->
										<!--                                                             </button> -->
										<!--                                                             <button type="button" rel="tooltip" title="Remove" class="btn btn-danger btn-simple btn-xs"> -->
										<!--                                                                 <i class="material-icons">close</i> -->
										<!--                                                             </button> -->
										<!--                                                         </td> -->

			

							</tr>
					

					</tbody>
				</table>



		


			<!-- 			<a href='javascript:history.back(1)' class="btn btn-sm btn-info" >Voltar</a> -->
		</div>



	</div>

</div>



