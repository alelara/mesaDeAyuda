     
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="layout" content="rt"/>

  
    </head>
    <body>
                  <div class="breadcrumb clearfix">
        <ul>
            <li><a href="${createLink(controller:'solicitudDeCaso', action:'bandejaDeCasos')}"><i class="fa fa-home"></i></a></li>
          <li><a href="index.html">EStadisticas</a></li>
          <li class="active">${unidadDeUsuario?.unidad}</li>
        </ul>
      </div>
      

          <div class="col-md-12  bootstrap-grid">
              <div class="powerwidget green" id="most-form-elements" data-widget-editbutton="false">
                  <header>
                      <h2>Estadísticas<small>Rangos de Fechas</small></h2>
                  </header>
                  <div class="inner-spacer">                  
                      <g:if test="${fail}">
                          <div class="callout callout-danger">
                              <h4>Error</h4>
                              <p><b>${fail}</b></p>
                          </div>                                
                      </g:if>                   
                      <g:form  url="[controller: 'estadistica', action:'generarEstadisticaConfigurable']" class="orb-form" name="estadostica">  
                          <fieldset class="col-12">
                              <section class="col-12  bootstrap-grid">
                                  <label class="label">Fecha Inicial</label>
                                  <label class="input">
                                      <input type="text" name="fechaInicio" id="fechaInicio" value="${fechaInicial}" required="true">   
                                  </label>
                              </section>
                              <section class="col-12 bootstrap-grid">
                                  <label class="label">Fecha Final</label>
                                  <label class="input">
                                      <input type="text" name="fechaFin" id="fechaFin" value="${fechaFin}"  required="true">
                                  </label>
                              </section>
                          </fieldset>
                          <footer>
                              <button type="submit" class="btn btn-success"><i class="entypo-chart-pie"></i> Generar Estadística</button>
                          </footer>
                      </g:form>
                  </div>
              </div> 
  
     
     
     
     <!-- New widget -->
          <div class="powerwidget powerwidget-as-portlet-white"  data-widget-editbutton="false">
            <header>
              <h2>${periodo}<small>${unidadDeUsuario?.unidad}</small></h2>
            </header>
            <br>
            <div class="inner-spacer">
              <div class="row"> 
                <!--Row-->
                <ul class="tiny-stats">
                  <li class="col-md-4 col-sm-4 col-xs-6">
                    <div class="statistic clearfix">
                      <div class="easy-pie-chart-container"><span class="chart" id="easy2" data-percent="${objetivo}"> <span class="percent"></span> <i class="entypo-trophy"></i></span></div>
                      <h5>Objetivo</h5>
                    </div>
                  </li>
                  <li class="col-md-4 col-sm-4 col-xs-6">
                    <div class="statistic clearfix">
                      <div class="easy-pie-chart-container"><span class="chart" id="easy3" data-percent="${proceso}"> <span class="percent"></span> <i class="entypo-cog"></i></span></div>
                      <h5>Proceso</h5>
                    </div>
                  </li>
                  <li class="col-md-4 col-sm-4 col-xs-6">
                    <div class="statistic clearfix">
                      <div class="easy-pie-chart-container"><span class="chart" id="easy4" data-percent="${servicio}"> <span class="percent"></span> <i class="entypo-check"></i></span></div>
                      <h5>Servicio</h5>
                    </div>
                  </li>
                </ul>
              </div>
              <!--/Row-->               
            </div>
          </div>

        <div class="col-md-12 bootstrap-grid"> 
          <!-- New widget -->
          <div class="powerwidget powerwidget-as-portlet-white" id="chartjsgraphs-index-2" data-widget-editbutton="false">
            <header>
              <h2>Detalles de los Casos del ${periodo}</h2>
            </header>
            <div class="inner-spacer">
              <div class="row">
                <div class="col-md-12 text-center">
                  <canvas id="chartjs-doughnut3" height="170" width="170"></canvas>
                  <h1 class="colossal"><i class="fa fa-archive"></i>${total} casos</h1>
                </div>
                <div class="col-md-6 col-sm-6 col-xs-6 text-center">
                  <h3 class="margin-0px margin-top">${nuevos}</h3>
                  <span class="label bg-red"><strong>Nuevos</strong> <i class="fa fa-chevron-circle-up"></i></span> </div>
                <div class="col-md-6 col-sm-6 col-xs-6 text-center">
                  <h3 class="margin-0px margin-top">${seguimiento}</h3>
                  <span class="label bg-orange"><strong>Seguimiento</strong> <i class="fa fa-chevron-circle-up"></i></span> </div>
                <div class="col-md-6 col-sm-6 col-xs-6 text-center margin-bottom-20px">
                  <h3 class="margin-0px margin-top">${atendidos}</h3>
                  <span class="label bg-blue"><strong>Atendidos</strong> <i class="fa fa-chevron-circle-up"></i></span> </div>
                <div class="col-md-6 col-sm-6 col-xs-6 text-center margin-bottom-20px">
                  <h3 class="margin-0px margin-top">${cerrados}</h3>
                  <span class="label bg-green"><strong>Cerrados</strong> <i class="fa fa-chevron-circle-up"></i></span> </div>
              </div>
            </div>
          </div>
          <!-- /New widget --> 
        </div>

             </div>
               <script>
                   

$(function($){
    $.datepicker.regional['es'] = {
        closeText: 'Cerrar',
        prevText: 'Ant',
        nextText: 'Sig',
        currentText: 'Hoy',
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
        dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
        weekHeader: 'Sm',
        dateFormat: 'dd/mm/yy',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    };
    $.datepicker.setDefaults($.datepicker.regional['es']);
});
                   
                   
            jQuery(document).ready(function(){
                jQuery(function() {
                    jQuery.datepicker.setDefaults(jQuery.datepicker.regional["es"]);
                    jQuery('#fechaInicio').datepicker({
                    dateFormat: "dd/mm/yy",
                    controlType: 'select',
                    buttonImageOnly: false
                    });
                });   
                jQuery(function() {
                    jQuery.datepicker.setDefaults(jQuery.datepicker.regional["es"]);
                    jQuery('#fechaFin').datepicker({
                    dateFormat: "dd/mm/yy",
                    controlType: 'select',
                    buttonImageOnly: false
                    });
                });
            });
        </script>
           <script>
            //Donut on Index
        var doughnutData3 = [{
                value: ${nuevos},
                color: "#D24D33"
            }, {
                value: ${seguimiento},
                color: "#F0AD4E"
            }, {
                value: ${cerrados},
                color: "#82B964"
            }, {
                value: ${atendidos},
                color: "#55ACEE"
            }

        ];</script>
    </body>
</html>
