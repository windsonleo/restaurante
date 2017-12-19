<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
  <div id="content-header">
	
	</br>
	
<!--     <h3>findmotoqueiro <strong> </strong></h3> -->
  </div>

  
             <c:if test="${erros != null }">
</br>
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
      </br>
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
		
        <hr>
  
    <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
			<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">  <h5>Mapa</h5></h4>
                                    <p class="category"></p>
                                </div>
                                
<!--                                 </br> -->
                                
                                
                                 <div class="span12">
                    
                        
                       
<!--                          <div class="span2" style="margin-left:7em;"> -->
<!--                             <div class="card card-stats"> -->
<!--                                 <div class="card-header" data-background-color="blue"> -->
<!-- 									<i class="icon icon-barcode"></i> -->
<!--                                 </div> -->
<!--                                 <div class="card-content"> -->
<!--                                     <p class="category">Produtos</p> -->
<!--                                     <h3 class="title"><small></small> -->
<!-- <!--                                         <small>Total</small> --> 
<!--                                     </h3> -->
<!--                                 </div> -->
<!--                                 <div class="card-footer"> -->
<!--                                     <div class="stats"> -->
<!--                                         <i class="material-icons text-danger">clique aqui</i> -->
<!--                                         <a href="#pablo">Detalhes..</a> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
                        
                        
<!--                         <div class="span2"> -->
<!--                             <div class="card card-stats"> -->
<!--                                 <div class="card-header" data-background-color="blue"> -->
<!-- 									<i class="material-icons">style</i> -->
<!--                                 </div> -->
<!--                                 <div class="card-content"> -->
<!--                                     <p class="category">Itens</p> -->
<!--                                     <h3 class="title"><small></small> -->
<!-- <!--                                         <small>Total</small> --> 
<!--                                     </h3> -->
<!--                                 </div> -->
<!--                                 <div class="card-footer"> -->
<!--                                     <div class="stats"> -->
<!--                                         <i class="material-icons text-danger">clique aqui</i> -->
<!--                                         <a href="#pablo">Detalhes..</a> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
                        
                        
<!--                           <div class="span2"> -->
<!--                             <div class="card card-stats"> -->
<!--                                 <div class="card-header" data-background-color="blue"> -->
<!-- 									<i class="fa fa-money"></i> -->
<!--                                 </div> -->
<!--                                 <div class="card-content"> -->
<!--                                     <p class="category">Total Custo</p> -->
<%--                                     <h3 class="title"><small> <fmt:formatNumber type="currency" --%>
<%--                  										value=""/> </small> --%>
<!-- <!--                                         <small>Total</small> --> 
<!--                                     </h3> -->
<!--                                 </div> -->
<!--                                 <div class="card-footer"> -->
<!--                                     <div class="stats"> -->
<!--                                         <i class="material-icons text-danger">clique aqui</i> -->
<!--                                         <a href="#pablo">Detalhes..</a> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
                        
                        
<!--                           <div class="span2"> -->
<!--                             <div class="card card-stats"> -->
<!--                                 <div class="card-header" data-background-color="blue"> -->
<!-- 									<i class="material-icons">money</i> -->
<!--                                 </div> -->
<!--                                 <div class="card-content"> -->
<!--                                     <p class="category">Total Venda</p> -->
<%--                                     <h3 class="title"><small> <fmt:formatNumber type="currency" --%>
<%--                											  value=""/> </small> --%>
<!-- <!--                                         <small>Total</small> --> 
<!--                                     </h3> -->
<!--                                 </div> -->
                               
<!--                                 <div class="card-footer"> -->
<!--                                     <div class="stats"> -->
<!--                                         <i class="material-icons text-danger">clique aqui</i> -->
<!--                                         <a href="#pablo">Detalhes..</a> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
                        
                           <div id="map"></div> 
                        
                        </div>
                        
                    
          
</div>
</div>
</div>
</div>
</div>
</div>





