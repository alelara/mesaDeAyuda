<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

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

      
      
      
              <div class="row" id="powerwidgets">
          <div class="col-md-12 bootstrap-grid"> 
                <!-- New widget -->
          <div class="powerwidget"  data-widget-editbutton="false"> 
            <header>
              <h2>${periodo}<small>${unidadDeUsuario?.unidad}</small></h2>
            </header>

            <div class="inner-spacer">
              <div class="row"> 
                <!--Row-->
              <br><br>
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
           
                              <div class="powerwidget"  data-widget-editbutton="false">          
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
                    
        <!-- /Inner Row Col-md-4 -->
        

          
          <!-- New widget -->
          <div class="powerwidget powerwidget-as-portlet-white" id="social" data-widget-editbutton="false">
            <header>
              <h2>Grafica Anual <small>${unidadDeUsuario?.unidad}</small></h2>
            </header>
            <div class="inner-spacer">
              <div class="flotchart-container">
                <div id="placeholder8" class="flotchart-placeholder"></div>
              </div>
              <!--/Row-->               
            </div>
          </div>
          <!-- End Widget --> 
           

          
            
            
              
            
            <!-- New widget -->
            <div class="powerwidget powerwidget-as-portlet-white" id="darkportletdarktable" data-widget-editbutton="false">
              <header>
                <h2>Sistema de Gestion de Calidad<small>${unidadDeUsuario?.unidad}</small></h2>
              </header>
              <div class="inner-spacer">
                <table class="table-dark table table-striped table-bordered table-hover margin-0px">
                  <thead>
                    <tr>
                      <th width="30%" colspan="2">Periodo</th>
                      <th width="10%" style="text-align: center;">Objetivo</th>
                      <th width="10%" style="text-align: center;">Proceso</th>
                      <th width="10%" style="text-align: center;">Servicio</th>
                      <th width="5%" style="text-align: center;">Nuevos</th>
                      <th width="5%" style="text-align: center;">Seguimiento</th>
                      <th width="5%" style="text-align: center;">Atendidos</th>
                      <th width="5%" style="text-align: center;">Cerrados</th>
                      <th width="10%" style="text-align: center;">Total</th>
                      <th width="10%" style="text-align: center;">Grafica</th>
                    </tr>
                  </thead>
                  <tbody>
                  <%int z=1%>  
                  <%int tota=0%>
                  <%int tota2=0%>
                  <%int tota3=0%>
                  <%int tota4=0%>
                  <%int tota5=0%>
                  
                   <g:each name="mensualReport" in="${listaSGC}" var="mes">   
                    <tr>
                      <td width="1%"><span class="num">${z}</span></td>
                      <td ><h5>${mes?.periodo}</h5>
                        <small>${unidadDeUsuario?.unidad}</small></td>
                      <td style="text-align: center;">${mes?.objetivo}</td>
                      <td style="text-align: center;"> ${mes?.proceso}</td>
                      <td style="text-align: center;">${mes?.servicio}</td>
                      <td style="text-align: center;">${mes?.nuevos}</td>
                      <td style="text-align: center;">${mes?.seguimiento}</td>
                      <td style="text-align: center;">${mes?.atendidos}</td>
                      <td style="text-align: center;">${mes?.cerrados}</td>
                      <td style="text-align: center;">${mes?.total}</td>
                      <td class="text-center"><span class="table-sparkline-pie">${mes?.nuevos},${mes?.seguimiento},${mes?.atendidos},${mes?.cerrados}</span></td>
                    </tr>
                    <%tota=mes?.totalAnual%>
                    <%tota2=mes?.totalNuevos%>
                    <%tota3=mes?.totalSeguimiento%>
                    <%tota4=mes?.totalAtendido%>
                    <%tota5=mes?.totalCerrados%>
                    <%z++;%>
                    </g:each>
                  </tbody>
                  <tfoot>
                    <tr>
                      <th width="30%" colspan="2">Periodo</th>
                      <th width="10%" style="text-align: center;">Objetivo</th>
                      <th width="10%" style="text-align: center;">Proceso</th>
                      <th width="10%" style="text-align: center;">Servicio</th>
                      <th width="5%" style="text-align: center;">${tota2}</th>
                      <th width="5%" style="text-align: center;">${tota3}</th>
                      <th width="5%" style="text-align: center;">${tota4}</th>
                      <th width="5%" style="text-align: center;">${tota5}</th>
                      <th width="10%" style="text-align: center;">${tota}</th>
                      <th width="10%" style="text-align: center;">Grafica</th>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>  
   
            
            <!-- New widget -->
            <div class="powerwidget powerwidget-as-portlet-white" id="darkportletdarktable" data-widget-editbutton="false">
              <header>
              <h2>Casos por Unidades del Instituto de la Función Registral del Estado de México<small>${unidadDeUsuario?.unidad}</small></h2>
              </header>
              <div class="inner-spacer">
                <table class="table-dark table table-striped table-bordered table-hover margin-0px">
                  <thead> 
                       <tr>
                      <th width="30%" colspan="2">Unidad</th>
                      <th width="10%" style="text-align: center;">Nuevos</th>
                      <th width="10%" style="text-align: center;">Seguimiento</th>
                      <th width="10%" style="text-align: center;">Atendido</th>
                      <th width="5%" style="text-align: center;">Cerrado</th>
                      <th width="9%" style="text-align: center;">Total</th>
                      <th width="11%" style="text-align: center;">Grafica</th>
                      <th width="15%" style="text-align: center;">Grafica</th>
                    </tr>
                  </thead>
                  <tbody>
                <%int auxiliar=1;%>  
                <%int full=0;%>                 
                <%int creadosTo=0;%>   
                <%int seguiTo=0;%>   
                <%int cerradoTo=0;%> 
                <%int atendidoTo=0;%>
                                     
                   <g:each name="mensualReport" in="${listaArea}" var="unidad">  
                    <tr>
                      <td width="1%"><span class="num">${auxiliar}</span></td>
                      <td><h5>${unidad?.unidad}</h5>
                        <small></small></td>
                      <td style="text-align: center;">${unidad?.creados}</td>
                      <td style="text-align: center;"> ${unidad?.seguimiento}</td>
                      <td style="text-align: center;">${unidad?.atendidos}</td>
                      <td style="text-align: center;">${unidad?.cerrados}</td>
                      <td style="text-align: center;">${unidad?.total}</td>
                      <td class="text-center"><span class="table-sparkline-pie">${unidad?.creados},${unidad?.seguimiento},${unidad?.atendidos},${unidad?.cerrados}</span></td>
                      <td class="text-center"><span class="table-sparkline-lines">${unidad?.detalleAnual}</span></td>
                    </tr>
                    <%full=full+unidad?.total;%>
                    <%creadosTo=creadosTo+unidad?.creados; %>
                   <%seguiTo=seguiTo+unidad?.seguimiento;%>
                    <%cerradoTo=cerradoTo+unidad?.cerrados;%>
                    <%atendidoTo=atendidoTo+unidad?.atendidos;%>
                       <%auxiliar++;%>
 </g:each>
                  </tbody>
                  <tfoot>
                    <tr>
                             <th width="30%" colspan="2">Unidad</th>
                      <th width="10%" style="text-align: center;">${creadosTo}</th>
                      <th width="10%" style="text-align: center;">${seguiTo}</th>
                      <th width="10%" style="text-align: center;">${atendidoTo}</th>
                      <th width="5%" style="text-align: center;">${cerradoTo}</th>
                      <th width="9%" style="text-align: center;">${full}</th>
                      <th width="11%" style="text-align: center;">Grafica</th>
                      <th width="15%" style="text-align: center;">Grafica</th>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>

            <!-- New widget -->
            <div class="powerwidget powerwidget-as-portlet-white" id="darkportletdarktable" data-widget-editbutton="false">
              <header>
              <h2>Frecuencia de Casos por Categorias de Problemas<small>${unidadDeUsuario?.unidad}</small></h2>
              </header>
              <div class="inner-spacer">
                <table class="table-dark table table-striped table-bordered table-hover margin-0px">
                  <thead> 
                       <tr>
                      <th width="30%" colspan="2">Categoria Del Problema</th>
                      <th width="10%" style="text-align: center;">Número de Casos</th>
                      <th width="10%" style="text-align: center;">Porcentaje</th>
                    </tr>
                  </thead>
                  <tbody>
                <%int auxiliar2=1;%>        
                <%int totalCasos=0%>
                   <g:each name="mensualReport" in="${topicoCount}" var="frecuencia">  
                    <tr>
                      <td width="1%"><span class="num">${auxiliar2}</span></td>
                      <td><h5>${frecuencia?.topico}</h5>
                        <small></small></td>
                      <td style="text-align: center;">${frecuencia?.numero}</td>
                      <td style="text-align: center;">
                        <g:if test="${frecuencia?.porcentaje > 50}">
                        <label class="label label-danger">${frecuencia?.porcentaje} % </td></label>
                        </g:if>
                        <g:else>
                            <g:if test="${frecuencia?.porcentaje > 20}">    
                                    <label class="label label-primary">${frecuencia?.porcentaje} % </td></label> 
                            </g:if>
                            <g:if test="${frecuencia?.porcentaje < 20}">    
                                    <label class="label label-success">${frecuencia?.porcentaje} % </td></label> 
                            </g:if>
                            
                        </g:else>    
                    </tr>
                       <%auxiliar2++;%>
                       <%totalCasos=totalCasos+frecuencia?.numero%>
                    </g:each>
                  </tbody>
                  <tfoot>
                    <tr>
                             <th width="30%" colspan="2">Categoria de Problema</th>
                      <th width="10%" style="text-align: center;">Total de Casos: ${totalCasos}</th>
                      <th width="10%" style="text-align: center;">%</th>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </div>
          </div>                 
       </div>                 

