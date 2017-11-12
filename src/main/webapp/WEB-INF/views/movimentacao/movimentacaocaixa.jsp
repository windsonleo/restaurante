<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>





<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Caixa" class="tip-bottom"><i class="icon-money" ></i> Caixa</a> <a href="#" class="current">Movimentação de Caixa</a> </div>
    <h1>Listagem e Visão Geral</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
   <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i ><img src="${pageContext.request.contextPath}/resources/images/icons/16/financeiro.png" ></i></span>
            <h5>Movimentação Caixa</h5>
          
                     <div class="widget-titlee"> <span class="icon"><a href="${pageContext.request.contextPath}/caixa/cadastro"><i class="icon-plus" color="blue"></i></a> </span>
         
            </div>
          </div>
          
          
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">

              <thead>
                                    <tr>
                                        <th>Id</th>
									    <th>Nome</th>
<!-- 									    <th>Telefone</th> -->
<!-- 									    <th>Email</th> -->
<!-- 									    <th>Data Nasciemnto</th> -->
<!-- 									     <th>Genero</th> -->
<!-- 									     <th>Preferencia</th> -->
									     <th>Ativo</th>
<!-- 									     <th>Obs</th> -->
									    <th>Ação</th>
                                    </tr>
                                </thead>
              <tbody>
              
           		<c:forEach var="caixa" items="${caixaList}" varStatus="id">
              
                <tr class="gradeX">
                    <td>${caixa.id}</td>
                  <td>${caixa.nome}</td>
<%--                   <td ><input type="tel" value="${caixa.telefone}"></td> --%>
<%--                   <td><input type="email" value="${caixa.email}"></td> --%>
<%--                    <td>${caixa.datanascimento}</td> --%>
<%--                    <td>${caixa.genero}</td> --%>
<%--                    <td>${caixa.preferencia}</td> --%>
                   <td> <span class="label label bg_lb">${caixa.ativo}</span></td>
<%--                    <td> ${caixa.obs}</td> --%>
                 <td class="options-widt">
								
								
								<a
									href="${pageContext.request.contextPath}/caixa/editar?id=${caixa.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
																	<a
									href="${pageContext.request.contextPath}/caixa/fecharcaixa?id=${caixa.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/caixa/informacoes?id=${caixa.id}"
									title="Informações" ><i class="icon-info-sign"></i></a>
									
									
	<a href="#myAlert${caixa.id}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a>
									
			<div id="myAlert${caixa.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>Alerta de Exclusão</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/caixa/delete?id=${caixa.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>									
									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/caixa/delete?id=${caixa.id}" --%>
<!-- 									title="deletar" class="fa fa-remove fa-2x" ><i class="icon-minus-sign"></i> </a> -->
									
									
									
									
									
										
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
        
<!--         <div class="pagination alternate"> </div> -->
        
        
        </div>
        
        <div class="row-fluid">
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Soluções em Tecnologia</a> </div>
</div>




