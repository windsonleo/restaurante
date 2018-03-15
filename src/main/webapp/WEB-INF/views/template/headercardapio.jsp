<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%@ page session="true" %>



	<nav class="navbar navbar-transparent navbar-fixed-top navbar-color-on-scroll">
   <div class="container-fluid">
      <div class="navbar-header">
         <button type="button" class="navbar-toggle" data-toggle="collapse">
         <span class="sr-only">Toggle navigation</span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         <span class="icon-bar"></span>
         </button>
         
       <h4 class="simple-text"> <i class="fa fa-paw"> </i> SushiSenpai </h4>
<!--          <img class="image-responsive" -->
<%--             src="${pageContext.request.contextPath}/resources/images/logosenpaii.png"/> --%>
      </div>
      
      
     
        	<div class="collapse navbar-collapse" id="navigation-example">
        		<ul class="nav navbar-nav navbar-right">

		            <li>
		                <a href="https://twitter.com/CreativeTim" target="_blank" class="btn btn-simple btn-white btn-just-icon">
							<i class="fa fa-twitter"></i>
						</a>
		            </li>
		            <li>
		                <a href="https://www.facebook.com/CreativeTim" target="_blank" class="btn btn-simple btn-white btn-just-icon">
							<i class="fa fa-facebook-square"></i>
						</a>
		            </li>
					<li>
		                <a href="https://www.instagram.com/CreativeTimOfficial" target="_blank" class="btn btn-simple btn-white btn-just-icon">
							<i class="fa fa-instagram"></i>
						</a>
		            </li>
        		</ul>
        	</div>
   </div>
</nav>