<script>
          
if ($("#placeholder8").length) {

            var creados = ${creadosAnual};
            
            var seguimiento = ${creadosSeguimiento};

            var atendidos = ${creadosAtendido};

            var concluidos =${creadosCerrado} ;




            $.plot($("#placeholder8"), [{
                    data: creados,
                    label: "Creados"
                }, {
                    data: seguimiento,
                    label: "Seguimiento"
                }, {
                    data: atendidos,
                    label: "Atendidos"
                },

 

                {
                    data: concluidos,
                    label: "Concluidos"
                },






            ], {
                series: {
                    lines: {
                        show: true,
                        lineWidth: 7,
                        fill: true,
                        fillColor: "rgba(255,255,255, 0.2)"
                    },

                    points: {
                        show: true,
                        fillColor: "#fff",
                        lineWidth: 3,
                        radius: 5
                    },
                    shadowSize: 0,
                    stack: true
                },


                tooltip: true,
                tooltipOpts: {
                    content: "%y Refs"
                },

                grid: {
                    hoverable: true,
                    clickable: true,

                    borderWidth: 0
                },

                legend: {
                    noColumns: 3,
                    margin: -10,
                    color: '#555',
                    backgroundColor: '#fff',
                    backgroundOpacity: 1,
                    position: "nw"
                },


                colors: ["#cb2027", "#F0AD4E", "#55ACEE", "#82B964"],
                xaxis: {
                    color: "rgba(0,0,0,.1)",
                    ticks: [
                        [1, "ENE"],
                        [2, "FEB"],
                        [3, "MAR"],
                        [4, "ABR"],
                        [5, "MAY"],
                        [6, "JUN"],
                        [7, "JUL"],
                        [8, "AGO"],
                        [9, "SEP"],
                        [10, "OCT"],
                        [11, "NOV"],
                        [12, "DIC"]
                    ],
                    font: {
                        color: "#8b8f94",
                        size: 11,
                        family: "Open Sans, sans-serif",
                    }
                },
                yaxis: {
                    color: "rgba(255,255,255,0.4)",
                    ticks: 5,
                    show: false,
                    tickDecimals: 0,
                    font: {
                        color: "#fff",
                        size: 11,
                    }
                }
            });
        }

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
    
    
    <script>
    
          if (document.getElementById('morris-line')) {

            var x = document.getElementById("datosGra").value;
            

          var week_data = document.getElementById("datosGra").value;

            Morris.Line({
                element: 'morris-line',
                lineWidth: '12',
                gridTextColor: '#fff',
                pointStrokeWidth: '3',
                gridTextFamily: 'Open Sans, sans-serif',
                lineColors: ["#f4cc13", "#5bc0de", "#993838", "#ccd600", "f4b66d"],
                data: week_data,
                xkey: 'period',
                gridTextSize: 11,
                ykeys: ['objetivo', 'proceso', 'servicio'],
                labels: ['Objetivo', 'Proceso', 'Servicio']
            });

        }
    </script>    


    
      <script>  
             //Donut Demo
        var printthis;
        var x = document.getElementById("ticketProblemaDos").value;
        var z=utf8_encode(${ticketProblemaDos});
        alert(x);
        alert(z);
        var doughnutData = x;
        
        
      </script> 
     
    </body>
</html>
