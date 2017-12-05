<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ page session="true" %>


<div id="content">
    <div id="content-header">
		</br>
        <h2>Cadastro de Cliente</h2>
    </div>
    <div class="container-fluid">
        <hr>

        <c:if test="${erros != null }">
            <div class="alert alert-error alert-block">
                <a class="close" data-dismiss="alert" href="#">�</a>
                <h4 class="alert-heading">Erros!</h4>

                    ${erros}
            </div>

        </c:if>

        <c:if test="${mensagem != null }">
            <div class="alert alert-success alert-block">
                <a class="close" data-dismiss="alert" href="#">�</a>
                <h4 class="alert-heading">Sucesso!</h4>

                    ${mensagem}
            </div>

        </c:if>
        <div class="row-fluid">
            <div class="span12">
                        <div class="card">
                    <div class="card-content">
                       
                                <div class="card-header" data-background-color="blue">
                                
                                    <h4 class="title">Cadastro Cliente</h4>
                                    <p class="category">Insira os Dados</p>
<%--                                 <span class="icon "><a href="${pageContext.request.contextPath}/caixa/cadastro"><i --%>
<!--                                 class="icon-plus pull-right" color="blue"></i></a> </span> -->
                                </div>
                                
                                </br>
          <div class="widget-content">

						<form id="form" class="form-horizontal" method="post"
							action="${pageContext.request.contextPath}/cliente/${acao}" modelAttribute="cliente">
<!-- 							<div id="form-wizard-1" class="step"> -->
								<div class="control-group">

                                    <div class="controls">
                                        <div class="input-prepend">
                                            <span class="add-on"><i class="icon-key"></i></span>

                                            <input id="id" class="form-control" name="id" type="text"
                                                   value="${cliente.id}" placeholder="Digite o id"/>


                                        </div>

                                        <div class="input-prepend">
                                            <span class="add-on pull-left"><i class="icon-ok-sign"></i></span>
                                            <input id="ativo" name="ativo" class="" type="checkbox"
                                                   checked="${cliente.ativo}"/>
                                        </div>


                                    </div>
                                </div>


                                <!--                				<span class="help-block blue span3">(999) 999-9999</span> -->


                                <div class="control-group">
                                    <div class="controls">
                                        <div class="input-prepend">
                                            <span class="add-on"><i class="icon-picture"></i></span>

                                            <input type="text" id="foto" name="foto" class="form-control"
                                                   value="${cliente.foto}" placeholder="Digite o caminho da Foto">
                                        </div>
                                    </div>
                                </div>


                                <div class="control-group">
                                    <div class="controls">
                                        <div class="input-prepend">
                                            <span class="add-on"><i class="icon-user"></i></span> <input id="nome"
                                                                                                         class="form-control"
                                                                                                         name="nome"
                                                                                                         type="text"
                                                                                                         value="${cliente.nome}"
                                                                                                         placeholder="Digite o Nome da Cliente"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <div class="controls">
                                        <div class="input-prepend">
                                            <span class="add-on"><i class="icon-envelope"></i></span> <input
                                                id="mask-mail"
                                                class="form-control" name="email" type="text"
                                                value="${cliente.email}" placeholder="Digite o Email"/>
                                        </div>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <div class="controls">
                                        <div class="input-prepen">
                                            <span class="add-on"><i class="icon-question-sign"></i></span>

                                            <select id="genero" name="genero" class="form-control">
                                                <optgroup label="Genero do Cliente">
													
												  <option value="${cliente.genero }">${cliente.genero }</option>
                                                   <option value="MASCULINO">MASCULINO</option>
                                                    <option value="FEMININO">FEMININO</option>

                                                </optgroup>
                                            </select>

                                        </div>
                                        <!-- 										</div> -->
                                    </div>
                                </div>

                                <div class="control-group">
                                    <div class="controls">
                                        <div class="input-prepend">
                                            <span class="add-on"><i class="icon-phone"></i></span> <input
                                                id="mask-phone"
                                                class="form-control" name="telefone" type="text"
                                                value="${cliente.telefone}" placeholder="Digite o Telefone"/>
                                            <br>
                                        </div>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <div class="controls">
                                        <!-- 		                <div class="input-prepend"> <span class="add-on">Data Nascimento</span> -->
                                        <div data-date="12-02-2012"
                                             class="input-append date datepicker ">

                                            <input id="datanascimento" type="text" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${cliente.datanascimento}"/>" class="form-control" name="datanascimento">
<%--                                              --%>
                                            <span class="add-on"><i class="icon-th"></i></span>
                                            
                                            


                                        </div>
                                        
                                        
                                        
                                    </div>
                                </div>


<!--                             </div> -->


<!--                             <div id="form-wizard-2" class="step"> -->

<!--                                 <div class="control-group"> -->

<!--                                     <div class="controls"> -->


<!--                                         <div class="input-prepend"> -->
<!--                                             <span class="add-on">Id</span> <input id="id"  -->
<!--                                                                                   class="span11 mask text" name="id" -->
<!--                                                                                   type="number" -->
<%--                                                                                   value="${cliente.endereco.id}" --%>
<!--                                                                                   placeholder="Digite o Id"/> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                 </div> -->

