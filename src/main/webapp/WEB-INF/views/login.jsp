<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


        <div id="loginbox">  
        	<div class="control-group normal_text"> <h3><img src="${pageContext.request.contextPath}/resources/images/logologin.png" alt="Logo" /></h3></div>
                  
            <form id="loginform" class="form-vertical" action="login" method="post">
                
                
                
                
                <div class="form-group label-floating is-empty">
                <label class="control-label"></label>
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on"><i class="icon-user"> </i></span>
                            <input type="text" id="username" name="username" placeholder="Digite seu Usuario" style="margin-left:-5px;" />
                        </div>
                    </div>
                </div>
                
                
                <div class="form-group label-floating is-empty">
                <label class="control-label"></label>
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on"><i class="icon-lock"></i></span><input type="password" id="senha" name="senha" placeholder="Digite uma Senha" />
                        </div>
                    </div>
                </div>
                
                <div class="form-actions">
                    <span class=""><a href="#" class="flip-link btn btn-inverse" name="lost" id="to-recover">Lost password?</a></span>
                    <span class=""><button type="submit" class="btn btn-danger" > Login</button></span>
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                
                </div>
            </form>
            
            
            <form id="recoverform" action="#" class="form-vertical" hidden="">
				<h3><p class="normal_texte">Enter your e-mail address below and we will send you instructions how to recover a password.</p></h3>
				
				</br>
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on"><i class="icon-envelope"></i></span><input type="text" name ="emailrecovery" placeholder="E-mail address" />
                        </div>
                    </div>
               
                <div class="form-actions">
                    <span class=""><a href="#" class="flip-link btn btn-inverse" id="to-login">&laquo;Voltar para login</a></span>
                    <span class=""><a class="btn btn-danger" name="recovery">Recuperar</a></span>
                </div>
            </form>
        </div>
        


