<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
  <div id="content-header">
	</br>
    <h2>Cadastro de Forma de Pagamento</h2>
  </div>
  <div class="container-fluid"><hr>
  
    <c:if test="${erros != null }">
            <div class="alert alert-error alert-block"> <a class="close" data-dismiss="alert" href="#">�</a>
              <h4 class="alert-heading">Erros!</h4>
              
              ${erros}
            </div>
            
    </c:if>
    
      <c:if test="${mensagem != null }">
            <div class="alert alert-success alert-block"> <a class="close" data-dismiss="alert" href="#">�</a>
              <h4 class="alert-heading">Sucesso!</h4>
              
              ${mensagem}
            </div>
            
            
    </c:if>
    <div class="row-fluid">
      <div class="span12">
                <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Cadastro Forma de Pagamento</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">    
           <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/formapagamento/${acao}">
              
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="span2 m-wrap" name="id" type="text" value="${formapagamento.id}" placeholder="Digite o id" />
               			<input id="ativo" name="ativo" class="span8 m-wrap" type="checkbox" checked="${formapagamento.ativo}"/>
               
                </div>
              </div>
              
    
              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						<input id="nome" class="form-control" name="nome" type="text" value="${formapagamento.nome}" placeholder="Digite o Nome da Forma de Pagamento"/>
               
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

              
              
              
            <div class="control-group">
                <label class="control-label">Parcelas</label>
                <div class="controls">
						<input id="parcelas" class="form-control" name="parcelas" type="text" value="${formapagamento.parcelas}" placeholder="Digite a Quant. Parcelas"/>
              			<input id="percdesconto" class="form-control" name="percdesconto" type="text" value="${formapagamento.percdesconto}" placeholder="Digite o % de Desconto"/>
              
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
