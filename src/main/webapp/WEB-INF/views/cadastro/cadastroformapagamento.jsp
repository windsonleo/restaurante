<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
  <div id="content-header">
	</br>
<!-- 	 </br> -->

  </div>
  <div class="container-fluid"><hr>
  
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
    <div class="row-fluid">
      <div class="span12">
                <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Cadastro Forma de Pagamento</h4>
                                    <p class="category">Insira os Dados</p>

                                </div>
                                
                                </br>
          <div class="widget-content">    
           <form class="form-horizonta" method="post" action="${pageContext.request.contextPath}/formapagamento/${acao}">
              
              
               <div class="checkbox">
                <label>
				<input id="ativo" name="optionsCheckboxes"  type="checkbox" checked="${formapagamento.ativo}" class="checkbox"/>Ativo?
				</label>
              </div>
              
              <div class="form-group label-floating is-empty">
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${formapagamento.id}" placeholder="" />
               
                </div>
              </div>
              </div>
    			
    			<div class="form-group label-floating is-empty">
              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						<input id="nome" class="form-control" name="nome" type="text" value="${formapagamento.nome}" placeholder=""/>
               
               
               </div>
               </div>
               </div>
               
             <div class="form-group label-floating is-empty">
              <div class="control-group">
                <label class="control-label">Tipos</label>
                                    <select id="tipo"name="tipo"  class="form-control">
	                                  <optgroup label="Tipos de Formas de Pagamento">
		           				
		           					<option value="${formapagamento.tipo}">${formapagamento.tipo}</option>
		           						           			
		           				<option value="AVISTA">AVISTA</option>
		           				<option value="CCREDITO">CCREDITO</option>
		           				<option value="CDEBITO">CDEBITO</option>
		           				      				
		           			
		                </optgroup>
	                    </select>
               
               
                </div>
              </div>

              
              
         <div class="form-group label-floating is-empty">
              
            <div class="control-group">
                <label class="control-label">Parcelas</label>
                <div class="controls">
						<input id="parcelas" class="form-control" name="parcelas" type="text" value="${formapagamento.parcelas}" placeholder=""/>
              			<input id="percdesconto" class="form-control" name="percdesconto" type="text" value="${formapagamento.percdesconto}" placeholder="%"/>
              
                </div>
            
                
              </div>
             </div>
              
      
              <div class="form-actions">
                <input type="submit" value="${acao}" class="btn btn-success">
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
            </div>
          </div>

</div>
