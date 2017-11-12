<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Empresa</a> >> <a href="#" class="current">Movimenta��o de Empresa</a> </div>
    <h1>Listagem e Vis�o Geral</h1>
  </div>
  <div class="container-fluid">
    <hr>
    <div class="row-fluid">
      <div class="span12">
      
   <div class="widget-box">
          <div class="widget-title"> <span class="icon"><i class="icon-th"></i></span>
            <h5>Movimenta��o Empresa</h5>
          
                     <div class="widget-title"> <span class="icon"><a href="${pageContext.request.contextPath}/empresa/cadastro"><i class="icon-plus" color="blue"></i></a> </span>
         
            </div>
          </div>
          
          
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">

              <thead>
                <tr>
                  
                                        <th>Id</th>
									    <th>Nome</th>
									    <th>Foto</th>
									    <th>Ativo?</th>
<!-- 									    <th>Data Nasciemnto</th> -->
<!-- 									     <th>Genero</th> -->
<!-- 									     <th>Preferencia</th> -->
<!-- 									     <th>Ativo</th> -->
<!-- 									     <th>Obs</th> -->
									    <th>A��o</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                
                                <c:forEach var="empresa" items="${empresaList}" varStatus="id">

		<c:choose>
		
		  <c:when test="${empresa.id != null}">
  
  <tr class="gradeX">

			      <td>${empresa.id}</td>
                  <td>${empresa.nome}</td>
                  <td ><input type="text" value="${empresa.logo}"></td>
                  <td><span class="label label bg_lb">${empresa.ativo}</span></td>
                 <td class="options-width">
								
								
								<a
									href="${pageContext.request.contextPath}/empresa/editar?id=${empresa.id}"
									title="Editar"><i class="icon-edit"></i> </a>
									
										<a
									href="${pageContext.request.contextPath}/empresa/informacoes?id=${empresa.id}"
									title="Informa��es" ><i class="icon-info-sign"></i></a>
									


	<a href="#myAlert${empresa.id}" data-toggle="modal" class="fa fa-remove"><i class="icon-remove-sign"></i></a>
									
			<div id="myAlert${empresa.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">�</button>
                <h3>Alerta de Exclus�o</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Excluir esse Registro</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/empresa/delete?id=${empresa.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>	



									
<!-- 									 <a -->
<%-- 									href="${pageContext.request.contextPath}/empresa/delete?id=${empresa.id}" --%>
<!-- 									title="deletar" class="fa fa-remove fa-2x" ><i class="icon-minus-sign"></i> </a> -->
									
									
									
									
									
										
					</td>
                  
                  
                </tr>
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
        
<!--         <div class="pagination alternate"> </div> -->
        
        
        </div>
        
        <div class="row-fluid">
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Solu��es em Tecnologia</a> </div>
</div>
        