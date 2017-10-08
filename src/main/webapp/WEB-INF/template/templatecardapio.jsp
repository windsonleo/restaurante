  <!DOCTYPE HTML>
<%-- <%@ include file="/WEB-INF/views/home.jsp" %> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html lang="en">
<head>

	  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logo.png.ico" type="image/x-icon" />

		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- 		<meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
		
			  <title>Restaurante Sushi Senpai</title>
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cardapio/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cardapio/font-awesome.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cardapio/owl.carousel.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cardapio/owl.theme.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cardapio//animate.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cardapio/flexslider.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cardapio/pricing.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cardapio/main.css" />

 	
 	 	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cardapio/jquery-1.11.2.min.js"></script> 

 	 	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cardapio/jquery.flexslider.min.js"></script> 
 	 	
		 <script src="${pageContext.request.contextPath}/resources/js/cardapio/bootstrap.min.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cardapio/jssor.core.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cardapio/jssor.slider.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cardapio/jssor.utils.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/cardapio/owl.carousel.min.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cardapio/jquery.mixitup.min.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/cardapio/wow.min.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/cardapio/jquery.validate.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cardapio/jquery.hoverdir.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/cardapio/jQuery.scrollSpeed.js"></script> 
		<script src="${pageContext.request.contextPath}/resources/js/cardapio/script.js"></script> 
		

         <script type="text/javascript">
            $(window).load(function() {
                $('.flexslider').flexslider({
                 animation: "slide",
                 controlsContainer: ".flexslider-container"
                });
            });
        </script>
        
         <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>
       
<script type="text/javascript">
$(document).ready(function(){
    $(window).scroll(function() {
        if ($(document).scrollTop() > 50) {
            $("#logo").attr("src", "${pageContext.request.contextPath}/resources/images/cardapio/Logo_stick.png")
        }
        else {
             $("#logo").attr("src", "${pageContext.request.contextPath}/resources/images/cardapio/Logo_main.png")
        }
    });


});


</script>


        <script>
            function initialize() {
                var mapCanvas = document.getElementById('map-canvas');
                var mapOptions = {
                    center: new google.maps.LatLng(24.909439, 91.833800),
                    zoom: 16,
                    scrollwheel: false,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                }
                var map = new google.maps.Map(mapCanvas, mapOptions)
                               
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(-8.2189288, -34.9318343),
                    title:"Sushi Senpai"
                });

                // To add the marker to the map, call setMap();
                marker.setMap(map);
            }
            google.maps.event.addDomListener(window, 'load', initialize);
        </script>


<body data-spy="scroll" data-target="#template-navbar">

		
		<tiles:insertAttribute name="navegacaocardapio" />


		<tiles:insertAttribute name="conteudo" />

</body>			
			
</html>