<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

 <div id="content">
 
  <div id="content-header">
    <div id="breadcrumb"> <a href="${pageContext.request.contextPath}/produto/movimentacao" title="Go to Produto" class="tip-bottom"><i class="icon-home"></i> Produto</a> <a href="#">Gerencia Produto </a> </div>
    <h1> Gerencia de Produtos</h1>
  </div>

            <div class="container-fluid">
            
    <c:if test="${erros != null }">
            <div class="alert alert-error alert-block"> <a class="close" data-dismiss="alert" href="#">ï¿½</a>
              <h4 class="alert-heading">Erros!</h4>
              
              ${erros}
            </div>
            
    </c:if>
    
      <c:if test="${mensagem != null }">
            <div class="alert alert-success alert-block"> <a class="close" data-dismiss="alert" href="#">ï¿½</a>
              <h4 class="alert-heading">Sucesso!</h4>
              
              ${mensagem}
            </div>
            
    </c:if>
<div class="row-fluid">
            
             	<div class="span8">

			<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="">
                                    <h4 class="title">Dados do Produto</h4>
                                    <p class="category">Informacoes Basicas</p>
                                </div>

 										<div class="form-group label-floating is-empty">
                              <label class="control-label">Ativo</label>
                                <input id="ativo" class="form-control pull-right" name="ativo" type="checkbox"
                                       checked="${produto.ativo}" disabled="true"/>
                                 <span class="material-input"></span>
                         </div>

                                       
									<div class="form-group label-floating is-empty">
                                                    <label class="control-label">Nome</label>
                                                    <input id="nome" class="form-control" name="nome"
                                                                            type="text"
                                                                            value="${produto.nome}"
                                                                            placeholder="Digite o Nome "/>

                                                <span class="material-input"></span>
                                    </div>
                                    
                                    
									<div class="form-group label-floating is-empty">
                                                    <label class="control-label">CodeBar</label>
                                                    <input id="nome" class="form-control" name="nome"
                                                                            type="text"
                                                                            value="${produto.codebar}"
                                                                            placeholder="Digite o CodeBar"/>

                                                <span class="material-input"></span>
                                    </div>	
                                    
                                    <div class="form-group label-floating is-empty">
                                                    <label class="control-label">Fornecedor</label>
                                                    <input id="nome" class="form-control" name="nome"
                                                                            type="text"
                                                                            value="${produto.fornecedor}"
                                                                            placeholder="Digite o Nome do Fornecedor"/>

                                                <span class="material-input"></span>
                                    </div>	
                                    
                                    <div class="form-group label-floating is-empty">
                                                    <label class="control-label">Preco Custo</label>
                                                    <input id="nome" class="form-control" name="nome"
                                                                            type="text"
                                                                            value="<fmt:formatNumber type="currency"
                															 value="${produto.precocusto}"/>"
                                                                            placeholder="Digite o Nome da produto"/>

                                                <span class="material-input"></span>
                                    </div>
                                    
                                    
                                    <div class="form-group label-floating is-empty">
                                                    <label class="control-label">Preco Venda</label>
                                                    <input id="nome" class="form-control" name="nome"
                                                                            type="text"
                                                                            value="<fmt:formatNumber type="currency"
                 															value="${produto.precovenda}"/>"
                                                                            placeholder="Digite o Nome da produto"/>

                                                <span class="material-input"></span>
                                    </div>		 


              
									
				
                </div>
              </div> 

                    <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="">
                                    <h4 class="title">Dados Gerenciais</h4>
                                    <p class="category">Informacoes Gerenciais</p>
                                </div>

									<div class="form-group label-floating is-empty">
                                          <label class="control-label">Margem de Lucro</label>
											 <input id="margem" name="margem" type="text" value="" placeholder="Margem de Lucro"
                                       disabled="true" class="form-control"/>
                               				  <span class="material-input"></span>
                                    </div>
                                    
                                    
									<div class="form-group label-floating is-empty">
                                          <label class="control-label">Lucro</label>
  										<input id="lucro" name="lucro" class="form-control" type="text" value=""
                                       		placeholder="Lucro total" disabled="true"/>
                               				  <span class="material-input"></span>
                                    </div> 
                                    
                                    
                                    <div class="form-group label-floating is-empty">
                                          <label class="control-label">Total de Pedidos</label>
  										<input id="pedidos" name="pedidos" class="form-control" type="text" value=""
                                       		placeholder="Pedidos total" disabled="true"/>
                               				  <span class="material-input"></span>
                                    </div>                                    




                    </div>
                    
                    </div>
                    
       <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">



                </div>

					<div class="span4">
					
                     
					
                            <div class="card card-profile">
                                <div class="card-avatar">
                                    <a href="#pablo">
                                        <img class="img" src="../resources/images/produto/vazio.jpg">
                                    </a>
                                    

                                </div>
                        <form action="LocalizarProdutoGerencia" method="POST" class="">


						<div class="form-group label-floating">
<!--                               <label class="control-label">produto</label> -->
                                <input type="text" list="${produtoList}" id="id"
                                       placeholder="Digite o Codigo do produto" name="id" autocomplete="off"
                                       class="form-control">
                                       
                                 <span class="material-input"></span>
                         </div>




                                <datalist id="${produtoList}">

                                    <c:forEach var="client" items="${produtoList}" varStatus="id">

                                        <option value="${client.id }"> ${client.nome } </option>

                                    </c:forEach>


                                </datalist>
                                    
                               <div class="form-group label-floating is-empty">
<!--                               <label class="control-label">produto</label> -->
                                   
                                   <button type="submit" formaction="LocalizarProdutoGerencia" class="btn btn-danger btn-round btn-lg">Localizar</button>

                                       
                                 <span class="material-input"></span>
                         		</div>
                                    
                                  </form>
                                  
                                <div class="content">
                                    
                                    <h4><p class="card-content text-gray">${produto.nome} ${produto.descricao}
                                     <p class="card-content pull-left">${produto.id} </p> </h4> </p>
<!--                                     <p class="card-content"> -->
<!--                                         Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is... -->
<!--                                     </p> -->
                                    
                                    
                                </div>
                            </div>
                        </div>

					</div>

					
        </div>
    </div>