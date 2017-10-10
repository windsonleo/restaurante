  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  <%@ page session="true" %>
   
   
<!--    <body data-spy="scroll" data-target="#template-navbar"> -->
   
        <!--== 4. Navigation ==-->

        <nav id="template-navbar" class="navbar navbar-default custom-navbar-default navbar-fixed-top">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#Food-fair-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">
                        <img id="logo" src="${pageContext.request.contextPath}/resources/images/cardapio/Logo_main.png" class="logo img-responsive">
                    </a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="Food-fair-toggle">
                    <ul class="nav navbar-nav navbar-right">
<!--                         <li><a href="#about">Sushi Senpai</a></li> -->
                        <li><a href="#pricing">O Cardápio</a></li>
                        <li><a href="#great-place-to-enjoy"> O Chef</a></li>
<!--                         <li><a href="#breakfast">O Sushi</a></li> -->
                        <li><a href="#featured-dish">Sugestões do Chef</a></li>
<!--                         <li><a href="#reserve">Reservas</a></li> -->
<!--                         <li><a href="#contact">Contato</a></li> -->
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.row -->
        </nav>
        
 
              