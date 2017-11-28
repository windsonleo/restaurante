<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ page session="true" %>


<div id="content">
	<div id="content-header">
		<div id="breadcrumb">
			<a href="${pageContext.request.contextPath}/caixa/movimentacao"
				title="Go to Caixa" class="tip-bottom"><i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/16/financeiro.png" /></i>
				Caixa</a> <a href="#"
				class="current">Caixa Rapido</a>
		</div>
<!-- 		<h1>Caixa Rï¿½pido</h1> -->
	</div>
	<div class="container-fluid">
		<hr>

		<c:if test="${erros != null }">
			<div class="alert alert-error alert-block">
				<a class="close" data-dismiss="alert" href="#">ï¿½</a>
				<h4 class="alert-heading">Erros!</h4>

				${erros}
			</div>

		</c:if>

		<c:if test="${mensagem != null }">
			<div class="alert alert-success alert-block">
				<a class="close" data-dismiss="alert" href="#">ï¿½</a>
				<h4 class="alert-heading">Sucesso!</h4>

				${mensagem}
			</div>

		</c:if>
		
		
		     <div class="row-fluid">
  
          <div class="widget-box widget-plain">
      <div class="center">
        <ul class="stat-boxes2">
          <li>
            <div class="left peity_bar_neutral"><span><span style="display: none;">2,4,9,7,12,10,12</span>
              <canvas width="50" height="24"></canvas>
              </span>+10%</div>
            <div class="right"> <strong>${pedidocomprasnovos.size()}</strong>Dinheiro </div>
          </li>
          <li>
            <div class="left peity_line_neutral"><span><span style="display: none;">10,15,8,14,13,10,10,15</span>
              <canvas width="50" height="24"></canvas>
              </span>10%</div>
            <div class="right"> <strong>${recebimentosnovos.size()}</strong> CCredito</div>
          </li>
          <li>
            <div class="left peity_bar_bad"><span><span style="display: none;">3,5,6,16,8,10,6</span>
              <canvas width="50" height="24"></canvas>
              </span>-40%</div>
            <div class="right"> <strong>${pedidovendasnovos.size()}</strong> CDebito</div>
          </li>
          <li>
            <div class="left peity_line_good"><span><span style="display: none;">12,6,9,23,14,10,17</span>
              <canvas width="50" height="24"></canvas>
              </span>+60%</div>
            <div class="right"> <strong>${clientesnovos.size()}</strong> Saldo Inicial</div>
          </li>
          <li>
            <div class="left peity_bar_good"><span>12,6,9,23,14,10,13</span>+30%
            
            </div>
            
            <div class="right"> <strong>${clientesnovos.size()}</strong> Despesas</div>
          </li>
        </ul>
      </div>
    </div>
    </div>
		
		
		<div class="row-fluid">
			<div class="span12">
				<div class="widget-box">
					<div class="widget-title">
						<span class="icon"> <i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/16/financeiro.png" /></i>
						</span>
						<h5>Caixa Rapido</h5>
					</div>
					<div class="widget-content nopadding">
					
				<div class="container-fluid">
                  
                   <div class="quick-actions_homepage">
          
		  				<ul class="quick-actions">

              
           					<c:forEach var="pv" items="${ls}" varStatus="status">
              
  
                				<li class="bg_ly">
                				   <a href="myAlert${pv.id}" data-toggle="modal" class="fa fa-remove">
                				
			       					<i class="icon-icon"><img src="${pageContext.request.contextPath}/resources/images/icons/32/venda.png" ></i>
         	
						         		 <div class="huge">${pv.id}</div>
						         		 <div>${pv.cliente}</div>
						         		 
						                 <div>${pv.mesa}</div>
						                  <div> ${pv.status}</div> 
						                 <div>  <label class="badge badge-info">${pv.origempedido}</label>  <div>
                                     	<span class="label label-success">${pv.items.size()}</span>


                                 </a>
                                 

                                      </li>
                                      
            <div id="myAlert${pv.id}" class="modal hide">
              <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button">×</button>
                <h3>Alerta de Mudanca de Status</h3>
              </div>
              <div class="modal-body">
                <p>Deseja Realmente Mudar o Staus desse Item</p>
              </div>
              <div class="modal-footer"> <a data-dismiss="" class="btn btn-danger" href="${pageContext.request.contextPath}/pv/pronto?id=${pv.id}">Confirma</a> <a data-dismiss="modal" class="btn" href="#">Cancela</a> </div>
           
            </div>
                                      

                </c:forEach>

			</ul>
          </div>
        </div>



					</div>
				</div>




			</div>


		</div>
	</div>
</div>


<div class="row-fluid">
  <div id="footer" class="span12"> 2017 &copy; Tecsoluction LTDA <a href="http://themedesigner.in">Soluï¿½ï¿½es em Tecnologia</a> </div>
</div>

