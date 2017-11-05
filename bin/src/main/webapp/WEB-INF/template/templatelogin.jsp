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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/matrix-login.css" />
        <link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
		
		<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>  
        <script src="${pageContext.request.contextPath}/resources/js/matrix.login.js"></script>
         	<script src="${pageContext.request.contextPath}/resources/js/joint.min.js"></script>
 	
 	 	<script src="${pageContext.request.contextPath}/resources/js/funcional.js"></script>
 	
 	
 	 	<script src="${pageContext.request.contextPath}/resources/js/joint.shapes.devs.min.js"></script>
 	
<%--   	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> --%>


  	<script src="${pageContext.request.contextPath}/resources/js/backbone.min.js"></script>
  	
  	<script src="${pageContext.request.contextPath}/resources/js/lodash.min.js"></script>
 	

	</head>
    <body>

    	
							<tiles:insertAttribute name="conteudo" />
			
							<tiles:insertAttribute name="footer" />
			


	</body>
</html>