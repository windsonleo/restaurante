<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

 <div id="content">
 
  <div id="content-header">
</br>
    <h2> Gerencia de Garcons</h2>
  </div>

            <div class="container-fluid">
            
    <c:if test="${erros != null }">
            <div class="alert alert-error alert-block"> <a class="close" data-dismiss="alert" href="#">X</a>
              <h4 class="alert-heading">Erros!</h4>
              
              ${erros}
            </div>
            
    </c:if>
    
      <c:if test="${mensagem != null }">
            <div class="alert alert-success alert-block"> <a class="close" data-dismiss="alert" href="#">X</a>
              <h4 class="alert-heading">Sucesso!</h4>
              
              ${mensagem}
            </div>
            
    </c:if>
<div class="row-fluid">
            
             	<div class="span8">
            



			<div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="">
                                    <h4 class="title">Dados do Garcon</h4>
                                    <p class="category">Informacoes Pessoais</p>
                                </div>
                       

						<div class="form-group label-floating is-empty">
                              <label class="control-label">Ativo</label>
                                <input id="ativo" class="form-control pull-right" name="ativo" type="checkbox"
                                       checked="${garcon.ativo}" disabled="true"/>
                                 <span class="material-input"></span>
                         </div>

                                       
									<div class="form-group label-floating is-empty">
                                                    <label class="control-label">Nome</label>
                                                    <input id="nome" class="form-control" name="nome"
                                                                            type="text"
                                                                            value="${garcon.nome}"
                                                                            placeholder=""/>

                                                <span class="material-input"></span>
                                    </div>



									<div class="form-group label-floating is-empty">
                                                    <label class="control-label">Foto</label>
															<input id="mask-mail" class="form-control" name="foto"
                                                                             type="text"
                                                                             value="${garcon.foto}"
                                                                             placeholder=""/>                                                <span class="material-input"></span>
                                    </div>



									<div class="form-group label-floating is-empty">
                                          <label class="control-label">Pedidos</label>
											  <select id="pedidos"name="pedidos" multiple="multiple" class="form-control" >
	                                  <optgroup label="">
		           				
		           					<option value="${garcon.pedidos}" selected="selected" >${garcon.pedidos}</option>
		           				
		           				
		 
		                </optgroup>
	                    </select>			
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
											 <input id="margem" name="margem" type="text" value="" placeholder=""
                                       disabled="true" class="form-control"/>
                               				  <span class="material-input"></span>
                                    </div>
                                    
                                    
									<div class="form-group label-floating is-empty">
                                          <label class="control-label">Lucro</label>
  										<input id="lucro" name="lucro" class="form-control" type="text" value=""
                                       		placeholder="" disabled="true"/>
                               				  <span class="material-input"></span>
                                    </div> 
                                    
                                    
                                    <div class="form-group label-floating is-empty">
                                          <label class="control-label">Total de Pedidos Compra</label>
  										<input id="pedidos" name="pedidos" class="form-control" type="text" value=""
                                       		placeholder="" disabled="true"/>
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
                                        <img class="img" src="../resources/images/garcon/${garcon.foto}.jpg">
                                    </a>
                                    

                                </div>
                        <form action="LocalizarGarconGerencia" method="POST" class="">


						<div class="form-group label-floating">
<!--                               <label class="control-label">garcon</label> -->
                                <input type="text" list="${garconsList}" id="id"
                                       placeholder="Digite o Codigo do garcon" name="id" autocomplete="off"
                                       class="form-control">
                                       
                                 <span class="material-input"></span>
                         </div>




                                <datalist id="${garconsList}">

                                    <c:forEach var="client" items="${garconsList}" varStatus="id">

                                        <option value="${client.id }"> ${client.nome } </option>

                                    </c:forEach>


                                </datalist>
                                    
                               <div class="form-group label-floating is-empty">
<!--                               <label class="control-label">garcon</label> -->
                                   
                                   <button type="submit" formaction="LocalizarGarconGerencia" class="btn btn-danger btn-round btn-lg">Localizar</button>

                                       
                                 <span class="material-input"></span>
                         		</div>
                                    
                                  </form>
                                  
                                <div class="content">
                                    
                                    <h4><p class="card-content text-gray">${garcon.nome}
                                     <p class="card-content pull-left">${garcon.id} </p> </h4> </p>
<!--                                     <p class="card-content"> -->
<!--                                         Don't be scared of the truth because we need to restart the human foundation in truth And I love you like Kanye loves Kanye I love Rick Owens’ bed design but the back is... -->
<!--                                     </p> -->
                                    
                                    
                                </div>
                            </div>
                        </div>

					</div>

					
        </div>
    </div>
