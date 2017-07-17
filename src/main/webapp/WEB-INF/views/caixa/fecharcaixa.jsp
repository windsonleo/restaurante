<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>


<div id="page-wrapper">

	<div class="container-fluid">

		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					Caixa <small>Fechar Caixa</small>


				</h1>

				<ol class="breadcrumb">
					<li class="active"><i class="fa fa-support"></i> Caixa</li>
				</ol>


				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Digite a Data</h3>
					</div>
					<div class="panel-body">
					
					<form action="${pageContext.request.contextPath}/caixa/fechamentocaixa" method="get" >

						<label> <input id="dataini" name="dataini" class="form-control"
							type="date" value="${pedidovenda.data }"
							placeholder="Digite a Data" />
						</label> 
						
<!-- 						<label> <input id="datafim" name="datafim" class="form-control" -->
<!-- 							type="date" value="" -->
<!-- 							placeholder="Digite a Data Final" /> -->
<!-- 						</label> -->
						
									<button type="submit"class="btn btn-lg btn-primary" onClick="javascript:window.location='fechamentocaixa'">Fechar Caixa</button>
									<button type="button"class="btn btn-lg btn-primary">Imprimir Caixa</button>
						
						</form>

<!--                     		<input type="button" onclick="javascript:adiciona();" value="Fechar" /> -->

		
					

					</div>
				</div>


			</div>



		</div>

		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Detalhes dos Pedidos</h3>
			</div>
			<div class="panel-body">
			
			<div class="progress-striped-element">
			
			 <label> Quantidade Pedidos ${pedidovendaList.size()}</label>
			     <div class="progress progress-striped">
			    
                    <div class="progress-bar " role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="${pedidovendaList.size()}" style="width: 0%"><span >Total de Pedidos de Venda : ${pedidovendaList.size()}</span>
                    </div>
                    
                </div>
                
                	 <label>Quantidade Pedidos Cancelados ${pedidoVendaListacancelados.size()}</label>
			     <div class="progress progress-striped">
			    
                    <div class="progress-bar " role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%"><span >Total de Pedidos de Venda Cancelados : ${pedidoVendaListacancelados.size()}</span>
                    </div>
                    
                </div>
                
                       	 <label>Quantidade Pedidos Internet</label>
			     <div class="progress progress-striped">
			    
                    <div class="progress-bar " role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%"><span>Total de Pedidos de Venda Internet : ${pedidoVendaListainternet.size()}</span>
                    </div>
                    
                </div>
                
                            	 <label>Quantidade Pedidos Mesa</label>
			     <div class="progress progress-striped">
			    
                    <div class="progress-bar " role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%"><span>Total de Pedidos de Venda Mesa : ${pedidoVendaListamesa.size()}</span>
                    </div>
                    
                </div>
                
                                       	 <label>Quantidade Pedidos Balc�o</label>
			     <div class="progress progress-striped">
			    
                    <div class="progress-bar " role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%"><span>Total de Pedidos de Venda Balc�o : ${pedidoVendaListabalcao.size()}</span>
                    </div>
                    
                </div>
                
                   <label>Quantidade Pedidos Televendas</label>
			     <div class="progress progress-striped">
			    
                    <div class="progress-bar " role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%"><span>Total de Pedidos de Venda Televendas : ${pedidoVendaListatelevendas.size()}</span>
                    </div>
                    
                </div>
			
			
			</div>
			</div>
		</div>
		
		
				<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">Detalhes das formas de Pagamento</h3>
			</div>
			<div class="panel-body">
			
			 
			  
			  <div class="progress-element">
			 
			   <c:forEach var="formapagamento" items="${formapagamentoList}" varStatus="id">
			     
			      <label>${formapagamento.nome}</label>
			     <div class="progress progress-striped">
			    
                    <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%"><span>Total Forma de Pagamento : ${formapagamento.nome}</span>
                    </div>
                    
                </div>
                
               			  
			  </c:forEach>
			  
			   </div>
			
			
			
			</div>
		</div>

	</div>



</div>




