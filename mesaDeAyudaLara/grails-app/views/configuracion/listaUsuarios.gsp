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
            <h1>Configuración de Usuarios <small>${unidadDeUsuario?.unidad}</small></h1>
        </div>
        
        <!-- Widget Row Start grid -->
        <div class="row" id="powerwidgets">
          <div class="col-md-12 bootstrap-grid"> 
            <!-- New widget -->
                   <div class="big-icons-buttons clearfix margin-bottom">  <a href="${createLink(controller:'configuracion', action:'listaUnidades')}" class="btn btn-sm btn-success"><i class="fa fa-building"></i>Unidades Administrativas</a>
                       <a href="${createLink(controller:'configuracion', action:'altaDeUnidad')}" class="btn btn-sm btn-success"><i class="fa fa-institution"></i>Nueva Unidad Administrativa</a> 
     <a href="${createLink(controller:'configuracion', action:'nuevoUsuario')}" class="btn btn-sm btn-success"><i class="fa fa-user"></i>Nuevo Usuario</a>
       <a href="${createLink(controller:'configuracion', action:'agregarRole')}" class="btn btn-sm btn-success"><i class="fa fa-plus-square"></i>Agregar Rol a Usuario</a>
         <a href="${createLink(controller:'configuracion', action:'topicoImpresoraScanner')}" class="btn btn-sm btn-success"><i class="fa fa-print"></i>Impresora/Scanner</a>
                   </div>   

            <div class="powerwidget cold-grey"  data-widget-editbutton="false">
              <header>
                <h2>Lista de Usuarios</h2>
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
                      <th style="text-align: center;">Estado</th>
                      <th>Rol</th>
                      <th>Usuario</th>
                      <th>Nombre</th>
                      <th>Unidad Administrativa</th>
                      <th>Editar Usuario</th>
                    </tr>
                  </thead>
                  <tbody>
                  <% int x=0;%>    
                      <g:each in="${usuarios}" var="user">
                        <tr >
                          <td style="text-align: center;">
                              
                                        <g:if test="${user?.usuario?.enabled==true}">  
                                            <label class="btn btn-success col-md-10"><i class="fa fa-check-square"></i> Activo </label>
                                        </g:if>
                                        <g:if test="${user?.usuario?.enabled==false}">  
                                            <label class="btn btn-danger col-md-10"><i class="fa fa-minus-square"></i> Inactivo </label>
                                        </g:if>
                       
                          </td>  
                          <td>${mx.gob.ifr.seguridad.SecUsuarioSecRole.findBySecUsuario(user?.usuario)?.secRole}</td>
                          <td>${user?.usuario?.username}</td>
                          <td>${user?.usuario?.nombre}</td>
                          <td>${user?.unidad}</td>
                          <td style="text-align: left;">
                              <a href="${createLink(controller:'configuracion', action:'editarUsuario', params:['idUser':user?.usuario?.id])}" class="btn btn-default" ><i class="fa fa-pencil-square"></i> Editar</a>    
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