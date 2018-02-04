<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

<!-- <div class="row-fluid"> -->
<!-- <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Solu��es em Tecnologia</a> </div> -->
<!-- </div> -->


<footer id="footer" class = "footer">

    <div class="row-fluid">

        <div class="container-fluid">

            <nav class="pull-left">
                <ul>
                    <li>
                        <a href="#">
                            Tecsoluction
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            Suporte
                        </a>
                    </li>


                    <li>
                        <a href="#">
                            Portfolio
                        </a>
                    </li>


                    <li>
                        <a href="#">
                            Site
                        </a>
                    </li>

                </ul>
            </nav>
            <p class="copyright pull-right">
                &copy;
                <script>
                    document.write(new Date().getFullYear())
                </script>
                <a href="http://www.tecsoluction.com">Tecsoluction</a>
            </p>




    <div id="script">
    
        <script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js" type="text/javascript"></script> 
        
     
<%-- <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js" type="text/javascript"></script> --%>

<%--              <script src="${pageContext.request.contextPath}/resources/js/material.min.js" type="text/javascript" --%>
<!--         ></script> -->
        
              <script src="${pageContext.request.contextPath}/resources/js/material-dashboard.js" 
       ></script> 

<%--  <script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js" type="text/javascript"></script> --%>


<%--  <script src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.min.js" type="text/javascript"></script> --%>

 
<script src="${pageContext.request.contextPath}/resources/js/chartist.min.js" type="text/javascript"></script> 
 

        
<%--          <script src="${pageContext.request.contextPath}/resources/js/perfect-scrollbar.jquery.min.js" type="text/javascript" --%>
<!--           ></script>  -->
          
<%--              <script src="${pageContext.request.contextPath}/resources/js/bootstrap-notify.js" type="text/javascript" --%>
<!--       ></script> -->


<%-- <script src="${pageContext.request.contextPath}/resources/sass/material-dashboard.scss" ></script>  --%>


       
<!--        <script src="https://www.gstatic.com/charts/loader.js"></script> -->
       
<%--        <script src="${pageContext.request.contextPath}/resources/js/arrive.min.js"></script> --%>
       
