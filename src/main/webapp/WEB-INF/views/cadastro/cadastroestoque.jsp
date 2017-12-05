<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
  <div id="content-header">
	</br>
    <h2>Cadastro de Estoque</h2>
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
                                
                                    <h4 class="title">Cadastro Estoque</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">
            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/estoque/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">
              
               <div class="control-group">
                <label class="control-label">Ativo?</label>
                <div class="controls">
                </div>
              </div>
              
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${estoque.id}" placeholder="Digite o id" />
               			<input id="ativo" name="ativo" class="form-control" type="checkbox" checked="${estoque.ativo}"/>
               
                </div>
              </div>
              
<!--                 <div class="control-group"> -->
<!--                 <label class="control-label">Logo</label> -->
<!--                 <div class="controls"> -->
<%--              <input id="foto" class="form-control" name="foto" type="image" value="${estoque.logo}" placeholder="Digite o Foto"/>					 --%>
<!--                 </div> -->
<!--               </div>                 -->
              
              
              
              
              
              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						<input id="nome" class="form-control" name="nome" type="text" value="${estoque.nome}" placeholder="Digite o Nome da Estoque"/>
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
              
              
              
<!--             <div class="control-group"> -->
<!--                 <label class="control-label">Telefone</label> -->
<!--                 <div class="controls"> -->
<%--              <input id="telefone" class="form-control" name="telefone" type="text" value="${estoque.telefone}" placeholder="Digite o Telefone"/>					 --%>
<!--                 </div> -->
<!--               </div> -->

<!--             <div class="control-group"> -->
<!--                 <label class="control-label">Email</label> -->
<!--                 <div class="controls"> -->
<%--              <input id="telefone" class="form-control" name="telefone" type="text" value="${estoque.telefone}" placeholder="Digite o Telefone"/>					 --%>
<!--                 </div> -->
<!--               </div>               -->
              
<!--             <div class="control-group"> -->
<!--                 <label class="control-label">Data de Nascimento</label> -->
<!--                 <div class="controls"> -->
<%--              <input id="telefone" class="form-control" name="datanascimento" type="date" value="${estoque.telefone}" placeholder="Digite o Telefone"/>					 --%>
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

</div>
