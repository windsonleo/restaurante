 $(document).ready(function() {

	$('#searchnow').autocomplete({
		serviceUrl: '${pageContext.request.contextPath}/cliente/',
		paramName: "sugestion",
		delimiter: ",",
	   transformResult: function(response) {

		return {
		  //must convert json to javascript object before process
		  suggestions: $.map($.parseJSON(response), function(item) {

		      return { value: item.sugestion, data: item.id };
		   })

		 };

            }

	 });
	
	 $('.nav navbar-nav side-nav li').click(function(e) {
	        $('.navbar li.active').removeClass('active');
	        var $this = $(this);
	        if (!$this.hasClass('active')) {
	            $this.addClass('active');
	        }

	    });
	 
	 
		 
	   function calculapagamento(){
	       var valorpagamento = 0;
	       $('.valorpagoform').each(function(i){ 

	    	   valorpagamento = parseInt($(this).val()) + valorpagamento ;
	       }); 
	       $('#valorPago').val( valorpagamento ); //fora do loop
	             
	       
	   }
	   
	   function calculaitem(){
	       var qtd = 0;
	       var valoritem=0;
	       var total=0;
	       $('.qtd').each(function(i){ 
	    	   
	    	   valoritem =parseInt($('.precounit').val())

	    	   total = parseInt($(this).val()) * valoritem ;
	       });
	       $('#valoritemform').val( total ); //fora do loop
	             
	       
	   }
	   

	   function calculatotalitem(){
	       var valoritem=0;
	       var total=0;
	       $('.valoritemform').each(function(i){ 
	    	   

	    	   total = parseInt($(this).val()) + total ;
	       });
	       $('#precovenda').val( total ); //fora do loop
	             
	       
	   }

  });