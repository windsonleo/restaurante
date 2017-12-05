<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


        <div id="loginbox">  
        				 <div class="control-group normal_text"> <h2><img src="${pageContext.request.contextPath}/resources/images/logologin.png" alt="Logo" /></h2></div>
                  
            <form id="loginform" class="form-vertical" action="login" method="post">
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on"><i class="icon-user"> </i></span>
                            <input type="text" id="username" name="username" placeholder="Username" />
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on"><i class="icon-lock"></i></span><input type="password" id="senha" name="senha" placeholder="Password" />
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <span class=""><a href="#" class="flip-link btn btn bg_ly" name="lost" id="to-recover">Lost password?</a></span>
                    <span class=""><button type="submit" class="btn btn-success" > Login</button></span>
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                
                </div>
            </form>
            
            
            <form id="recoverform" action="#" class="form-vertical" hidden="">
				<p class="normal_text">Enter your e-mail address below and we will send you instructions how to recover a password.</p>
				
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-envelope"></i></span><input type="text" name ="emailrecovery" placeholder="E-mail address" />
                        </div>
                    </div>
               
                <div class="form-actions">
                    <span class=""><a href="#" class="flip-link btn btn bg_ly" id="to-login">&laquo; Back to login</a></span>
                    <span class=""><a class="btn btn-success" name="recovery">Reecover</a></span>
                </div>
            </form>
        </div>
        


