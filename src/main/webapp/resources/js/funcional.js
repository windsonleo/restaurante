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

  });