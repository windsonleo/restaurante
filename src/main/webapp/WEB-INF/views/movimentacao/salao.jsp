	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ page session="true" %>

<div id="content">


    <div class="container-fluid">
    
     
        
        <div class="row-fluid">
        
          <c:if test="${erros != null }">
			<div class="alert alert-danger">
				<div class="container-fluid">
					<div class="alert-icon">
						<i class="material-icons">error_outline</i>
					</div>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true"><i class="material-icons">clear</i></span>
					</button>
					<b>Error:</b> ${erros}
				</div>
			</div>


		</c:if>
    
    
    
    

    
      <c:if test="${mensagem != null }">
    
			<div class="alert alert-success">
				<div class="container-fluid">
					<div class="alert-icon">
						<i class="material-icons">check</i>
					</div>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true"><i class="material-icons">clear</i></span>
					</button>
					<b>Sucesso:</b> ${mensagem}
				</div>
			</div>

		</c:if>
		
		</div>
		
        <hr>
        
      <div class="row" style="margin-top:-4em;">

		<div class="col-md-8 col-md-offset-3">

		
		 <ul class="nav nav-pills" role="tablist">
					
					
					<li class="" >
<%-- 						<a href="${pageContext.request.contextPath}/mesa/abrirmesa" role="modal" data-toggle="modal" data-target="#exampleModal"> --%>
							<a href="#ModalAbrirMesa" role="tab" data-toggle="modal" aria-expanded="true" data-target="#ModalAbrirMesa">
							
							<i class="material-icons">lock_open</i>
							Abrir
						</a>
					</li>
					
					<li >
<%-- 						<a href="${pageContext.request.contextPath}/mesa/fecharmesa" role="modal" data-toggle="modal" data-target="#exampleModal2"> --%>
							<a href="#ModalFecharMesa" role="tab" data-toggle="modal" aria-expanded="false">
							
							<i class="material-icons">lock</i>
							Fechar
						</a>
					</li>
					
					<li class="" >
						<a href="#ModalTransferirMesa" role="tab" data-toggle="modal" data-target="#ModalTransferirMesa" aria-expanded="false">
							<i class="material-icons"> compare_arrows</i>
							Transferir
						</a>
					</li>
		</ul>
		


    </div>
    
    </div>
    
    
             <div class="row">
             
<!--              <div class="span8"> -->
                   
                     <c:forEach var="mesa" items="${mesasList}" varStatus="id">
                       
                        
                         
                       
                    <c:choose>


                          <c:when test="${mesa.status=='ABERTA'}">

                          <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="green">
									<i class="material-icons">layers</i>
                                </div>
                                
                                <div class="card-content">
                                    <p class="category">${mesa.id}</p>
                                    <h3 class="title">${mesa.numero}
<!--                                         <small>Total</small> -->
                                    </h3>
                                    
                                    <h3 class="title"><fmt:formatNumber type="currency"
                       value="${mesa.CalcularTotal()}"/>
<!--                                         <small>Total</small> -->
                                    </h3>
                                    

                                    
                                </div>
                                
                                <div class="card-footer">
                                    <div class="stats">
                                   <i class="material-icons">shopping_basket</i>
                                    
                                    <span class="label label-danger"> ${mesa.pedidosnow.size()}</span>
                                    
                                     <i class="material-icons">supervisor_account</i>
                                    
                                    <span class="label label-danger"> ${qtdpessoas}</span>
                                    
                                    
                                    <i class="material-icons">list</i>
                                    
                                    <span class="label label-danger"> ${mesa.pedidosnow.size()}</span>
                                                                         
            <a href="${pageContext.request.contextPath}/pedidovenda/rapido" class="small-box-footer">
             <i class="material-icons">add</i>
              </a><%--                         <a href="${pageContext.request.contextPath}/pedidovenda/fecharpedido" class="small-box-footer">Fechar </a> --%>
                      <a href="#ModalFecharPedido" role="tab" data-toggle="modal" data-target="#ModalFecharPedido" aria-expanded="false">
                      <i class="material-icons"> lock</i>
                      
                      </a>
                                  
                                  
                                        
                                    </div>
                                </div>
                            </div>
                        </div>


                   </c:when>

                   <c:when test="${mesa.status=='FECHADA'}">

                         <div class="col-lg-3 col-md-6 col-sm-6">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="red">
								<i class="material-icons">layers</i>
                                </div>
                                <div class="card-content">
                                    <p class="category">${mesa.id}</p>
                                    <h3 class="title">${mesa.numero}
