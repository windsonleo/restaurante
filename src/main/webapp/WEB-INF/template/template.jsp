  <!DOCTYPE HTML>
<%-- <%@ include file="/WEB-INF/views/home.jsp" %> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<html lang="pt-br">
<head>

	  <title>Restaurante Sushi Senpai</title>
	  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/logo.png.ico" type="image/x-icon" />

		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/matrix-style.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/matrix-media.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/joint.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/uniform.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/select2.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/font-awesome/css/font-awesome.css"  />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.gritter.css" />
	   	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,700,800">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fullcalendar.css" />
 		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-wysihtml5.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/funcional.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css" />




		
		<script
			src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/jquery.ui.custom.js"></script>
		
<!-- 		<script -->
<%-- 			src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script> --%>
			
						
		<script
			src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
		
		<script
			src="${pageContext.request.contextPath}/resources/js/matrix.js"></script>
			
			
		<script
			src="${pageContext.request.contextPath}/resources/js/matrix.tables.js"></script>
		
		<script
			src="${pageContext.request.contextPath}/resources/js/matrix.wizard.js"></script>
			
			<script
			 src="${pageContext.request.contextPath}/resources/js/matrix.calendar.js"></script>	
			<script
			src="${pageContext.request.contextPath}/resources/js/bootstrap-colorpicker.js"></script>			
		<script
			src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>	
			
		
		
		<script src="${pageContext.request.contextPath}/resources/js/masked.js"></script>

		<script 
			src="${pageContext.request.contextPath}/resources/js/jquery.uniform.js"></script>			<script src="${pageContext.request.contextPath}/resources/js/matrix.js"></script>			
		
		<script src="${pageContext.request.contextPath}/resources/js/select2.min.js"></script>		
		
		<script
			src="${pageContext.request.contextPath}/resources/js/jquery.wizard.js"></script>
			
		<script
			src="${pageContext.request.contextPath}/resources/js/jquery.validate.js"></script>
						

				<script src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js"></script>
				<script src="${pageContext.request.contextPath}/resources/js/jquery.gritter.min.js"></script> 
				<script src="${pageContext.request.contextPath}/resources/js/excanvas.min.js"></script>
	
		
		
				
				<script src="${pageContext.request.contextPath}/resources/js/matrix.dashboard.js"></script> 
				<script src="${pageContext.request.contextPath}/resources/js/matrix.interface.js"></script> 
				<script src="${pageContext.request.contextPath}/resources/js/matrix.chat.js"></script> 
				<script src="${pageContext.request.contextPath}/resources/js/matrix.popover.js"></script> 
				
								
 	 	<script src="${pageContext.request.contextPath}/resources/js/funcional.js"></script>
				
				
 <script src="${pageContext.request.contextPath}/resources/js/matrix.form_common.js"></script>		


   	<script src="${pageContext.request.contextPath}/resources/js/wysihtml5-0.3.0.js"></script>

		
		<script
			src="${pageContext.request.contextPath}/resources/js/jquery.peity.min.js"></script>
			
		
		<script
			src="${pageContext.request.contextPath}/resources/js/bootstrap-wysihtml5.js"></script>
	

		
		<script 
			src="${pageContext.request.contextPath}/resources/js/joint.min.js"></script>	
		
		<script 
			src="${pageContext.request.contextPath}/resources/js/joint.shapes.devs.min.js"></script>		
				
		<script 
			src="${pageContext.request.contextPath}/resources/js/backbone-min.js"></script>
							
				
		<script
			src="${pageContext.request.contextPath}/resources/js/lodash.min.js"></script>
				
			
		<script src="${pageContext.request.contextPath}/resources/js/jquery.flot.min.js"></script> 
		
		<script src="${pageContext.request.contextPath}/resources/js/jquery.flot.pie.min.js"></script> 
		
		<script src="${pageContext.request.contextPath}/resources/js/jquery.flot.pie.js"></script> 
		
		<script src="${pageContext.request.contextPath}/resources/js/jquery.flot.resize.min.js"></script> 

			
 

			
			
		
		
			
				



			
			
			
					 	
 	
 	
 	
 	
<%--   	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script> --%>


	
 
   	
				<script src="${pageContext.request.contextPath}/resources/js/matrix.form_validation.js"></script> 
		 

 
<!--  <script type="text/javascript" src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script> -->
 
 
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
<!--   #w-input-search -->
    <script>
  $(document).ready(function() {

	$('#searchnow').autocomplete({
		serviceUrl: '${pageContext.request.contextPath}/getResult',
		paramName: "sugestion",
		delimiter: ",",
	   transformResult: function(response) {

		return {
		  //must convert json to javascript object before process
		  suggestions: $.map($.parseJSON(response), function(item) {

		      return { value: item.nome, data: item.id };
		   })

		 };

            }

	 });

  });
  </script>
  <script type="text/javascript">
