<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Cliente</a>>> <a href="#">Movimentação Cliente</a> >><a href="#" class="current">Cadastro Cliente</a> </div>
    <h1>Cadastro de Cliente</h1>
  </div>
  <div class="container-fluid"><hr>
    <div class="row-fluid">
      <div class="span12">
        <div class="widget-box">
          <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span>
            <h5>Cadastro de Cliente</h5>
          </div>
          <div class="widget-content nopadding">
            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/cliente/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">
              
               <div class="control-group">
                <label class="control-label">Ativo?</label>
                <div class="controls">
						<input id="isativo" name="isativo" class="form-control" type="checkbox" checked="${cliente.isativo}"/>
                </div>
              </div>
              
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${cliente.id}" placeholder="Digite o id" />
                </div>
              </div>
              
                <div class="control-group">
                <label class="control-label">Foto</label>
                <div class="controls">
             <input id="foto" class="form-control" name="foto" type="image" value="${cliente.foto}" placeholder="Digite o Foto"/>					
                </div>
              </div>                
              
              
              
              
              
              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						<input id="nome" class="form-control" name="nome" type="text" value="${cliente.nome}" placeholder="Digite o Nome da Cliente"/>
                </div>
              </div>

              <div class="control-group">
                <label class="control-label">Genero</label>
                <div class="controls">
                    
                 <select id="genero" name="genero" id="genero" class="form-control">           
	                <optgroup label="Genero do Usuario">
	           			
	           				<option value="MASCULINO">MASCULINO</option>
	           				<option value="FEMININO">FEMININO</option>
	           				      				
	                </optgroup>
	            </select>
	                    
	                                        
                </div>
              </div>
              
              
              
            <div class="control-group">
                <label class="control-label">Telefone</label>
                <div class="controls">
             <input id="telefone" class="form-control" name="telefone" type="text" value="${cliente.telefone}" placeholder="Digite o Telefone"/>					
                </div>
              </div>

            <div class="control-group">
                <label class="control-label">Email</label>
                <div class="controls">
             <input id="email" class="form-control" name="email" type="text" value="${cliente.email}" placeholder="Digite o Email"/>					
                </div>
              </div>              
              
            <div class="control-group">
                <label class="control-label">Data de Nascimento</label>
                <div class="controls">
             <input id="datanascimento" class="form-control" name="datanascimento" type="date" value="${cliente.datanascimento}" placeholder="Digite o Data de Nascimento"/>					
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

