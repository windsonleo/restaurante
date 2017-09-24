<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/formapagamento/movimentacao" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Forma de Pagamento</a>>> <a href="#">Movimentação Forma de Pagamento</a> >><a href="#" class="current">Cadastro Forma de Pagamento</a> </div>
    <h1>Cadastro de Forma de Pagamento</h1>
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
            <h5>Cadastro de Forma de Pagamento</h5>
          </div>
          <div class="widget-content nopadding">
            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/formapagamento/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">
              
               <div class="control-group">
                <label class="control-label">Ativo?</label>
                <div class="controls">
						<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${formapagamento.isativo}"/>
                </div>
              </div>
              
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${formapagamento.id}" placeholder="Digite o id" />
                </div>
              </div>
              
                <div class="control-group">
                <label class="control-label">Tipo</label>
                <div class="controls">


                    
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
                <label class="control-label">Nome</label>
                <div class="controls">
						<input id="nome" class="form-control" name="nome" type="text" value="${formapagamento.nome}" placeholder="Digite o Nome da Forma de Pagamento"/>
                </div>
              </div>

<!--               <div class="control-group"> -->
<!--                 <label class="control-label">Genero</label> -->
<!--                 <div class="controls"> -->
                    
<!--                  <select id="genero" name="genero" id="genero" class="form-control">            -->
<!-- 	                <optgroup label="Genero do Usuario"> -->
	           			
<!-- 	           				<option value="MASCULINO">MASCULINO</option> -->
<!-- 	           				<option value="FEMININO">FEMININO</option> -->
	           				      				
<!-- 	                </optgroup> -->
<!-- 	            </select> -->
	                    
	                                        
<!--                 </div> -->
<!--               </div> -->
              
              
              
            <div class="control-group">
                <label class="control-label">Parcelas</label>
                <div class="controls">
						<input id="parcelas" class="form-control" name="parcelas" type="text" value="${formapagamento.parcelas}" placeholder="Digite a Quant. Parcelas"/>
                </div>
              </div>

            <div class="control-group">
                <label class="control-label">% Desc</label>
                <div class="controls">
						<input id="percdesconto" class="form-control" name="percdesconto" type="text" value="${formapagamento.percdesconto}" placeholder="Digite o % de Desconto"/>
                </div>
              </div>              
              
<!--             <div class="control-group"> -->
<!--                 <label class="control-label">Data de Nascimento</label> -->
<!--                 <div class="controls"> -->
<%--              <input id="telefone" class="form-control" name="datanascimento" type="date" value="${formapagamento.telefone}" placeholder="Digite o Telefone"/>					 --%>
<!--                 </div> -->
<!--               </div>       -->
              
              
       
              
              
              
              <div class="form-actions">
                <input type="submit" value="Inserir" class="btn btn-success">
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
            </div>
          </div>


<div class="row-fluid">
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Soluções em Tecnologia</a> </div>
</div>