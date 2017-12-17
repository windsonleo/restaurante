<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<div id="content">

    <div id="content-header">

</br>
</br>
<!--         <h3>Salão</h3> -->
    </div>


    <div class="container-fluid">
        <hr>
        <div class="row-fluid">
            <div class="span12">
				<div class="span8">
				<div class="card">
                    <div class="card-content">

                        <div class="card-header" data-background-color="blue">
  							<h3 class="title">Salao</h3>
                            <p class="category">Todas as mesas </p>

                        </div>
                        
					</br>
					</br>

			<div class="row">

            <div class="span12">



                 <c:forEach var="mesa" items="${mesasList}" varStatus="id">
                                    
                                    
                        <div class="span4">
                            <div class="card card-stats">
                                <div class="card-header" data-background-color="green">
									<i class="icon-table"></i>
                                </div>
                                <div class="card-content">
                                    <p class="category">${mesa.id}</p>
                                    <h3 class="title">${mesa.numero}
<!--                                         <small>Total</small> -->
                                    </h3>
                                    
                                    <h3 class="title">R$ 100,00
<!--                                         <small>Total</small> -->
                                    </h3>
                                    

                                    
                                </div>
                                
                                <div class="card-footer">
                                    <div class="stats">
                                   <i class="material-icons">shopping_basket</i>
                                    
                                    <span class="label label-danger"> ${mesa.pedidos.size()}</span>
                                    
                                     <i class="material-icons">supervisor_account</i>
                                    
                                    <span class="label label-danger"> ${mesa.pedidos.size()}</span>
                                    
                                    
                                    <i class="material-icons">list</i>
                                    
                                    <span class="label label-danger"> ${mesa.pedidos.size()}</span>
                                                                         
<!--                                         <a href="#pablo">Detalhes..</a> -->
                                        
                                    </div>
                                </div>
                            </div>
                        </div>

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
                    </div>
                </div>
            </div>
        </div>
        
        	<div class="span4">
					
                     
					
                            <div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="../resources/images/cliente/vazio.jpg">
                                    </a>
                                    

                                </div>
                        <form action="LocalizarClienteGerencia" method="POST" class="">


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
                                       <label class="control-label">Garcon</label>
									<input id="idgar" name="idgar" list="${garconsList}" class="form-control" type="text"
                                    		autocomplete="off"/>
                            				  <span class="material-input"></span>
                                 </div>
                                 
                                 
                                 <datalist id="${garconsList}">

                                    <c:forEach var="garcon" items="${garconsList}" varStatus="id">

                                        <option value="${garcon.id }"> ${garcon.nome } </option>

                                    </c:forEach>


                                </datalist> 
                                 
                                  <div class="form-group label-floating is-empty">
                                       <label class="control-label">Produto</label>
									<input id="idprod" name="idprod" list="${produtosList}" class="form-control" type="text" autocomplete="off"
                                    		  />
                            				  <span class="material-input"></span>
                                 </div> 
                                 
                                <datalist id="${produtosList}">

                                    <c:forEach var="produto" items="${produtosList}" varStatus="id">

                                        <option value="${produto.id }"> ${produto.nome } </option>

                                    </c:forEach>


                                </datalist>
                                 
                                 
                                 
                                <div class="form-group label-floating is-empty">
                                       <label class="control-label">Qtd</label>
									<input id="qtd" name="qtd" class="form-control" type="text"
                                    		placeholder="" />
                            				  <span class="material-input"></span>
                                 </div> 


								

						<div class="form-group label-floating  is-empty">
                              <label class="control-label">Cliente</label>
                                <input type="text" list="${clientesList}" id="id"
                                       placeholder="" name="id" autocomplete="off"
                                       class="form-control">
                                       
                                 <span class="material-input"></span>
                         </div>




                                <datalist id="${clientesList}">

                                    <c:forEach var="client" items="${clientesList}" varStatus="id">

                                        <option value="${client.id }"> ${client.nome } </option>

                                    </c:forEach>


                                </datalist>
                                
                                
                                    
                               <div class="form-group label-floating is-empty">
<!--                               <label class="control-label">Cliente</label> -->
                                   
                                   <button type="submit" formaction="LocalizarClienteGerencia" class="btn btn-danger btn-round btn-md">AddPedidoMesa</button>

                                       
                                 <span class="material-input"></span>
                         		</div>
                                    
                                  </form>
                                  
                                <div class="content">
                                    
                                    <h4><p class="card-content text-gray">${mesa.numero} ${mesa.status}
                                     <p class="card-content pull-left">${mesa.id} </p> </h4> </p>
<!--                                     <p class="card-content"> -->
<!--                                         Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is... -->
<!--                                     </p> -->
                                    
                                    
                                </div>
                            </div>
                        </div>
    </div>
    </div>
    
</div>

</div>
