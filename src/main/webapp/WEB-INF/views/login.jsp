<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


        <div id="loginbox">  
        				 <div class="control-group normal_text"> <h2><img src="${pageContext.request.contextPath}/resources/images/logologin.png" alt="Logo" /></h2></div>
                  
            <form id="loginform" class="form-vertical" action="login" method="post">
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-user"> </i></span><input type="text" id="username" name="username" placeholder="Username" />
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-play"></i></span><input type="password" id="senha" name="senha" placeholder="Password" />
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <span class="pull-left"><a href="#" class="flip-link btn btn bg_ly" id="to-recover">Lost password?</a></span>
                    <span class="pull-right"><button type="submit" class="btn btn-success" > Login</button></span>
                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                
                </div>
            </form>
            
            
            <form id="recoverform" action="#" class="form-vertical">
				<p class="normal_text">Enter your e-mail address below and we will send you instructions how to recover a password.</p>
				
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-envelope"></i></span><input type="text" placeholder="E-mail address" />
                        </div>
                    </div>
               
                <div class="form-actions">
                    <span class="pull-left"><a href="#" class="flip-link btn btn bg_ly" id="to-login">&laquo; Back to login</a></span>
                    <span class="pull-right"><a class="btn btn-success">Reecover</a></span>
                </div>
            </form>
        </div>
        


