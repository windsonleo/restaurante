<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/estoque/movimentacao"  title="Go to Estoque" class="tip-bottom"><i class="icon-home"></i> Estoque</a> <a href="#">Movimentação Estoque</a> <a href="#" class="current">Informações do Estoque </a> </div>
    <h1>Informações do Estoque <strong> ${estoque.id }</strong></h1>
  </div>
  <div class="container-fluid"><hr>
  
    <c:if test="${erros != null }">
            <div class="alert alert-error alert-block"> <a class="close" data-dismiss="alert" href="#">×</a>
              <h4 class="alert-heading">Erros!</h4>
              
              ${erros}
            </div>
            
    </c:if>
    
      <c:if test="${mensagem != null }">
            <div class="alert alert-success alert-block"> <a class="close" data-dismiss="alert" href="#">×</a>
              <h4 class="alert-heading">Sucesso!</h4>
              
              ${mensagem}
            </div>
            
    </c:if>
  
  
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
   
            <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Detalhes do Estoque : ${estoque.nome}</h5>
          </div>
             <div class="widget-content nopadding">
		
						<div class="control-group">
							<label class="control-label">...</label>
							<div class="controls">
						
						<input id="id" class="span2 m-wrap" name="id" type="text" value="${estoque.id}" placeholder="Digite o id" />
               			<input id="isativo" name="isativo" class="span8 m-wrap" type="checkbox" checked="${estoque.isativo}"/>
						<input id="nome" class="form-control" name="nome" type="text" value="${estoque.nome}" placeholder="Digite o Nome da Estoque"/>
							
							</div>
						</div>
           						
        
              
             							
     
               <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Itens do Estoque  : <strong> ${estoque.name }</strong></h5>
           
          </div>
     
     <div class="widget-content nopadding">               
<!--        <div class="container-fluid"> -->
     
<!-- 		 <div class="table-responsive"> -->
                            <table class="table table-bordered data-table">
                            
                                <thead>
                                    <tr>
                                        <th>Descricao</th>
									    <th>Qtd</th>
									    <th>Ação</th>
<!-- 									    <th>Qtd</th> -->
<!-- 									    <th>Preço Custo</th> -->
<!-- 									    <th>UM</th> -->
									    
<!-- 									    <th>Total Item</th> -->
<!-- 									    <th>Total Item</th> -->
									    
<!-- 									     <th>Ativo?</th> -->
<!-- 									     <th>Pagamentos</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
<!-- 									    <th>Ação</th> -->
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="item" items="${estoque.items}" varStatus="id">

  
  <tr class="gradeX">

			      <td>${item.key}</td>
                  <td>${item.value}</td>






								<td class="options-width">

      								
      								<a
									href="${pageContext.request.contextPath}/item/informacao?id=${item.key}"
									title="informação" class="fa fa-info fa-2x"><i class="icon-info-sign"></i></a>
									
										<a
									href="${pageContext.request.contextPath}/item/editar?id=${item.key}"
									title="editar" class="fa fa-pencil fa-2x"><i class="icon-edit"></i></a>
									
<!-- 																			<a -->
<%-- 									href="${pageContext.request.contextPath}/recebimento/confirmaritem?id=${item.key}&idrec=${recebimento.id}" --%>
<!-- 									title="confirmarItens" class="fa fa-pencil fa-2x"><i class="icon-ok"></i></a> -->
									
									
									<a href="#myAlert${item.key}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a>
									
			<div id="myAlert${item.key}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>Alerta de Exclusão</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/item/delete?id=${item.key}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>		
								
								
								
								
								
								
								
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
	

</div>
</div>
</div>