<!--        																		maps			AIzaSyAEEHTuWU99vzB3diFQqZmbNki3xpWz2b8 -->
<!-- 																				matrix distance	AIzaSyDmetyiOpMKNnJtkmWEMVYduRKj5DSBXmY -->
        
        <script src="${pageContext.request.contextPath}/resources/js/demo.js" type="text/javascript"></script> 
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAEEHTuWU99vzB3diFQqZmbNki3xpWz2b8"></script>
       
       
       
        <script type="text/javascript">
        
        /*<![CDATA[*/

            $(document).ready(function () {
            	
            	  if ($('.main-panel > .content').length == 0) {
                      $('.main-panel').css('height', '100%');
                  }

                 
            	  $('.datepicker').datepicker({
                	  
                	format:'dd/mm/yyyy',
                  	weekStart:1,
                  	pickerPosition: 'top-right',
                  	orientation: "top right",
                  	minViewMode:1
                  		
                  });
                

                // Javascript method's body can be found in assets/js/demos.js
                demo.initDashboardPageCharts();
                  
                demo.initGoogleMaps();
                


            });
        
            /*]]>*/

        </script>

        
    <script type="text/javascript">
        // This function is called from the pop-up menus to transfer to
        // a different page. Ignore if the value returned is a null string:
        function goPage(newURL) {

            // if url is empty, skip the menu dividers and reset the menu selection to default
            if (newURL != "") {

                // if url is "-", it is this page -- reset the menu:
                if (newURL == "-") {
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
 


    <script type="text/javascript">

        function calculapagamento() {
            var valorpagamento = 0;
            $('.valorpagoform').each(function (i) {

                valorpagamento = parseInt($(this).val()) + valorpagamento;
            });
            $('#valorPago').val(valorpagamento); //fora do loop


        }

        function calculaitem() {
            var qtd = 0;
            var valoritem = 0;
            var total = 0;
            $('.qtd').each(function (i) {

                qtd = parseInt($(this).val());

                $('.precounit').each(function (i) {

                    valoritem = parseInt($(this).val()) + valoritem;

                });


                total = qtd * valoritem;
            });
            $('.valoritemform').val(total); //fora do loop


        }


        function calculatotalitem() {
            var total = 0;
            $('.valoritemform').each(function (i) {


                total = parseInt($(this).val()) + total;
            });

            $('#precovenda').val(total); //fora do loop


        }

//         $(function () {
//             $('.table table-hover table-bordered data-table').searchable({
//                 striped: true,
//                 oddRow: {'background-color': '#f5f5f5'},
//                 evenRow: {'background-color': '#fff'},
//                 searchType: 'fuzzy'
//             });

//         });


    </script>

    <!-- Adicionando Javascript -->
    <script type="text/javascript">


        //alert("entrou now template");

        function limpa_formulario_cep() {
            //Limpa valores do formul�rio de cep.
            document.getElementById('logradouro').value = ("");
            document.getElementById('bairro').value = ("");
            document.getElementById('cidade').value = ("");
            document.getElementById('uf').value = ("");
            document.getElementById('ibge').value = ("");
        }

        function meu_callback(conteudo) {
            if (!("erro" in conteudo)) {
                //Atualiza os campos com os valores.
                document.getElementById('logradouro').value = (conteudo.logradouro);
                document.getElementById('bairro').value = (conteudo.bairro);
                document.getElementById('cidade').value = (conteudo.localidade);
                document.getElementById('uf').value = (conteudo.uf);
                document.getElementById('ibge').value = (conteudo.ibge);


            } //end if.


            else {
                //CEP n�o Encontrado.
                limpa_formulario_cep();
                alert("CEP não encontrado.");
            }
        }


        function pesquisacep(valor) {

            //Nova vari�vel "cep" somente com d�gitos.
            var cep = valor.replace(/\D/g, '');

            //Verifica se campo cep possui valor informado.
            if (cep != "") {

                //Express�o regular para validar o CEP.
                var validacep = /^[0-9]{8}$/;

                //Valida o formato do CEP.
                if (validacep.test(cep)) {

                    //Preenche os campos com "..." enquanto consulta webservice.
                    document.getElementById('logradouro').value = "...";
                    document.getElementById('bairro').value = "...";
                    document.getElementById('cidade').value = "...";
                    document.getElementById('uf').value = "...";
                    document.getElementById('ibge').value = "...";

                    //Cria um elemento javascript.
                    var script = document.createElement('script');

                    //Sincroniza com o callback.
                    script.src = '//viacep.com.br/ws/' + cep + '/json/?callback=meu_callback';

                    //Insere script no documento e carrega o conte�do.
                    document.body.appendChild(script);

                } //end if.
                else {
                    //cep é inválido.
                    limpa_formulario_cep();
                    alert("Formato de CEP inválido.");
                }
            } //end if.
            else {
                //cep sem valor, limpa formul�rio.
                limpa_formulario_cep();
            }
        }


    </script>


    <script type="text/javascript">
       
    /*<![CDATA[*/

        $(document).ready(function () {


            $('#menu li a').click(function () {


                $('#menu li').removeClass('active');
//                 $(this).closest("li").addClass('active');
                $(this).addClass('active');



            });
            
            


//             $(function () {
//                 $('.table table-hover table-bordered data-table').searchable({
//                     striped: true,
//                     oddRow: {'background-color': '#red'},
//                     evenRow: {'background-color': '#fff'},
//                     searchType: 'fuzzy'
//                 });

//                 $('#searchable-container').searchable({
//                     searchField: '#container-search',
//                     selector: '.row',
//                     childSelector: '.col-xs-4',
//                     show: function (elem) {
//                         elem.slideDown(100);
//                     },
//                     hide: function (elem) {
//                         elem.slideUp(100);
//                     }
//                 })
//             });


        });


        /*]]>*/


    </script>
    
    </div>

    </div>
    </div>


</footer>
