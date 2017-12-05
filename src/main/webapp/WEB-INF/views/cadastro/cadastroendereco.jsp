<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>


<div id="content">
  <div id="content-header">
	</br>
    <h2>Cadastro de Endereco :  ${cliente.nome }</h2>
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
                                
                                    <h4 class="title">Cadastro Endereco</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
                                
          <div class="widget-content">
            <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/cliente/addEndereco?id=${cliente.id}">
 
                                              <div class="control-group">

                                    <div class="controls">


                                        <div class="input-prepend">
                                            <span class="add-on">Id</span> <input id="id" 
                                                                                  class="form-control" name="id"
                                                                                  type="number"
                                                                                  value="${endereco.id}"
                                                                                  placeholder="Digite o Id"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="control-group">

                                    <div class="controls">

                                        <div class="input-prepend">
                                            <span class="add-on">Logradouro</span> <input id="logradouro"
                                                                                          class="form-control"
                                                                                          name="logradouro" type="text"
                                                                                          value="${endereco.logradouro}"
                                                                                          placeholder="Digite o Logradouro"/>

                                        </div>

                                    </div>

                                    <div class="control-group">

                                        <div class="controls">

                                            <div class="input-prepend">
                                                <span class="add-on">N</span> <input id="numero"
                                                                                      class="form-control"
                                                                                      name="numero" type="text"
                                                                                      value="${endereco.numero}"
                                                                                      placeholder="Numero"/>

                                            </div>

                                        </div>

                                    </div>

                                    <div class="control-group">

                                        <div class="controls">

                                            <div class="input-prepend">
                                                <span class="add-on">Bairro</span>
                                                <input id="bairro"
                                                       class="form-control" name="bairro" type="text"
                                                       value="${endereco.bairro}"
                                                       placeholder="Digite o Bairro"/>

                                            </div>

                                        </div>

                                    </div>


                                    <div class="control-group">

                                        <div class="controls">
                                            <div class="input-prepend">
                                                <span class="add-on">Cidade</span>
                                                <input id="cidade" class="form-control" name="cidade"
                                                       type="text" value="${endereco.cidade}"
                                                       placeholder="Digite a Cidade"/>

                                            </div>

                                        </div>
                                    </div>


                                    <div class="control-group">

                                        <div class="controls">

                                            <div class="input-prepend">
                                                <span class="add-on">UF</span>
                                                <input id="uf" class="form-control" name="uf" type="text"
                                                       value="${endereco.uf}" placeholder="Digite a UF"/>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="control-group">

                                        <div class="controls">

                                            <div class="input-prepend">
                                                <span class="add-on">Cep</span>
                                                <input id="cep" class="form-control" name="cep"
                                                       type="text" value="${endereco.cep}"
                                                       placeholder="Digite o Cep" onblur="pesquisacep(this.value);"/>

                                            </div>
                                        </div>
                                    </div>


                                    <div class="control-group">

                                        <div class="controls">

                                            <div class="input-prepend">
                                                <span class="add-on">P.Ref</span>
                                                <input id="pontoreferencia" class="form-control"
                                                       name="pontoreferencia" type="text"
                                                       value="${endereco.pontoreferencia}"
                                                       placeholder="Digite o Ponto de Referencia"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="control-group">

                                        <div class="controls">

                                            <div class="input-prepend">
                                                <span class="add-on">Compl.</span>
                                                <input id="complemento" class="form-control"
                                                       name="complemento" type="text"
                                                       value="${endereco.complemento}"
                                                       placeholder="Digite o Complemneto"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="control-group">

                                        <div class="controls">

                                            <div class="input-prepend">
                                                <span class="add-on">Ibge</span>
                                                <input id="ibge" name="ibge"
                                                       class="form-control" type="text" value=""/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="control-group">

                                        <div class="controls">

                                            <div class="input-prepend">
                                                <span class="add-on">Cliente</span>
                                                <input id="cliente" name="cliente"
                                                       class="form-control" type="text" value="${cliente.id }"/>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                                
                                
                                             <div class="form-actions">
                <input type="submit" value="${acao}" class="btn btn-success">
              </div>
            </form>
                                
                            </div>

                          
                          
 
          </div>
        </div>
      </div>
    </div>
            </div>
          </div>



