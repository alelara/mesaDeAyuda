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
            <li class="active">Configuración de Categorias de Problemas</li>
          </ul>
        </div>
        <!--/Breadcrumb-->
        
        <div class="page-header">
            <h1>Configuración de Categorias <small>${unidadDeUsuario?.unidad}</small></h1>
        </div>
        
        <!-- Widget Row Start grid -->
        <div class="row" id="powerwidgets">
          <div class="col-md-12 bootstrap-grid"> 
            <!-- New widget -->
                   <div class="big-icons-buttons clearfix margin-bottom"> 
                       <a href="${createLink(controller:'configuracion', action:'altaDeCategoria')}" class="btn btn-sm btn-success"><i class="fa fa-bullhorn"></i>Nueva Categoria</a>                          
                   </div>
            <div class="powerwidget cold-grey"  data-widget-editbutton="false">
              <header>
                <h2>Categorias de la Unidad<small>${unidadDeUsuario?.unidad}</small></h2>
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
                      <th>Prioridad del Problema</th>
                      <th>Nombre del Problema</th>
                      <th>Area Responsable</th>
                      <th style="text-align: center;">Agregar Campo</th>
                      <th style="text-align: center;">Editar Ayuda</th>
                      <th style="text-align: center;">Editar Categoria</th>
                      <th style="text-align: center;">Campos Requeridos</th>
                    </tr>
                  </thead>
                  <tbody>
                  <% int x=0;%>    
                      <g:each in="${categorias}" var="categoria">
                        <tr >
                          <td style="text-align: center;">
                              
                                        <g:if test="${categoria?.prioridad?.id==1}">  
                                            <label class="btn btn-danger col-md-10"><i class="fa entypo-alert"></i> ${categoria?.prioridad} </label>
                                        </g:if>
                                        <g:if test="${categoria?.prioridad?.id==2}">  
                                            <label class="btn btn-warning col-md-10"><i class="fa entypo-attention"></i> ${categoria?.prioridad} </label>
                                        </g:if>
                                        <g:if test="${categoria?.prioridad?.id==3}">  
                                            <label class="btn btn-primary col-md-10"><i class="fa entypo-traffic-cone"></i> ${categoria?.prioridad} </label>
                                        </g:if>
                                        <g:if test="${categoria?.prioridad?.id==4}">  
                                            <label class="btn btn-info col-md-10"><i class="fa entypo-back-in-time"></i> ${categoria?.prioridad} </label>
                                        </g:if>
                                        <g:if test="${categoria?.prioridad?.id==5}">  
                                            <label class="btn btn-success col-md-10" ><i class="fa entypo-hourglass"></i> ${categoria?.prioridad} </label>
                                        </g:if>                         
                          </td>  
                          <td>${categoria?.nombre}</td>
                          <td>${categoria?.unidadAdministrativaResponsable}</td>
                          <td style="text-align: center;">
                              <a href="${createLink(controller:'configuracion', action:'altaDeCampo', params:['idCategoria':categoria?.id])}" class="btn btn-default" ><i class="fa fa-plus-circle"></i> Agregar Campo</a>    
                          </td>
                          <td style="text-align: center;"><a href="${createLink(controller:'configuracion', action:'editarWiki', params:['idCategoria':categoria?.id] )}" class="btn btn-info"><i class="fa fa-pencil-square"></i> Editar Wiki</a></td>
                          <td style="text-align: center;"><a href="${createLink(controller:'configuracion', action:'updateCategoria', params:['idCategoria':categoria?.id])}" class="btn btn-default" ><i class="fa fa-pencil-square"></i> Editar Categoria</a></td>    
                          <td style="text-align: center;"><button class="btn btn-success" onClick="verCampos(${x});"><i class="fa fa-check-square"></i> Ver Campos</button></td>                          
                        </tr>  
                        <tr id="verCampo-${x}"  class="datosRequeridos">
                            <td colspan="7">Campos Requeridos de la Categoria: <b>"${categoria?.nombre}"</b> <br><br>                                    
                              <g:if test="${mx.gob.ifr.rt.DatosRequeridos.findByCategoria(categoria)}">      
                                <table class="table table-dark margin-0px ">         
                                    <thead>
                                        <tr>
                                            <th style="text-align: left;">Nombre Campo</th>
                                            <th style="text-align: left;">Tipo De Dato</th>
                                            <th style="text-align: center;">Obligatorio</th>
                                            <th style="text-align: center;">Estado</th>
                                            <th style="text-align: center;">Editar</th>
                                        </tr>     
                                    </thead>
                                    <tbody>                                            
                                        <g:each in="${mx.gob.ifr.rt.DatosRequeridos.findAllByCategoria(categoria)}" var="campo">                                             
                                            <tr> 
                                                <td style="text-align: left;">${campo}</td>
                                                <td style="text-align: left;">${campo?.tipoDeDato}</td>
                                                <td style="text-align: center;">${campo?.obligatorio==true ? 'SI' : 'NO'}</td>
                                                <td style="text-align: center;">${campo?.activo==true ? 'Activo' : 'Inactivo'}</td>
                                                <td style="text-align: center;">        
                                                    <a href="${createLink(controller:'configuracion', action:'editarCampo', params:['idDato':campo?.id])}" class="btn btn-default"><i class="entypo-brush"></i></a></td>
                                            </tr>         
                                        </g:each>
                                      </tbody>
                                  </table>
                                </g:if>
                                <g:else>
                                    <div class="callout callout-danger">Se le informa <strong>que no hay campos registrados para esta categoria del problema.</strong> Si desea agregar algun campo, favor de dar click en el boton "Agregar Campo".</div>
                            </g:else>
                            <td>  
                        </tr> 
                        <% x++;%> 
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