$(function () {
    // we use an inline data source in the example, usually data would
    // be fetched from a server
    var data = [], totalPoints = 300;
    function getRandomData() {
        if (data.length > 0)
            data = data.slice(1);

        // do a random walk
        while (data.length < totalPoints) {
            var prev = data.length > 0 ? data[data.length - 1] : 50;
            var y = prev + Math.random() * 10 - 5;
            if (y < 0)
                y = 0;
            if (y > 100)
                y = 100;
            data.push(y);
        }

        // zip the generated y values with the x values
        var res = [];
        for (var i = 0; i < data.length; ++i)
            res.push([i, data[i]])
        return res;
    }

    // setup control widget
    var updateInterval = 30;
    $("#updateInterval").val(updateInterval).change(function () {
        var v = $(this).val();
        if (v && !isNaN(+v)) {
            updateInterval = +v;
            if (updateInterval < 1)
                updateInterval = 1;
            if (updateInterval > 2000)
                updateInterval = 2000;
            $(this).val("" + updateInterval);
        }
    });

    // setup plot
    var options = {
        series: { shadowSize: 0 }, // drawing is faster without shadows
        yaxis: { min: 0, max: 100 },
        xaxis: { show: false }
    };
    var plot = $.plot($("#placeholder2"), [ getRandomData() ], options);

    function update() {
        plot.setData([ getRandomData() ]);
        // since the axes don't change, we don't need to call plot.setupGrid()
        plot.draw();
        
        setTimeout(update, updateInterval);
    }

    update();
});
</script> 
<!--Real-time-chart-js-end-->
<!--Turning-series-chart-js-->
<script type="text/javascript">
$(function () {
    var datasets = {
        "usa": {
            label: "USA",
            data: [[1988, 483994], [1989, 479060], [1990, 457648], [1991, 401949], [1992, 424705], [1993, 402375], [1994, 377867], [1995, 357382], [1996, 337946], [1997, 336185], [1998, 328611], [1999, 329421], [2000, 342172], [2001, 344932], [2002, 387303], [2003, 440813], [2004, 480451], [2005, 504638], [2006, 528692]]
        },        
        "russia": {
            label: "Russia",
            data: [[1988, 218000], [1989, 203000], [1990, 171000], [1992, 42500], [1993, 37600], [1994, 36600], [1995, 21700], [1996, 19200], [1997, 21300], [1998, 13600], [1999, 14000], [2000, 19100], [2001, 21300], [2002, 23600], [2003, 25100], [2004, 26100], [2005, 31100], [2006, 34700]]
        },
        "uk": {
            label: "UK",
            data: [[1988, 62982], [1989, 62027], [1990, 60696], [1991, 62348], [1992, 58560], [1993, 56393], [1994, 54579], [1995, 50818], [1996, 50554], [1997, 48276], [1998, 47691], [1999, 47529], [2000, 47778], [2001, 48760], [2002, 50949], [2003, 57452], [2004, 60234], [2005, 60076], [2006, 59213]]
        },
        "germany": {
            label: "Germany",
            data: [[1988, 55627], [1989, 55475], [1990, 58464], [1991, 55134], [1992, 52436], [1993, 47139], [1994, 43962], [1995, 43238], [1996, 42395], [1997, 40854], [1998, 40993], [1999, 41822], [2000, 41147], [2001, 40474], [2002, 40604], [2003, 40044], [2004, 38816], [2005, 38060], [2006, 36984]]
        },
        "denmark": {
            label: "Denmark",
            data: [[1988, 3813], [1989, 3719], [1990, 3722], [1991, 3789], [1992, 3720], [1993, 3730], [1994, 3636], [1995, 3598], [1996, 3610], [1997, 3655], [1998, 3695], [1999, 3673], [2000, 3553], [2001, 3774], [2002, 3728], [2003, 3618], [2004, 3638], [2005, 3467], [2006, 3770]]
        },
        "sweden": {
            label: "Sweden",
            data: [[1988, 6402], [1989, 6474], [1990, 6605], [1991, 6209], [1992, 6035], [1993, 6020], [1994, 6000], [1995, 6018], [1996, 3958], [1997, 5780], [1998, 5954], [1999, 6178], [2000, 6411], [2001, 5993], [2002, 5833], [2003, 5791], [2004, 5450], [2005, 5521], [2006, 5271]]
        },
        "norway": {
            label: "Norway",
            data: [[1988, 4382], [1989, 4498], [1990, 4535], [1991, 4398], [1992, 4766], [1993, 4441], [1994, 4670], [1995, 4217], [1996, 4275], [1997, 4203], [1998, 4482], [1999, 4506], [2000, 4358], [2001, 4385], [2002, 5269], [2003, 5066], [2004, 5194], [2005, 4887], [2006, 4891]]
        }
    };

    // hard-code color indices to prevent them from shifting as
    // countries are turned on/off
    var i = 0;
    $.each(datasets, function(key, val) {
        val.color = i;
        ++i;
    });
    
    // insert checkboxes 
    var choiceContainer = $("#choices");
    $.each(datasets, function(key, val) {
        choiceContainer.append('<br/><input type="checkbox" name="' + key +
                               '" checked="checked" id="id' + key + '">' +
                               '<label for="id' + key + '">'
                                + val.label + '</label>');
    });
    choiceContainer.find("input").click(plotAccordingToChoices);

    
    function plotAccordingToChoices() {
        var data = [];

        choiceContainer.find("input:checked").each(function () {
            var key = $(this).attr("name");
            if (key && datasets[key])
                data.push(datasets[key]);
        });

        if (data.length > 0)
            $.plot($("#placeholder"), data, {
                yaxis: { min: 0 },
                xaxis: { tickDecimals: 0 }
            });
    }

    plotAccordingToChoices();
});
</script> 
 
 
 
 <script type="text/javascript">
 
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
  	   
    	 qtd = parseInt($(this).val());
    	 
    	 $('.precounit').each(function(i){ 
    		
    		 valoritem = parseInt($(this).val()) + valoritem ;
    		 
    	 });
    	 

  	   total = qtd * valoritem ;
     });
     $('.valoritemform').val( total ); //fora do loop
           
     
 }
 

 function calculatotalitem(){
     var total=0;
     $('.valoritemform').each(function(i){ 
  	   

  	   total = parseInt($(this).val()) + total;
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
	    
 });
 
 
 </script>
 
  <!-- Adicionando Javascript -->
    <script type="text/javascript" >


       	 //alert("entrou now template");

       	 function limpa_formulário_cep() {
             //Limpa valores do formulário de cep.
             document.getElementById('logradouro').value=("");
             document.getElementById('bairro').value=("");
             document.getElementById('cidade').value=("");
             document.getElementById('uf').value=("");
             document.getElementById('ibge').value=("");
     }

     function meu_callback(conteudo) {
         if (!("erro" in conteudo)) {
             //Atualiza os campos com os valores.
             document.getElementById('logradouro').value=(conteudo.logradouro);
             document.getElementById('bairro').value=(conteudo.bairro);
             document.getElementById('cidade').value=(conteudo.localidade);
             document.getElementById('uf').value=(conteudo.uf);
             document.getElementById('ibge').value=(conteudo.ibge);
         } //end if.
         else {
             //CEP não Encontrado.
             limpa_formulário_cep();
             alert("CEP não encontrado.");
         }
     }
         
     function pesquisacep(valor) {

         //Nova variável "cep" somente com dígitos.
         var cep = valor.replace(/\D/g, '');

         //Verifica se campo cep possui valor informado.
         if (cep != "") {

             //Expressão regular para validar o CEP.
             var validacep = /^[0-9]{8}$/;

             //Valida o formato do CEP.
             if(validacep.test(cep)) {

                 //Preenche os campos com "..." enquanto consulta webservice.
                 document.getElementById('logradouro').value="...";
                 document.getElementById('bairro').value="...";
                 document.getElementById('cidade').value="...";
                 document.getElementById('uf').value="...";
                 document.getElementById('ibge').value="...";

                 //Cria um elemento javascript.
                 var script = document.createElement('script');

                 //Sincroniza com o callback.
                 script.src = '//viacep.com.br/ws/'+ cep + '/json/?callback=meu_callback';

                 //Insere script no documento e carrega o conteúdo.
                 document.body.appendChild(script);

             } //end if.
             else {
                 //cep é inválido.
                 limpa_formulário_cep();
                 alert("Formato de CEP inválido.");
             }
         } //end if.
         else {
             //cep sem valor, limpa formulário.
             limpa_formulário_cep();
         }
     };


    </script>
 
 
 
 
</head>


<body>

		
		<tiles:insertAttribute name="navegacao" />


		<tiles:insertAttribute name="conteudo" />
		
<%-- 		<tiles:insertAttribute name="footer" /> --%>
		
			

</body>
</html>