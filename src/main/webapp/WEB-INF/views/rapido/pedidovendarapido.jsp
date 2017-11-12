<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<div id="content">
	<div id="content-header">
		<div id="breadcrumb">
			<a href="${pageContext.request.contextPath}/pedidovenda/movimentacao"
				title="Go to Pedido Venda" class="tip-bottom"><i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/16/cliente.png" /></i>
				Pedido Venda</a> <a href="#">Movimenta��o Pedido Venda</a> <a href="#"
				class="current">Pedido Venda R�pido</a>
		</div>
<!-- 		<h1>Pedido Venda R�pido</h1> -->
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
				<div class="widget-box">
					<div class="widget-title">
						<span class="icon"> <i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/16/cliente.png" /></i>
						</span>
						<h5>Pedido Venda R�pido</h5>
					</div>
					<div class="widget-content nopadding">


						<form id="form-wizard" class="form-horizontal" method="post"
							action="${pageContext.request.contextPath}/cliente/addEnderecoCliente">
							<div id="form-wizard-1" class="step">
								<div class="control-group">
									                  <label class="control-label">Id</label>
									<div class="controls">

										<input id="id" class="span2 m-wrap" name="id" type="text"
											value="${cliente.id}" placeholder="Digite o id" /> 
											
 										<label
											class="span1"> <input id="ativo" name="ativo"
											class="span1 m-wrap" type="checkbox"
											checked="${cliente.ativo}" /> Ativo?
										</label>

									</div>
								</div>






								<!--                				<span class="help-block blue span3">(999) 999-9999</span> -->


								<div class="control-group">
									<div class="controls">
										<div class="input-prepend">
											<span class="add-on">Foto</span>

												<input type="text" id="foto" name="foto" class="" value="${cliente.foto}">
										</div>
									</div>
								</div>
								
								
								<div class="control-group">
									<div class="controls">
										<div class="input-prepend">
											<span class="add-on">Nome</span> <input id="nome"
												class="span11 m-wrap" name="nome" type="text"
												value="${cliente.nome}"
												placeholder="Digite o Nome da Cliente" />
										</div>
									</div>
								</div>

								<div class="control-group">
									<div class="controls">
										<div class="input-prepend">
											<span class="add-on">Email</span> <input id="mask-mail"
												class="span11 mask text" name="email" type="text"
												value="${cliente.email}" placeholder="Digite o Email" />
										</div>
									</div>
								</div>

								<div class="control-group">
									<div class="controls">
<!-- 										<div class="input-prepend"> -->

											<select id="genero" name="genero" class="span4">
												<optgroup label="Genero do Cliente">

													<option value="MASCULINO">MASCULINO</option>
													<option value="FEMININO">FEMININO</option>

												</optgroup>
											</select>
<!-- 										</div> -->
									</div>
								</div>

								<div class="control-group">
									<div class="controls">
										<div class="input-prepend">
											<span class="add-on">Telefone</span> <input id="mask-phone"
												class="span11 mask text" name="telefone" type="text"
												value="${cliente.telefone}" placeholder="Digite o Telefone" />
											<br>
										</div>
									</div>
								</div>

								<div class="control-group">
									<div class="controls">
										<!-- 		                <div class="input-prepend"> <span class="add-on">Data Nascimento</span> -->
										<div data-date="12-02-2012"
											class="input-append date datepicker ">

							<input id="datanascimento" type="text" data-date="01-02-2013" data-date-format="dd-mm-yyyy"
							 value="${cliente.datanascimento}" class=".datepicker" name="datanascimento"> 
												<span class="add-on"><i class="icon-th"></i></span>


										</div>
									</div>
								</div>
							</div>





							<div id="form-wizard-2" class="step">

								<div class="control-group">

									<div class="controls">

										<div class="input-prepend">
											<span class="add-on">Id</span> <input id="id"
												class="span11 mask text" name="id" type="text"
												value="${cliente.endereco.id}" placeholder="Digite o Id" />
										</div>
									</div>
								</div>

								<div class="control-group">

									<div class="controls">

										<div class="input-prepend">
											<span class="add-on">Logradouro</span> <input id="logradouro"
												class="span11 mask text" name="logradouro" type="text"
												value="${cliente.endereco.logradouro}"
												placeholder="Digite o Logradouro" />

										</div>

									</div>

									<div class="control-group">

										<div class="controls">

											<div class="input-prepend">
												<span class="add-on">N�</span> <input id="numero"
													class="span11 mask text" name="numero" type="text"
													value="${cliente.endereco.numero}" placeholder="N�" />

											</div>

										</div>

									</div>

									<div class="control-group">

										<div class="controls">

											<div class="input-prepend">
												<span class="add-on">Bairro</span> 
												<input id="bairro"
													class="span11 mask text" name="bairro" type="text"
													value="${cliente.endereco.bairro}"
													placeholder="Digite o Bairro" />

											</div>

										</div>

									</div>


									<div class="control-group">

										<div class="controls">
											<div class="input-prepend">
												<span class="add-on">Cidade</span>											
												<input id="cidade" class="span11 mask text" name="cidade"
												type="text" value="${cliente.endereco.cidade}"
												placeholder="Digite a Cidade" />
												
											</div>

										</div>
									</div>


									<div class="control-group">

										<div class="controls">
										
											<div class="input-prepend">
												<span class="add-on">UF</span>		
											<input id="uf" class="span11 mask text" name="uf" type="text"
													value="${cliente.endereco.uf}" placeholder="Digite a UF" />
										</div>
										</div>
										</div>
										


									<div class="control-group">

										<div class="controls">
										
											<div class="input-prepend">
												<span class="add-on">Cep</span>		
											<input id="cep" class="span11 mask text" name="cep"
												type="text" value="${cliente.endereco.cep}"
												placeholder="Digite o Cep" onblur="pesquisacep(this.value);" />

										</div>
										</div>
									</div>


									<div class="control-group">

										<div class="controls">
										
											<div class="input-prepend">
												<span class="add-on">P.Ref</span>		
											<input id="pontoreferencia" class="span11 mask text"
												name="pontoreferencia" type="text"
												value="${cliente.endereco.pontoreferencia}"
												placeholder="Digite o Ponto de Referencia" />
										</div>
										</div>
									</div>

									<div class="control-group">

										<div class="controls">
										
											<div class="input-prepend">
												<span class="add-on">Compl.</span>		
											<input id="complemento" class="span11 mask text"
												name="complemento" type="text"
												value="${cliente.endereco.complemento}"
												placeholder="Digite o Complemneto" />
											</div>
										</div>
									</div>
									
									<div class="control-group">

										<div class="controls">
										
											<div class="input-prepend">
												<span class="add-on">Ibge</span>		
											 <input id="ibge" name="ibge" 
                    							  class="span11 m-wrap" type="text" value="" /> 
											</div>
										</div>
									</div>
									
									<div class="control-group">

										<div class="controls">
										
											<div class="input-prepend">
												<span class="add-on">Cliente</span>		
											 <input id="cliente" name="cliente" 
                    							  class="span11 m-wrap" type="text" value="${cliente.id }" /> 
											</div>
										</div>
									</div>



								</div>
							</div>
							
					<div class="form-actions">
					<input id="back" class="btn btn-primary" type="reset"
						value="Voltar" /> <input id="next" class="btn btn-primary"
						type="submit" value="Pr�ximo" />
					<div id="status"></div>
				</div>
				<div id="submitted"></div>

		</form>

					</div>
				</div>




			</div>


		</div>
	</div>
</div>


<div class="row-fluid">
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Solu��es em Tecnologia</a> </div>
</div>

