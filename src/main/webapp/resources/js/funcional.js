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
	    	   
	    	   valoritem =parseInt($('.precounit').val());

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
	   
	   $(function () {
		    $( '.table table-bordered data-table' ).searchable({
		        striped: true,
		        oddRow: { 'background-color': '#f5f5f5' },
		        evenRow: { 'background-color': '#fff' },
		        searchType: 'fuzzy'
		    });
		    
		    $( '#searchable-container' ).searchable({
		        searchField: '#container-search',
		        selector: '.row',
		        childSelector: '.col-xs-4',
		        show: function( elem ) {
		            elem.slideDown(100);
		        },
		        hide: function( elem ) {
		            elem.slideUp( 100 );
		        }
		    })
		});
	      

  });
 
 $(document).ready(function() {
	 
	   $('#menu li a').click(function () {
		   

       	$('#menu').find('li.active').removeClass('active');
       	$(this).parents("li").addClass('active');
	
       	
       });
   
 });