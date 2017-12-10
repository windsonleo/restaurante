<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>



<div id="content">
  <div id="content-header">
	</br>
    <h2>Cadastro de Caixa</h2>
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
       
        <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Cadastro Caixa</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">
            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/caixa/${acao}" name="basic_validate" id="basic_validate" novalidate="novalidate">
              
               <div class="control-group">
                <label class="control-label">Ativo?</label>
                <div class="controls">
						<input id="ativo" name="ativo" class="" type="checkbox" checked="${caixa.ativo}"/>
                </div>
              </div>
              
              
              <div class="control-group">
                <label class="control-label">Id</label>
                <div class="controls">
						<input id="id" class="form-control" name="id" type="text" value="${caixa.id}" placeholder="Digite o id" />
                </div>
              </div>
              <div class="control-group">
                <label class="control-label">Nome</label>
                <div class="controls">
						<input id="nome" class="form-control" name="nome" type="text" value="${caixa.nome}" placeholder="Digite o Nome da Caixa"/>
                </div>
              </div>

<!--               <div class="control-group"> -->
<!--                 <label class="control-label">URL (Start with http://)</label> -->
<!--                 <div class="controls"> -->
<!--                   <input type="text" name="url" id="url"> -->
<!--                 </div> -->
<!--               </div> -->
              <div class="form-actions">
                <input type="submit" value="${acao}" class="btn btn-success">
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
<!--     <div class="row-fluid"> -->
<!--       <div class="span12"> -->
<!--         <div class="widget-box"> -->
<!--           <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span> -->
<!--             <h5>Numeric validation</h5> -->
<!--           </div> -->
<!--           <div class="widget-content nopadding"> -->
<!--             <form class="form-horizontal" method="post" action="#" name="number_validate" id="number_validate" novalidate="novalidate"> -->
<!--               <div class="control-group"> -->
<!--                 <label class="control-label">Minimal Salary</label> -->
<!--                 <div class="controls"> -->
<!--                   <input type="text" name="min" id="min" /> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="control-group"> -->
<!--                 <label class="control-label">Maximum Salary</label> -->
<!--                 <div class="controls"> -->
<!--                   <input type="text" name="max" id="max" /> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="control-group"> -->
<!--                 <label class="control-label">Only digit</label> -->
<!--                 <div class="controls"> -->
<!--                   <input type="text" name="number" id="number" /> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="form-actions"> -->
<!--                 <input type="submit" value="Validate" class="btn btn-success"> -->
<!--               </div> -->
<!--             </form> -->
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--       <div class="row-fluid"> -->
<!--         <div class="span12"> -->
<!--           <div class="widget-box"> -->
<!--             <div class="widget-title"> <span class="icon"> <i class="icon-info-sign"></i> </span> -->
<!--               <h5>Security validation</h5> -->
<!--             </div> -->
<!--             <div class="widget-content nopadding"> -->
<!--               <form class="form-horizontal" method="post" action="#" name="password_validate" id="password_validate" novalidate="novalidate"> -->
<!--                 <div class="control-group"> -->
<!--                   <label class="control-label">Password</label> -->
<!--                   <div class="controls"> -->
<!--                     <input type="password" name="pwd" id="pwd" /> -->
<!--                   </div> -->
<!--                 </div> -->
<!--                 <div class="control-group"> -->
<!--                   <label class="control-label">Confirm password</label> -->
<!--                   <div class="controls"> -->
<!--                     <input type="password" name="pwd2" id="pwd2" /> -->
<!--                   </div> -->
<!--                 </div> -->
<!--                 <div class="form-actions"> -->
<!--                   <input type="submit" value="Validate" class="btn btn-success"> -->
<!--                 </div> -->
<!--               </form> -->
            </div>
          </div>
      
</div>