<!--                                         <small>Total</small> -->
                                    </h3>
                                    
                                    <h3 class="title"><fmt:formatNumber type="currency"
                       value="${mesa.CalcularTotal()}"/>
<!--                                         <small>Total</small> -->
                                    </h3>
                                    

                                    
                                </div>
                                
                                <div class="card-footer">
                                    <div class="stats">
                                   <i class="material-icons">shopping_basket</i>
                                    
                                    <span class="label label-success"> ${mesa.pedidosnow.size()}</span>
                                    
                                     <i class="material-icons">supervisor_account</i>
                                    
                                    <span class="label label-success"> ${qtdpessoas}</span>
                                    
                                    
                                    <i class="material-icons">list</i>
                                    
                                    <span class="label label-success"> ${mesa.pedidosnow.size()}</span>
                                                                         
            <a href="${pageContext.request.contextPath}/pedidovenda/rapido" class="small-box-footer">
             <i class="material-icons">add</i>
              </a>

<a href="#ModalFecharPedido" role="tab" data-toggle="modal" data-target="#ModalFecharPedido" aria-expanded="false">
                      <i class="material-icons"> lock</i>
                      
                      </a>                                     
                                    </div>
                                </div>
                            </div>
                        </div>

                       </c:when>


                     <c:otherwise>
                     
 						<div class="col-lg-3 col-md-6 col-sm-6">
                             <div class="card card-stats">
                                <div class="card-header" data-background-color="">
								<i class="material-icons">layers</i>
                                </div>
                                <div class="card-content">
                                    <p class="category">${mesa.id}</p>
                                    <h3 class="title">${mesa.numero}
<!--                                         <small>Total</small> -->
                                    </h3>
                                    
                                    <h3 class="title"><fmt:formatNumber type="currency"
                       value="${mesa.CalcularTotal()}"/>
<!--                                         <small>Total</small> -->
                                    </h3>
                                    

                                    
                                </div>
                                
                                <div class="card-footer">
                                    <div class="stats">
                                   <i class="material-icons">shopping_basket</i>
                                    
                                    <span class="label label-success"> ${mesa.pedidosnow.size()}</span>
                                    
                                     <i class="material-icons">supervisor_account</i>
                                    
                                    <span class="label label-success"> ${qtdpessoas}</span>
                                    
                                    
                                    <i class="material-icons">list</i>
                                    
                                    <span class="label label-success"> ${mesa.pedidosnow.size()}</span>
                                                                         
            <a href="${pageContext.request.contextPath}/pedidovenda/rapido" class="small-box-footer">
             <i class="material-icons">add</i>
              </a>
<a href="#ModalFecharPedido" role="tab" data-toggle="modal" data-target="#ModalFecharPedido" aria-expanded="false">
                      <i class="material-icons"> lock</i>
                      
                      </a>                                        
                                    </div>
                                </div>
                            </div>
                        </div>

                                            </c:otherwise>

                                        </c:choose>             
                                    

<!--                                         <li class="bg_lo"> -->
<%--                                             <a href="${pageContext.request.contextPath}/mesas/detalhes?id=${mesa.id}"> --%>
<!--                                                 <i class="icon-icon"><img -->
<%--                                                         src="${pageContext.request.contextPath}/resources/images/icons/32/mesa.png"></i> --%>

<%--                                                 <div class="huge">${mesa.id}</div> --%>
<%--                                                 <div>${mesa.numero}</div> --%>
<%--                                                 <div> ${mesa.status}</div> --%>
<%--                                                 <span class="label label-success">${mesa.pedidos.size()}</span> --%>

<!--                                             </a> -->

<!--                                         </li> -->


                                    </c:forEach>

<!--                                 </ul> -->
                            </div>
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
        
<!--         	<div class="span4"> -->
					
                     
					
<!--                             <div class="card card-profile"> -->
<!--                                 <div class="card-avatar"> -->
<!--                                     <a href="#pablo"> -->
<!--                                         <img class="img" src="../resources/images/cliente/vazio.jpg"> -->
<!--                                     </a> -->
                                    

<!--                                 </div> -->
                        
<!--                         <form action="addPedidoSalao" method="POST" class=""> -->


