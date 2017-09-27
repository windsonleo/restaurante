<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/categoria/movimentacao" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Categoria</a>>> <a href="#">Movimentação Categoria</a> >><a href="#" class="current">Cadastro Categoria</a> </div>
    <h1>Cadastro de Categoria</h1>
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
            <h5>Cadastro Endereco/h5>
          </div>
          <div class="widget-content nopadding">
            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/endereco/${acao}">
 
                             <div class="control-group">
                <label class="control-label">Endereco</label>
                <div class="controls">
                   <input id="id" class="span4 mask text" name="logradouro" type="text" value="${cliente.endereco.id}" placeholder="Digite o Id Logradouro"/>					
                  <input id="logradouro" class="span4 mask text" name="logradouro" type="text" value="${cliente.endereco.logradouro}" placeholder="Digite o Logradouro"/>					
                  <input id="numero" class="span1 mask text" name="numero" type="text" value="${cliente.endereco.numero}" placeholder="Nº"/>					
                  <input id="bairro" class="span3 mask text" name="bairro" type="text" value="${cliente.endereco.bairro}" placeholder="Digite o Bairro"/>					
                  <input id="cidade" class="span3 mask text" name="cidade" type="text" value="${cliente.endereco.cidade}" placeholder="Digite a Cidade"/>					
                   <input id="uf" class="span3 mask text" name="uf" type="text" value="${cliente.endereco.uf}" placeholder="Digite a UF"/>					
                 
               
                
                 </div>
                 
                 </div>
                 
                 
                 
                 
                 <div class="control-group">
		                <label class="control-label"></label>
				                <div class="controls">
				                   
				                   
				                   <input id="cep" class="span2 mask text" name="cep" type="text" value="${cliente.endereco.cep}" placeholder="Digite o Cep" onblur="pesquisacep(this.value);"/>					
				  			      <input id="pontoreferencia" class="span5 mask text" name="logradouro" type="text" value="${cliente.endereco.pontoreferencia}" placeholder="Digite o Ponto de Referencia"/>					
				                  <input id="complemento" class="span10 mask text" name="complemento" type="text" value="${cliente.endereco.complemento}" placeholder="Digite o Complemneto"/>					
				                  <input id="cliente" name="cliente" class="span2 m-wrap" type="text" value="${cliente.id}"/>
				                   <input id="ibge" name="ibge" class="span2 m-wrap" type="text" value=""/>
				             		                
		                	 </div>
		                 
                 </div>
            
                          
                          
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

