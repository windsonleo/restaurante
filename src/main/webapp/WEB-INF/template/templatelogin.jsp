<!DOCTYPE HTML>
<%-- <%@ include file="/WEB-INF/views/home.jsp" %> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
    <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<html>
	<head>

	  <title>Restaurante Sushi Senpai</title>
	  <meta charset="UTF-8" />
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css"  />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/funcional.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css" />




		<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"
			 ></script>
			 
			 <script src="${pageContext.request.contextPath}/resources/js/matrix.login.js"
			  ></script>
			
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" "   ></script>

		<script src="${pageContext.request.contextPath}/resources/js/chartist.min.js"
			    ></script>

		<script src="${pageContext.request.contextPath}/resources/js/arrive.min.js"
			   ></script>
			   

			
								
			<script src="${pageContext.request.contextPath}/resources/js/perfect-scrollbar.jquery.min.js"
			    ></script>

		<script src="${pageContext.request.contextPath}/resources/js/bootstrap-notify.js"
			></script>
		
			<script src="${pageContext.request.contextPath}/resources/js/material-dashboard.js"
			 ></script>
		
			
		<script src="${pageContext.request.contextPath}/resources/js/demo.js"
			  ></script>

			
			
		<script src="${pageContext.request.contextPath}/resources/js/material.min.js"
			  ></script>
	
	
	   <script src="https://www.gstatic.com/charts/loader.js"
		  ></script>
		  
<!-- 		  //fim js -->

					
			
	
 	 	
 	 	<script src="${pageContext.request.contextPath}/resources/js/funcional.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/chartist.min.js"></script>

			
	
		
		
				<link rel="icon" href="${pageContext.request.contextPath}/images/favicon.png"  />
				<link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/css/bootstrap-responsive.min.css"  type="text/css"/>
				<link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" type="text/css"/>
		       	<link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/css/demo.css"  type="text/css" />
		        <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/css/material-dashboard.css" type="text/css"/>
				<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet" type='text/css'/>
				<link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet' type='text/css' />
		        <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/css/matrix-login.css" type="text/css"/>

		        <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/css/customizado.css" type="text/css"/>


	</head>
    <body>

    	
							<tiles:insertAttribute name="conteudo" />
			
			
<!-- 			</br> -->
<!-- 			</br> -->
<!-- 				</br> -->
<!-- 			</br> -->
<!-- 				</br> -->
<!-- 			</br> -->
<!-- 				</br> -->
<!-- 			</br> -->
							<tiles:insertAttribute name="footer" />
			


	</body>
</html>