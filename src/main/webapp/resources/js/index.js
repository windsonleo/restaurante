
		$(document).ready(function () {
			
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
  				  			
  					
  			});