<!-- 				    <div class="form-group label-floating is-empty"> -->
<!--                                        <label class="control-label">Mesa</label> -->
<%-- 									<input id="idmesa" name="idmesa" list="${mesasList}" class="form-control" type="text" --%>
<!--                                     		  autocomplete="on"/> -->
<!--                             				  <span class="material-input"></span> -->
<!--                                  </div>  -->
                                 
<%--                               <datalist id="${mesasList}"> --%>

<%--                                     <c:forEach var="mesa" items="${mesasList}" varStatus="id"> --%>

<%--                                         <option value="${mesa.id }"> ${mesa.numero } </option> --%>

<%--                                     </c:forEach> --%>


<!--                                 </datalist> -->
                                 
<!--                               <div class="form-group label-floating is-empty"> -->
<!--                                        <label class="control-label">Garcon</label> -->
<%-- 									<input id="idgar" name="idgar" list="${garconsList}" class="form-control" type="text" --%>
<!--                                     		autocomplete="off"/> -->
<!--                             				  <span class="material-input"></span> -->
<!--                                  </div> -->
                                 
                                 
<%--                                  <datalist id="${garconsList}"> --%>

<%--                                     <c:forEach var="garcon" items="${garconsList}" varStatus="id"> --%>

<%--                                         <option value="${garcon.id }"> ${garcon.nome } </option> --%>

<%--                                     </c:forEach> --%>


<!--                                 </datalist>  -->
                                 
<!--                                   <div class="form-group label-floating is-empty"> -->
<!--                                        <label class="control-label">Produto</label> -->
<%-- 									<input id="idprod" name="idprod" list="${produtosList}" class="form-control" type="text" autocomplete="off" --%>
<!--                                     		  /> -->
<!--                             				  <span class="material-input"></span> -->
<!--                                  </div>  -->
                                 
<%--                                 <datalist id="${produtosList}"> --%>

<%--                                     <c:forEach var="produto" items="${produtosList}" varStatus="id"> --%>

<%--                                         <option value="${produto.id }"> ${produto.nome } </option> --%>

<%--                                     </c:forEach> --%>


<!--                                 </datalist> -->
                                 
                                 
                                 
<!--                                 <div class="form-group label-floating is-empty"> -->
<!--                                        <label class="control-label">Qtd</label> -->
<!-- 									<input id="qtd" name="qtd" class="form-control" type="text" -->
<!--                                     		placeholder="" /> -->
<!--                             				  <span class="material-input"></span> -->
<!--                                  </div>  -->


								

<!-- 						<div class="form-group label-floating  is-empty"> -->
<!--                               <label class="control-label">Cliente</label> -->
<%--                                 <input type="text" list="${clientesList}" id="idcli" --%>
<!--                                        placeholder="" name="idcli" autocomplete="off" -->
<!--                                        class="form-control"> -->
                                       
<!--                                  <span class="material-input"></span> -->
<!--                          </div> -->




<%--                                 <datalist id="${clientesList}"> --%>

<%--                                     <c:forEach var="client" items="${clientesList}" varStatus="id"> --%>

<%--                                         <option value="${client.id }"> ${client.nome } </option> --%>

<%--                                     </c:forEach> --%>


<!--                                 </datalist> -->
                                
                                
                                    
<!--                                <div class="form-group label-floating is-empty"> -->
<!-- <!--                               <label class="control-label">Cliente</label> --> 
                                   
<!--                                    <button type="submit"  class="btn btn-info btn-round btn-md">AddPedidoMesa</button> -->

                                       
<!--                                  <span class="material-input"></span> -->
<!--                          		</div> -->
                                    
<!--                                   </form> -->
                                  
<!--                                 <div class="content"> -->
                                    
<%--                                     <h4><p class="card-content text-gray">${mesa.numero} ${mesa.status} --%>
<%--                                      <p class="card-content pull-left">${mesa.id} </p> </h4> </p> --%>
<!-- <!--                                     <p class="card-content"> --> 
<!-- <!--                                         Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is...  -->
<!-- <!--                                     </p> --> 
                                    
                                    
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
                        
<!--                         modal da abertura e fechamento de mesa -->

