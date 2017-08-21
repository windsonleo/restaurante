<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Produto</a> >> <a href="#" class="current">Movimentação de Produto</a> </div>
    <h1>Listagem e Visão Geral</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
   <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Movimentação Produto</h5>
          
                     <div class="widget-title"> <span class="icon"><a href="${pageContext.request.contextPath}/produto/cadastro"><i class="icon-plus" color="blue"></i></a> </span>
         
            </div>
          </div>
          
          
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
               <tr>
                                        <th>Id</th>
   									    <th>Codebar</th>
   									   <th>Nome</th>
   									    
   									    <th>Descrição</th>
									    <th>Preço Venda</th>
									    <th>Fornecedor</th>
									    <th>Ativo?</th>
<!-- 									     <th>Genero</th> -->
<!-- 									     <th>Preferencia</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>Ação</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="produto" items="${produtoList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${produto.id != null}">
  
  <tr class="gradeX">

			      <td>${produto.id}</td>
                  <td>${produto.codebar}</td>
                    <td>${produto.nome}</td>
                  <td>${produto.descricao}</td>
                  <td>${produto.precovenda}</td>
                   <td>${produto.fornecedor}</td>
                   <td><span class="label label bg_lb">${produto.isativo}</span></td>
                 <td class="options-widt">
								
								
								<a
									href="${pageContext.request.contextPath}/produto/editar?id=${produto.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/produto/informacoes?id=${produto.id}"
									title="Informações" ><i class="icon-info-sign"></i></a>
									
									
									 <a
									href="${pageContext.request.contextPath}/produto/delete?id=${produto.id}"
									title="deletar" class="fa fa-remove fa-2x" ><i class="icon-minus-sign"></i> </a>
									
									
									
									
									
										
					</td>
                  
                  
                </tr>
                
                </c:when>
                </c:choose>
                
                </c:forEach>

              </tbody>
            </table>
          </div>
        </div>
        </div>
        </div>
        </div>
                
        
        </div>
        
        <div class="row-fluid">
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Soluções em Tecnologia</a> </div>
</div>
        