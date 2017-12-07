<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page session="true" %>

<!-- <div class="row-fluid"> -->
<!-- <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Solu��es em Tecnologia</a> </div> -->
<!-- </div> -->


<footer id="footer">

    <div class="row">

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


        </div>

    </div>

    <div id="script">

        <script type="text/javascript">

            $(document).ready(function () {

                // Javascript method's body can be found in assets/js/demos.js
                demo.initDashboardPageCharts();

            });

        </script>

        <script type="text/javascript">
            /*<![CDATA[*/

            $(document).ready(function () {


                $('#menu li a').click(function () {


                    $('#menu').find('li.active').removeClass('active');
                    $(this).parents("li").addClass('active');


                });


                $(function () {
                    $('.table primary table-hover table-primary data-table').searchable({
                        striped: true,
                        oddRow: {'background-color': '#f5f5f5'},
                        evenRow: {'background-color': '#fff'},
                        searchType: 'fuzzy'
                    });

                    $('#searchable-container').searchable({
                        searchField: '#container-search',
                        selector: '.row',
                        childSelector: '.col-xs-4',
                        show: function (elem) {
                            elem.slideDown(100);
                        },
                        hide: function (elem) {
                            elem.slideUp(100);
                        }
                    })
                });


            });


            /*]]>*/


        </script>


        <!-- 					FIM    -->


        <!-- 					<script src="${pageContext.request.contextPath}/resourcesjs/smartresize.js" -->
        <!-- 			 src="@{${pageContext.request.contextPath}/resourcesjs/smartresize.js}"></script> -->


        <!-- 								<script src="${pageContext.request.contextPath}/resourcesjs/jquery.reverseorder.js" -->
        <!-- 			 src="@{${pageContext.request.contextPath}/resourcesjs/jquery.reverseorder.js}"></script> -->


        <!-- 								<script src="${pageContext.request.contextPath}/resourcesjs/jquery.equalizer.js" -->
        <!-- 			 src="@{${pageContext.request.contextPath}/resourcesjs/jquery.equalizer.js}"></script> -->


    </div>

</footer>

