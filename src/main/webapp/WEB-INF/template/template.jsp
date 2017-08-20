  <!DOCTYPE HTML>
<%-- <%@ include file="/WEB-INF/views/home.jsp" %> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html>
<head>

	  <title>Restaurante Sushi Senpai</title>

		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fullcalendar.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/matrix-style.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/matrix-media.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/joint.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/funcional.css" />
		
		<link href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css" rel="stylesheet" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.gritter.css" />
	   	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
 	
 	 	
		 <script src="${pageContext.request.contextPath}/resources/js/excanvas.min.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.custom.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/jquery.flot.min.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/jquery.flot.resize.min.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/jquery.peity.min.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/fullcalendar.min.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/matrix.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/matrix.dashboard.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/jquery.gritter.min.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/matrix.interface.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/matrix.chat.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/matrix.form_validation.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/jquery.wizard.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/jquery.uniform.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/select2.min.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/matrix.popover.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/matrix.tables.js"></script> 
 	
	
 	
 	<script src="${pageContext.request.contextPath}/resources/js/joint.min.js"></script>
 	
 	 	<script src="${pageContext.request.contextPath}/resources/js/funcional.js"></script>
 	
 	
 	 	<script src="${pageContext.request.contextPath}/resources/js/joint.shapes.devs.min.js"></script>
 	
<%--   	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> --%>


  	<script src="${pageContext.request.contextPath}/resources/js/backbone.min.js"></script>
  	
  	<script src="${pageContext.request.contextPath}/resources/js/lodash.min.js"></script>
 
 
 
 <script type="text/javascript">
  // This function is called from the pop-up menus to transfer to
  // a different page. Ignore if the value returned is a null string:
  function goPage (newURL) {

      // if url is empty, skip the menu dividers and reset the menu selection to default
      if (newURL != "") {
      
          // if url is "-", it is this page -- reset the menu:
          if (newURL == "-" ) {
              resetMenu();            
          } 
          // else, send page to designated URL            
          else {  
            document.location.href = newURL;
          }
      }
  }

// resets the menu selection upon entry to this page:
function resetMenu() {
   document.gomenu.selector.selectedIndex = 2;
}
  
  </script>
  
 
 
</head>


<body>

		
		<tiles:insertAttribute name="navegacao" />


		<tiles:insertAttribute name="conteudo" />
		
<%-- 		<tiles:insertAttribute name="footer" /> --%>
		
			

</body>
</html>