<div class="modal fade" id="ModalAbrirMesa" tabindex="1" role="tab" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Abrir Mesa</h4>
      </div>
      <div class="modal-body">
        <form action="abrirmesa" method="get" >
          
          <div class="form-group">
                <div class="form-group label-floating is-empty">
                                       <label class="control-label">Mesa</label>
									<input id="idmesa" name="idmesa" list="${mesasList}" class="form-control" type="text"
                                    		  autocomplete="on"/>
                            				  <span class="material-input"></span>
                                 </div> 
                                 
                              <datalist id="${mesasList}">

                                    <c:forEach var="mesa" items="${mesasList}" varStatus="id">

                                        <option value="${mesa.id }"> ${mesa.numero } </option>

                                    </c:forEach>


                                </datalist>
         
          </div>
          
<!--           <div class="form-group"> -->
<!-- <!--             <label for="message-text" class="control-label">Cliente:</label> --> 
<!-- <!--             <input class="form-control" id="message-text"></input> --> 

<!-- 				<div class="form-group label-floating  is-empty"> -->
<!--                               <label class="control-label">Cliente</label> -->
<%--                                 <input type="text" list="${clientesList}" id="id" --%>
<!--                                        placeholder="" name="id" autocomplete="off" -->
<!--                                        class="form-control"> -->
                                       
<!--                                  <span class="material-input"></span> -->
<!--                          </div> -->




<%--                                 <datalist id="${clientesList}"> --%>

<%--                                     <c:forEach var="client" items="${clientesList}" varStatus="id"> --%>

<%--                                         <option value="${client.id }"> ${client.nome } </option> --%>

<%--                                     </c:forEach> --%>


<!--                                 </datalist> -->
<!--           </div> -->
          
<!--             <div class="form-group"> -->
<!--                     <div class="form-group label-floating is-empty"> -->
<!--                         <label class="control-label">Garcon</label> -->
<%-- 							<input id="idgar" name="idgar" list="${garconsList}" class="form-control" type="text" --%>
<!--                              		autocomplete="off"/> -->
<!--                      				  <span class="material-input"></span> -->
<!--                     </div> -->
                                 
                                 
<%--                    <datalist id="${garconsList}"> --%>

<%--                       <c:forEach var="garcon" items="${garconsList}" varStatus="id"> --%>

<%--                           <option value="${garcon.id }"> ${garcon.nome } </option> --%>

<%--                       </c:forEach> --%>


<!--                   </datalist>  -->
<!--           </div> -->
          
          <div class="form-group">
                    <div class="form-group label-floating is-empty">
                        <label class="control-label">Qtd Pessoas</label>
							<input id="qtd" name="qtd"  class="form-control" type="text" value=""
                             		autocomplete="off"/>
                     				  <span class="material-input"></span>
                    </div>
                                 
                                 

          </div>
          
                                          <div class="form-group label-floating is-empty">
                                       <label class="control-label">Hora</label>
									<input id="hora" name="hora" class="form-control" type="text"
                                    		placeholder="" />
                            				  <span class="material-input"></span>
                                 </div> 
          
          <button type="submit"  class="btn btn-info" >Abrir Mesa</button>
                  <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
          
        </form>
        
      </div>
      
      <div class="modal-footer">
        
        
      </div>
      
    </div>
  </div>
</div>



<div class="modal fade" id="ModalFecharMesa" tabindex="2" role="toggle" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Fechar Mesa</h4>
      </div>
      <div class="modal-body">
       
        <form action="fecharmesa" method="get">
          
  		<div class="form-group">
                <div class="form-group label-floating is-empty">
                                       <label class="control-label">Mesa</label>
									<input id="idmesa" name="idmesa" list="${mesasList}" class="form-control" type="text"
                                    		  autocomplete="on"/>
                            				  <span class="material-input"></span>
                                 </div> 
                                 
                              <datalist id="${mesasList}">

                                    <c:forEach var="mesa" items="${mesasList}" varStatus="id">

                                        <option value="${mesa.id }"> ${mesa.numero } </option>

                                    </c:forEach>


                                </datalist>
                                
                                
                                 <div class="form-group label-floating is-empty">
                                       <label class="control-label">Hora</label>
									<input id="horafinal" name="horafinal" class="form-control" type="text"
                                    		placeholder="" />
                            				  <span class="material-input"></span>
                                 </div> 
         
          </div>
          
                  <button type="submit" class="btn btn-info">Fechar Mesa</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
          
          
<!--           <div class="form-group"> -->
<!--             <label for="message-text" class="control-label">Cliente:</label> -->
<!--             <input class="form-control" id="message-text"></input> -->
<!--           </div> -->
          
