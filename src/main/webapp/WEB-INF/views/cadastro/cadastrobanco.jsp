<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>




<div id="content">
  <div id="content-header">
    
<%--     <c:if test="${mensagem}"> --%>
<!--     	<div class="alert alert-success" > -->
<%--     	${mensagem} --%>
<!--     	</div> -->
    	
<%--     	</c:if> --%>

<%--     <c:if test="${erros != null}"> --%>
<!-- 		<div class="alert alert-danger" > -->
<%-- 		<span>${erros}</span> --%>
<!-- 		</div> -->
		
<%-- 		</c:if> --%>

  
    
    </br>
     </br>
<!--     <h2>Cadastro de Banco</h2> -->

    
  </div>
  <div class="container-fluid"><hr>
  
           <c:if test="${erros != null }">
</br>
			<div class="alert alert-danger">
				<div class="container-fluid">
					<div class="alert-icon">
						<i class="material-icons">error_outline</i>
					</div>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true"><i class="material-icons">clear</i></span>
					</button>
					<b>Error:</b> ${erros}
				</div>
			</div>


		</c:if>
    
    
    
    

    
      <c:if test="${mensagem != null }">
      </br>
			<div class="alert alert-success">
				<div class="container-fluid">
					<div class="alert-icon">
						<i class="material-icons">check</i>
					</div>
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true"><i class="material-icons">clear</i></span>
					</button>
					<b>Sucesso:</b> ${mensagem}
				</div>
			</div>

		</c:if>
		
        <hr>
               
               
    <div class="row-fluid">
      <div class="span12">
			<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Cadastro Banco</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/banco/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          
          
          
          <div class="">
           
           
            <form class="form-horizonta" method="post" action="${pageContext.request.contextPath}/banco/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">

						
<!-- 				<div class="row-fluid"> -->
<!--                     <div class="col-lg-12"> -->
<!--                         <div class="alert alert-info alert-dismissable"> -->
<!--                             <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> -->
<%--                             <i class="fa fa-info-circle"></i><strong><label>${mensagem} ${erros}</label></strong> --%>
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div>		 -->
                
                
    


			<div class="checkbox">
                <label>
				<input id="ativo" name="optionsCheckboxes"  type="checkbox" checked="${banco.ativo}" class="checkbox"/>Ativo?
				</label>
              </div>
              
             <div class="form-group label-floating  ">
	
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control"  name="id" type="text" value="${banco.id}" placeholder=""/>
                </div>
              </div>
              
              </div>
              
              <div class="form-group label-floating  ">
              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
                <form:errors path="banco.nome" cssStyle="color:red"/>
                  <input type="text" name="nome" id="nome" placeholder="" value="${banco.nome}" class="form-control">
                </div>
              </div>
              </div>


			<div class="form-group label-floating  ">
              <div class="control-group">
                <label class="control-label">Numero</label>
                <div class="controls">
						<input id="numero" class="form-control" name="numero" type="text" value="${banco.numero}" placeholder=""/>					
                </div>
              </div>
              </div>
              
              <div class="form-group label-floating  ">
              <div class="form-actions">
                <input type="submit" value="${acao}" class="btn btn-success">
              </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

            </div>
            </div>
         
      </div>

