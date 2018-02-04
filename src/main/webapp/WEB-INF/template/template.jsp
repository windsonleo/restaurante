<!DOCTYPE HTML>
<%-- <%@ include file="/WEB-INF/views/home.jsp" %> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib uri="http://jawr.net/tags" prefix="jwr" %>

<html lang="pt-br">
<head>

    <title>Restaurante Sushi Senpai</title>
    <%--     <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logosup.png" --%>
    <!--           type="image/x-icon"/> -->

    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <%-- 		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" /> --%>
    <%-- 		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-responsive.min.css" /> --%>
    <%-- 		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/matrix-style.css" /> --%>
    <%-- 		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/matrix-media.css" /> --%>
    <%-- 		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/joint.min.css" /> --%>
    <%-- 		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/uniform.css" /> --%>
    <%-- 		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/select2.css" /> --%>
    <%-- 		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.gritter.css" /> --%>
    <!-- 	   	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,700,800"> -->
    <%-- 		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fullcalendar.css" /> --%>
    <%--  		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-wysihtml5.css" /> --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css"/>

    <link rel="stylesheet" media="screen"
          href="${pageContext.request.contextPath}/resources/css/bootstrap-responsive.min.css" type="text/css"/>
    <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
          type="text/css"/>
    <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/css/demo.css"
          type="text/css"/>
    <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/css/material-dashboard.css"
          type="text/css"/>
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet"
          type='text/css'/>
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet'
          type='text/css'/>

    <link rel="stylesheet" media="screen" href="${pageContext.request.contextPath}/resources/css/customizado.css"
          type="text/css"/>

    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/logosup.png"/>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
    <jwr:script src="${pageContext.request.contextPath}/bundle/js/material-dash.js"/>
    
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/funcional.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css"/>

</head>


<body>

<div class="wrapper">
         
        <tiles:insertAttribute name="navegacao"/>
        
<!--         <div class="main-panel ps-container ps-theme-default ps-active-y"> -->

        <div class="main-panel">


            <tiles:insertAttribute name="header"/>
         
            <tiles:insertAttribute name="conteudo"/>

            <tiles:insertAttribute name="footer"/>
            
         </div>
</div>
<script src="../assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>

<%-- <script src="${pageContext.request.contextPath}/resources/js/material.min.js"></script> --%>

<%-- <script src="${pageContext.request.contextPath}/resources/js/material-dashboard.js"></script> --%>

<%-- <script src="${pageContext.request.contextPath}/resources/js/chartist.min.js"></script> --%>

<%-- <script src="${pageContext.request.contextPath}/resources/js/arrive.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/js/perfect-scrollbar.jquery.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/js/bootstrap-notify.js"></script> --%>

<!-- <script src="https://www.gstatic.com/charts/loader.js"></script> -->
<%--<script src="${pageContext.request.contextPath}/resources/js/funcional.js"></script>--%>


</body>
</html>
