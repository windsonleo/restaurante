
		$(document).ready(function () {
			
			 $('li a').addClass('active');
			 
			
//			alert("index");

  			
//			 $(".progress-element").each(function() {
//			      $(".progress-bar").waypoint(function() {
//			      var progressBar = $(".progress-bar");
//			      progressBar.each(function(indx){
//			          $(this).css("width", $(this).attr("aria-valuenow") + "%");
//			      });
//			  }, {
//			      triggerOnce: true,
//			      offset: 'bottom-in-view'
//			    });
//			   });
			 
			 
			 var $progress = $('.progress ');
			 var $progressBar = $('.progress-bar');

			 setTimeout(function() {
			     $progressBar.css('width', '10%');
			     setTimeout(function() {
			         $progressBar.css('width', '30%');
			         setTimeout(function() {
			             $progressBar.css('width', '100%');
			         }, 500); // WAIT 2 seconds
			     }, 500); // WAIT 1 seconds
			 }, 500); // WAIT 1 second
  				  			
				 
		
			 
			 $("#valorPago")

				});
		
		 $('.nav navbar-nav side-nav li').click(function(e) {
		        $('.navbar li.active').removeClass('active');
		        var $this = $(this);
		        if (!$this.hasClass('active')) {
		            $this.addClass('active');
		        }

		    });
		 
		 
			 
		   function calcula(){
		       var valor = 0; 
		       $('.valorpagoform').each(function(i){ 

		           valor = parseInt($(this).val()) + valor ;
		       }); 
		       $('#valorPago').val( valor ); //fora do loop
		   }
				
	
	