<!DOCTYPE HTML>
<%-- <%@ include file="/WEB-INF/views/home.jsp" %> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    
    <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<html>
	<head>

<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">



<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/screen.css" type="text/css" /> --%>

 <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/resources/font/css/font-awesome.min.css" rel="stylesheet" type="text/css">
 	
 	
<%--  	 	<script src="${pageContext.request.contextPath}/resources/js/jquery/jquery-1.4.1.min.js" --%>
<!-- 	type="text/javascript"></script> -->
 	
 	  <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script>
     <script src="${pageContext.request.contextPath}/resources/js/index.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/plugins/morris/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/morris/morris.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/plugins/morris/morris-data.js"></script>
 	
 	
 
 	

	</head>
    <body>

    	
			<tiles:insertAttribute name="conteudo" />
<%-- 			<tiles:insertAttribute name="footer" /> --%>


	</body>
</html>