<!--                                 <div class="control-group"> -->

<!--                                     <div class="controls"> -->

<!--                                         <div class="input-prepend"> -->
<!--                                             <span class="add-on">Logradouro</span> <input id="logradouro" -->
<!--                                                                                           class="" -->
<!--                                                                                           name="logradouro" type="text" -->
<%--                                                                                           value="${cliente.endereco.logradouro}" --%>
<!--                                                                                           placeholder="Digite o Logradouro"/> -->

<!--                                         </div> -->

<!--                                     </div> -->

<!--                                     <div class="control-group"> -->

<!--                                         <div class="controls"> -->

<!--                                             <div class="input-prepend"> -->
<!--                                                 <span class="add-on">N</span> <input id="numero" -->
<!--                                                                                       class="" -->
<!--                                                                                       name="numero" type="text" -->
<%--                                                                                       value="${cliente.endereco.numero}" --%>
<!--                                                                                       placeholder="Numero"/> -->

<!--                                             </div> -->

<!--                                         </div> -->

<!--                                     </div> -->

<!--                                     <div class="control-group"> -->

<!--                                         <div class="controls"> -->

<!--                                             <div class="input-prepend"> -->
<!--                                                 <span class="add-on">Bairro</span> -->
<!--                                                 <input id="bairro" -->
<!--                                                        class="span11 mask text" name="bairro" type="text" -->
<%--                                                        value="${cliente.endereco.bairro}" --%>
<!--                                                        placeholder="Digite o Bairro"/> -->

<!--                                             </div> -->

<!--                                         </div> -->

<!--                                     </div> -->


<!--                                     <div class="control-group"> -->

<!--                                         <div class="controls"> -->
<!--                                             <div class="input-prepend"> -->
<!--                                                 <span class="add-on">Cidade</span> -->
<!--                                                 <input id="cidade" class="span11 mask text" name="cidade" -->
<%--                                                        type="text" value="${cliente.endereco.cidade}" --%>
<!--                                                        placeholder="Digite a Cidade"/> -->

<!--                                             </div> -->

<!--                                         </div> -->
<!--                                     </div> -->


<!--                                     <div class="control-group"> -->

<!--                                         <div class="controls"> -->

<!--                                             <div class="input-prepend"> -->
<!--                                                 <span class="add-on">UF</span> -->
<!--                                                 <input id="uf" class="span11 mask text" name="uf" type="text" -->
<%--                                                        value="${cliente.endereco.uf}" placeholder="Digite a UF"/> --%>
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->


<!--                                     <div class="control-group"> -->

<!--                                         <div class="controls"> -->

<!--                                             <div class="input-prepend"> -->
<!--                                                 <span class="add-on">Cep</span> -->
<!--                                                 <input id="cep" class="span11 mask text" name="cep" -->
<%--                                                        type="text" value="${cliente.endereco.cep}" --%>
<!--                                                        placeholder="Digite o Cep" onblur="pesquisacep(this.value);"/> -->

<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->


<!--                                     <div class="control-group"> -->

<!--                                         <div class="controls"> -->

<!--                                             <div class="input-prepend"> -->
<!--                                                 <span class="add-on">P.Ref</span> -->
<!--                                                 <input id="pontoreferencia" class="" -->
<!--                                                        name="pontoreferencia" type="text" -->
<%--                                                        value="${cliente.endereco.pontoreferencia}" --%>
<!--                                                        placeholder="Digite o Ponto de Referencia"/> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->

<!--                                     <div class="control-group"> -->

<!--                                         <div class="controls"> -->

<!--                                             <div class="input-prepend"> -->
<!--                                                 <span class="add-on">Compl.</span> -->
<!--                                                 <input id="complemento" class="span11 mask text" -->
<!--                                                        name="complemento" type="text" -->
<%--                                                        value="${cliente.endereco.complemento}" --%>
<!--                                                        placeholder="Digite o Complemneto"/> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->

<!--                                     <div class="control-group"> -->

<!--                                         <div class="controls"> -->

<!--                                             <div class="input-prepend"> -->
<!--                                                 <span class="add-on">Ibge</span> -->
<!--                                                 <input id="ibge" name="ibge" -->
<!--                                                        class="span11 m-wrap" type="text" value=""/> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->

<!--                                     <div class="control-group"> -->

<!--                                         <div class="controls"> -->

<!--                                             <div class="input-prepend"> -->
<!--                                                 <span class="add-on">Cliente</span> -->
<!--                                                 <input id="cliente" name="cliente" -->
<%--                                                        class="span11 m-wrap" type="number" value="${cliente.endereco.cliente.id }"/> --%>
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->


<!--                                 </div> -->
<!--                             </div> -->

                            <div class="form-actions">
<!--                                 <input id="back" class="btn btn-primary" type="reset" -->
<!--                                        value="Voltar"/> <input id="next" class="btn btn-primary" -->
<!--                                                                type="submit" value="SALVAR"/> -->
<!--                                 <div id="status"></div> --> 

                <input type="submit" value="${acao}" class="btn btn-success">

                            </div>
<!--                             <div id="submitted"></div> -->

                        </form>

                    </div>
                </div>


            </div>


        </div>
    </div>
</div>

</div>


