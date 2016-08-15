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
      

             <div class="col-md-12  bootstrap-grid">
            <div class="powerwidget green" id="most-form-elements" data-widget-editbutton="false">
              <header>
                <h2>Estadísticas de Encuestas<small>Rangos de Fechas</small></h2>
              </header>
              

              
              
              <div class="inner-spacer">                  
                                    <g:if test="${fail}">
                      <div class="callout callout-danger">
                          <h4>Error</h4>
                          <p><b>${fail}</b></p>
                      </div>                                
                  </g:if>                   
                <g:form url="[controller: 'estadistica', action:'generarEstadisticaDeEncuestaDinamica']" class="orb-form" update="estadistica" name="estadostica">  
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
                                <input type="text" name="fechaFin" id="fechaFin"  value="${fechaFin}" required="true">
                            </label>
                        </section>
                    </fieldset>
                  <footer>
                      <button type="submit" class="btn btn-success"><i class="entypo-chart-pie"></i> Generar Estadística de Encuestas</button>
                  </footer>
                </g:form>
              </div>
            </div>
                   <div id="estadistica"></div>
          </div>
          
        
        <!-- Widget Row Start grid -->
        <div class="row" id="powerwidgets">
          <div class="col-md-12 bootstrap-grid"> 
            
            <!-- New widget -->
            
            <div class="powerwidget"  data-widget-editbutton="false">
              <header>
                <h2>Encuesta de Satisfacción<small>Logica Borrosa ${unidadDeUsuario?.unidad} ( ${fechaInicial} - ${fechaFin})</small></h2>
              </header>
              <div class="inner-spacer">
            <g:if test="${encuestas}">      
               <div class="table-relative table-responsive">   
                <table class="table table-striped table-hover" >
                  <thead>
                    <tr>
                      <th>NÚMERO DE PREGUNTA</th>
                      <th colspan="${numeroDeEncuestas?.size() + 1}" style="text-align: center;">EQUIVALE A NÚMERO DE ENCUESTAS REALIZADAS</th>
                      <th></th>
                    </tr>
                    <tr>
                        <th></th>
                      <%int z=1;%>         
                      <g:each name="facilidadDeUso" in="${numeroDeEncuestas}">
                      <th>${z}</th>
                      <%z++;%>
                      </g:each>
                      <th>Suma</th>
                      <th>Promedio</th>
                    </tr>
                  </thead>
                  <tbody>
                      <g:each name="preguntas" in="${preguntas}" var="pregunta">
                        <tr>
                            <td>
                                ${pregunta}
                            </td>    
                              <g:each name="encuesta" in="${encuestas}" var="encuesta">
                                  <g:if test="${pregunta==encuesta?.pregunta}">
                                        <td>
                                                ${encuesta?.valor}
                                        </td>                                    
                                  </g:if>                            
                              </g:each> 
                              <g:each name="encuesta" in="${listaDePromedios}" var="promedio">
                                  <g:if test="${pregunta==promedio?.pregunta}">
                                      <td>${promedio?.suma}</td>
                                        <td>         
                                           <span class="label label-default"> ${promedio?.promedio} </span>
                                        </td>                                    
                                  </g:if>                            
                              </g:each>   
                        </tr>    
                      </g:each>  
                  </tbody>
                  <tfoot>
                    <tr>
                      <th>Ticket Número: </th>
                          <g:each name="facilidadDeUso" in="${numeroDeEncuestas}">
                            <th>${it?.id}</th>
                          </g:each> 
                      <th>Suma</th>
                      <th>Promedio</th>
                    </tr>
                  </tfoot>
                </table>
                </div>   
                <div class="table-relative table-responsive">   
                <table class="table table-striped table-hover" >
                  <thead>
                    <tr>
                      <th>Observaciones Realizadas</th>
                    </tr>
                  </thead>
                  <tbody>
                    <g:each name="observaciones" in="${observaciones}"> 
                            <g:if test="${it!=null}">
                    <tr>
                        <td> <i class="fa fa-slack"></i>  <span class="label label-default"> caso: ${it?.caso?.id}</span> ${it}</td>
                    </tr>
                        </g:if>
                    </g:each>
                </table>
                </div> 
                </g:if>
                <g:else>
                                    <div class="callout callout-danger">
                                        <h4>No se pudo generar la logica borrosa</h4>
                                        <p>En el rango de fechas ingresadas, no se encontraron encuestas de satisfación contestadas.</p>
                                    </div>                                

                </g:else>    
              </div>
            </div>
            <!-- End .powerwidget --> 
       
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
       
    </body>
</html>
