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
            <li class="active">Configuración de Usuarios</li>
          </ul>
        </div>
        <!--/Breadcrumb-->
        
        <div class="page-header">
            <h1>Configuración de Unidades Administrativas <small>${unidadDeUsuario?.unidad}</small></h1>
        </div>
        
        <!-- Widget Row Start grid -->
        <div class="row" id="powerwidgets">
          <div class="col-md-12 bootstrap-grid"> 


            <div class="powerwidget cold-grey"  data-widget-editbutton="false">
              <header>
                <h2>Lista de Unidades Administrativas</h2>
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
                      <th style="text-align: center;">Nombre</th>
                      <th>Clave</th>
                      <th>Tipo</th>
                      <th>Número</th>
                      <th>Extensión</th>
                      <th>Editar</th>
                    </tr>
                  </thead>
                  <tbody>
                  <% int x=0;%>    
                      <g:each in="${unidades}" var="unidad">
                        <tr >
                          <td style="text-align: left;">
                            ${unidad?.nombre}
                          </td>  
                          <td>${unidad?.clave}</td>
                          <td>${unidad?.tipo}</td>
                          <td>${unidad.numero ? unidad.numero : '----'}</td>
                          <td>${unidad.extension ? unidad?.extension : '----'}</td>
                          <td style="text-align: left;">
                              <a href="${createLink(controller:'configuracion', action:'editarUnidad', params:['idUnidad':unidad?.id])}" class="btn btn-default" ><i class="fa fa-pencil-square"></i> Editar</a>    
                          </td>
                         
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