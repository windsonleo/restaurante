<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/cliente/movimentacao" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Cliente</a>>> <a href="#">Movimentação Cliente</a> >><a href="#" class="current">Cadastro Cliente</a> </div>
    <h1>Cadastro de Cliente</h1>
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
            <h5>Cadastro de Cliente</h5>
          </div>
          <div class="widget-content nopadding">
            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/cliente/${acao}">
         
              
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="span2 m-wrap" name="id" type="text" value="${cliente.id}" placeholder="Digite o id" />
               			<input id="isativo" name="isativo" class="span2 m-wrap" type="checkbox" checked="${cliente.isativo}"/>
               			<input id="endereco" name="endereco" class="span2 m-wrap" type="text" checked="${cliente.endereco}"  placeholder="Digite o id do endereco"/>

<!-- 						<span class="help-block span4">Ativo?</span>                -->
                </div>
              </div>
              
                   <div class="control-group">
              <label class="control-label">Foto</label>
              <div class="controls">
             <input id="foto" class="span4 m-wrap" name="foto" type="text" value="${cliente.foto}" placeholder="Digite o Foto"/>					
              </div>
            </div>
                         

              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						<input id="nome" class="span6 m-wrap" name="nome" type="text" value="${cliente.nome}" placeholder="Digite o Nome da Cliente"/>
		               
		               <select id="genero" name="genero" id="genero" class="span3 m-wrap">           
			                <optgroup label="Genero do Cliente">
			           			
			           				<option value="MASCULINO">MASCULINO</option>
			           				<option value="FEMININO">FEMININO</option>
			           				      				
			                </optgroup>
			            </select>
               
                </div>
              </div>
              
              
              
            <div class="control-group">
                <label class="control-label">Telefone</label>
                <div class="controls">
             <input id="mask-phone" class="span6 mask text" name="telefone" type="text" value="${cliente.telefone}" placeholder="Digite o Telefone"/>					
               <span class="help-block blue span8">(999) 999-9999</span>
               
           <input id="mask-date"type="text" data-date="01-02-2013" data-date-format="dd-mm-yyyy" value="${cliente.datanascimento}" class="datepicker span3" name="datanascimento" placeholder="Digite a Data de NAscimento">
               
               
                </div>
              </div>

            <div class="control-group">
                <label class="control-label">Email</label>
                <div class="controls">
                  <input id="mask-mail" class="span6 mask text" name="email" type="text" value="${cliente.email}" placeholder="Digite o Email"/>					
               <span class="help-block">xxx@dominio.com</span>
               
               
                
                 </div>
                 
                 </div>
                 
                 
                             <div class="form-actions">
                <input type="submit" value="Inserir" class="btn btn-success">
              </div>
                 
                 
                 </form>
                 </div>
                 </div>
                             
                  <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Cadastro Endereco</h5>
          </div>
          <div class="widget-content nopadding">
            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/endereco/${acao}">
 
                             <div class="control-group">
                <label class="control-label">Endereco</label>
                <div class="controls">
                   <input id="id" class="span4 mask text" name="logradouro" type="text" value="${endereco.id}" placeholder="Digite o Id Logradouro"/>					
                  <input id="logradouro" class="span4 mask text" name="logradouro" type="text" value="${endereco.logradouro}" placeholder="Digite o Logradouro"/>					
                  <input id="numero" class="span1 mask text" name="numero" type="text" value="${endereco.numero}" placeholder="Nº"/>					
                  <input id="bairro" class="span3 mask text" name="bairro" type="text" value="${endereco.bairro}" placeholder="Digite o Bairro"/>					
                  <input id="cidade" class="span3 mask text" name="cidade" type="text" value="${endereco.cidade}" placeholder="Digite a Cidade"/>					
                   <input id="uf" class="span3 mask text" name="uf" type="text" value="${endereco.uf}" placeholder="Digite a UF"/>					
                 
               
                
                 </div>
                 
                 </div>
                 
                 
                 
                 
                 <div class="control-group">
		                <label class="control-label"></label>
				                <div class="controls">
				                   
				                   
				                   <input id="cep" class="span2 mask text" name="cep" type="text" value="${endereco.cep}" placeholder="Digite o Cep" onblur="pesquisacep(this.value);"/>					
				  			      <input id="pontoreferencia" class="span5 mask text" name="logradouro" type="text" value="${endereco.pontoreferencia}" placeholder="Digite o Ponto de Referencia"/>					
				                  <input id="complemento" class="span10 mask text" name="complemento" type="text" value="${endereco.complemento}" placeholder="Digite o Complemneto"/>					
				                  <input id="cliente" name="cliente" class="span2 m-wrap" type="text" value="${entity}"/>
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