<!--             <div class="form-group"> -->
<!--             <label for="message-text" class="control-label">Garcon:</label> -->
<!--             <input class="form-control" id="message-text"></input> -->
<!--           </div> -->
          
        </form>
      </div>
      <div class="modal-footer">
      
      </div>
      
    </div>
  </div>
</div>



<!-- transferir mesa -->
<div class="modal fade" id="ModalTransferirMesa" tabindex="3" role="tab" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Transferir Mesa</h4>
      </div>
      <div class="modal-body">
       
        <form action="transferirmesa" method="get">
          
  		<div class="form-group">
                <div class="form-group label-floating is-empty">
                                       <label class="control-label">Mesa Origem</label>
									<input id="idmesaorigem" name="idmesaorigem" list="${mesasList}" class="form-control" type="text"
                                    		  autocomplete="off"/>
                            				  <span class="material-input"></span>
                                 </div> 
                                 
                              <datalist id="${mesasList}">

                                    <c:forEach var="mesa" items="${mesasList}" varStatus="id">

                                        <option value="${mesa.id }"> ${mesa.numero } </option>

                                    </c:forEach>


                                </datalist>
                                
                                

         
          </div>
          
            		<div class="form-group">
                <div class="form-group label-floating is-empty">
                                       <label class="control-label">Mesa Destino</label>
									<input id="idmesadestino" name="idmesadestino" list="${mesasList}" class="form-control" type="text"
                                    		  autocomplete="off"/>
                            				  <span class="material-input"></span>
                                 </div> 
                                 
                              <datalist id="${mesasList}">

                                    <c:forEach var="mesa" items="${mesasList}" varStatus="id">

                                        <option value="${mesa.id }"> ${mesa.numero } </option>

                                    </c:forEach>


                                </datalist>
                                
                                

         
          </div>
          
                  <button type="submit" class="btn btn-info">Tranferir Mesa</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
          
          
<!--           <div class="form-group"> -->
<!--             <label for="message-text" class="control-label">Cliente:</label> -->
<!--             <input class="form-control" id="message-text"></input> -->
<!--           </div> -->
          
<!--             <div class="form-group"> -->
<!--             <label for="message-text" class="control-label">Garcon:</label> -->
<!--             <input class="form-control" id="message-text"></input> -->
<!--           </div> -->
          
        </form>
      </div>
      <div class="modal-footer">
      
      </div>
      
    </div>
  </div>
</div>

<div class="modal fade" id="ModalFecharPedido" tabindex="3" role="tab" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">fechar Pedido</h4>
      </div>
      <div class="modal-body">
       
        <form action="transferirmesa" method="get">
          
  		<div class="form-group">
                <div class="form-group label-floating is-empty">
                                       <label class="control-label">Pedido</label>
									<input id="idmesaorigem" name="idmesaorigem" list="${pedidoList}" class="form-control" type="text"
                                    		  autocomplete="off"/>
                            				  <span class="material-input"></span>
                                 </div> 
                                 
                              <datalist id="${pedidoList}">

                                    <c:forEach var="pedido" items="${mesa.pedidos}" varStatus="id">

                                        <option value="${pedido.id }"> ${pedido.items } </option>

                                    </c:forEach>


                                </datalist>
                                
                                

         
          </div>
          
            		<div class="form-group">
                <div class="form-group label-floating is-empty">
                                       <label class="control-label">Mesa Destino</label>
									<input id="idmesadestino" name="idmesadestino" list="${mesasList}" class="form-control" type="text"
                                    		  autocomplete="on"/>
                            				  <span class="material-input"></span>
                                 </div> 
                                 
                              <datalist id="${mesasList}">

                                    <c:forEach var="mesa" items="${mesasList}" varStatus="id">

                                        <option value="${mesa.id }"> ${mesa.numero } </option>

                                    </c:forEach>


                                </datalist>
                                
                                

         
          </div>
          
                  <button type="submit" class="btn btn-info">Tranferir Mesa</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
          
          
<!--           <div class="form-group"> -->
<!--             <label for="message-text" class="control-label">Cliente:</label> -->
<!--             <input class="form-control" id="message-text"></input> -->
<!--           </div> -->
          
<!--             <div class="form-group"> -->
<!--             <label for="message-text" class="control-label">Garcon:</label> -->
<!--             <input class="form-control" id="message-text"></input> -->
<!--           </div> -->
          
        </form>
      </div>
      <div class="modal-footer">
      
      </div>
      
    </div>
  </div>
</div>



    </div>
    </div>
    
</div>

</div>
