<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>



<div id="content">
  <div id="content-header">
	</br>
	
<!--     <h2>Cadastro de Reserva</h2> -->
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
                       
                                <div class="card-header" data-background-color="red">
                                
                                    <h4 class="title">Cadastro Reserva</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/reserva/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">
            <form class="form-horizonta" method="post" action="${pageContext.request.contextPath}/reserva/${acao}">
              
			<div class="checkbox">
                <label>
				<input id="ativo" name="optionsCheckboxes"  type="checkbox" checked="${reserva.ativo}" class="checkbox"/>Ativo?
				</label>
              </div>
              
              <div class="form-group label-floating ">
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${reserva.id}" placeholder="" />
                </div>
              </div>
              </div>
              
              <div class="form-group label-floating ">
              <div class="control-group">
                <label class="control-label">Data</label>
                <div class="controls">
						<input id="data" class="datepicker form-control" name="data" type="text" value="<fmt:formatDate 
                pattern="dd/MM/yyyy"  value="${reserva.data}"/>" placeholder=""/>
                </div>
              </div>
              </div>
              
                            <div class="form-group label-floating ">
              <div class="control-group">
                <label class="control-label">Hora</label>
                <div class="controls">
						<input id="hora" class=" form-control" name="hora" type="time" value="${reserva.hora}" placeholder=""/>
                </div>
              </div>
              </div>
              
            <div class="form-group label-floating">
 				<div class="control-group">
                	<label class="control-label">Cliente</label>	
                <select id="cliente" name="cliente" class="form-control">
								<optgroup label="Cliente">


				<option value="${reserva.cliente.id}" selected="selected"> ${reserva.cliente.nome } </option>


									<c:forEach var="cliente" items="${clienteList}">

										<option value="${cliente.id}">${cliente.nome}</option>


									</c:forEach>
								</optgroup>
						</select>
						
						</div>
						</div>
						

			<div class="form-group label-floating">
 				<div class="control-group">
                	<label class="control-label">Mesa</label>	
						<select id="mesa" name="mesa" class="form-control">
								<optgroup label="Mesa">


				<option value="${reserva.mesa.id}" selected="selected"> ${reserva.mesa.numero } </option>


									<c:forEach var="mesa" items="${mesaList}">

										<option value="${mesa.id}">${mesa.numero}</option>


									</c:forEach>
								</optgroup>
						</select>   
						</div>
						</div>
						
						
			<div class="form-group label-floating">
 				<div class="control-group">
                	<label class="control-label">Status</label>	
						<select id="status" name="status" class="form-control">
								<optgroup label="Status da Reserva">


				<option value="${reserva.status}" selected="selected"> ${reserva.status} </option>


									<c:forEach var="stat" items="${status}">

										<option value="${stat}">${stat}</option>


									</c:forEach>
								</optgroup>
						</select>   
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


