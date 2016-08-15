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
            <!--Breadcrumb-->
        <div class="breadcrumb clearfix">
          <ul>
            <li><a ><i class="fa fa-home"></i></a></li>
            <li><a href="${createLink(controller:'solicitudDeCaso', action:'bandejaDeCasos')}">Mesa de Ayuda</a></li>
            <li class="active">Configuración de Encuesta de la Unidad Administrativa</li>
          </ul>
        </div>
        <!--/Breadcrumb-->
        
        <div class="page-header">
            <h1>Configuración de Encuesta <small>${unidadDeUsuario?.unidad}</small></h1>
        </div>
        
        <!-- Widget Row Start grid -->
        <div class="row" id="powerwidgets">
          <div class="col-md-12 bootstrap-grid"> 
            <!-- New widget -->
                   <div class="big-icons-buttons clearfix margin-bottom"> 
                       <a href="${createLink(controller:'configuracion', action:'altaDePreguntaEncuesta')}" class="btn btn-sm btn-success"><i class="fa fa-bullhorn"></i>Añadir pregunta a la Encuesta</a>                          
                       <a href="${createLink(controller:'configuracion', action:'altaDeRubroEncuesta')}" class="btn btn-sm btn-success"><i class="fa fa-bookmark"></i>Añadir rubro a la Encuesta</a>                          
                 </div>
            <div class="powerwidget cold-grey"  data-widget-editbutton="false">
              <header>
                <h2>Encuesta<small>${unidadDeUsuario?.unidad}</small></h2>
              </header>
              <div class="inner-spacer">
                  
                                             <g:if test="${success}">                            
                                <div class="callout callout-info">
                                    <h4>Operacion Ejecutada Correctamente</h4>
                                    <p><b>${success}</b></p>
                                </div>  
                           </g:if>

                  
                  <g:if test="${fail}">
                      <div class="callout callout-danger">
                          <h4>Error</h4>
                          <p><b>${fail}</b></p>
                      </div>                                
                  </g:if> 
                  
                <table class="table table-striped table-hover margin-0px">
                  <thead>
                    <tr> 
                      <th>Pregunta</th>
                      <th>Rubro</th>
                      <th>Estado</th>
                      <th>Editar</th>
                    </tr>
                  </thead>
                  <tbody>  
                      <g:each in="${preguntas}" var="encuesta">
                        <tr>
                            <td>${encuesta?.pregunta}</td>
                            <td>${encuesta?.rubro}</td>
                            <td> 
                                <g:if test="${encuesta?.activo==true}"> <button class="btn btn-success"> &nbsp;Activo&nbsp;&nbsp; </button>  </g:if>
                                <g:else>     <button class="btn btn-danger">Inactivo</button>        </g:else>
                            </td>
                            <td> <a href="${createLink(controller:'configuracion',action:'editarPreguntaEncuesta', params:['idPregunta':encuesta?.id])}" class="btn btn-default">Editar Pregunta</a></td>
                        </tr>   
                    </g:each>                  
                  </tbody>
                </table>
              </div>
            </div> 
          </div>
            <!-- End .powerwidget --> 
          </div>

          
               <script>
                
                jQuery(".datosRequeridos").hide();
                
              function verCampos(i) {
                      jQuery("#verCampo-" + i).toggle();
              }
 
          </script>
    </body>
</html>
