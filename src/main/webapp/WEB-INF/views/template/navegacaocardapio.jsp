  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  
<%@ page session="true" %>
   
   
<!--    <body data-spy="scroll" data-target="#template-navbar"> -->
   
        <!--== 4. Navigation ==-->
        <script type="text/javascript">
        
        $("#header-slider").owlCarousel({

            navigation : true, // Show next and prev buttons
            slideSpeed : 100,
            paginationSpeed : 400,
            singleItem: true,
            autoPlay: true,
            pagination: false,

            // "singleItem:true" is a shortcut for:
            // items : 1, 
            // itemsDesktop : false,
            // itemsDesktopSmall : false,
            // itemsTablet: false,
            // itemsMobile : false

        });
        
        
        
        </script>
        
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
                        <img id="logo" src="/restaurante/resources/images/cardapio/Logo_main.png" class="logo img-responsive">
                    </a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="Food-fair-toggle">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#about">Sushi Senpai</a></li>
                        <li><a href="#pricing">O Cardápio</a></li>
                        <li><a href="#great-place-to-enjoy"> O Chef</a></li>
                        <li><a href="#breakfast">O Sushi</a></li>
                        <li><a href="#featured-dish">Sugestões do Chef</a></li>
                        <li><a href="#reserve">Reservas</a></li>
                        <li><a href="#contact">Contato</a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.row -->
        </nav>
        
                <section id="header-slider" class="owl-carousel">
            <div class="item">
                <div class="container">
                    <div class="header-content">
                        <h1 class="header-title">BEST FOOD</h1>
                        <p class="header-sub-title">create your own slogan</p>
                    </div> <!-- /.header-content -->
                </div>
            </div>
            <div class="item">
                <div class="container">
                    <div class="header-content">
                        <h1 class="header-title">BEST SNACKS</h1>
                        <p class="header-sub-title">create your own slogan</p>
                    </div> <!-- /.header-content -->
                </div>
            </div>
            <div class="item">
                <div class="container">
                    <div class="header-content text-right pull-right">
                        <h1 class="header-title">BEST DRINKS</h1>
                        <p class="header-sub-title">create your own slogan</p>
                    </div> <!-- /.header-content -->
                </div>
            </div>
        </section>  
              