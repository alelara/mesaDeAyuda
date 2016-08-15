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
            <h1>Utilidades <small>${usuario?.nombre}</small></h1>
        </div>
        
        
        
        <div class="col-md-12  bootstrap-grid">
            <div class="powerwidget green" id="most-form-elements" data-widget-editbutton="false">
              <header>
                <h2>Cambiar contraseña</h2>
              </header>
              

              
              
              <div class="inner-spacer">
                  
                  
                  <g:if test="${fail}">
                      <div class="callout callout-danger">
                          <h4>Error</h4>
                          <p><b>${fail}</b></p>
                      </div>                                
                  </g:if> 

                <g:formRemote  url="[controller: 'solicitudDeCaso', action:'cambiarPassword']" class="orb-form" update="updateArea" name="updatePassword"> 
                    <input type="hidden" name="idUser" value="${usuario?.id}">
                  <fieldset>
                    <section>
                      <label class="label">Contraseña Nueva</label>
                      <label class="input">
                          <input type="password" name="passwdNueva" required="true" placeholder="Ingrese contraseña nueva">
                      </label>
                    </section>
                  </fieldset> 
                      <fieldset>
                    <section>
                      <label class="label">Repite Contrseña Nueva</label>
                      <label class="input">
                          <input type="password" name="passwdNuevaConf" required="true" placeholder="Repetir contraseña nueva">
                      </label>
                    </section>
                  </fieldset>
                               
                  <footer>
                    <g:submitButton  class="btn btn-success" name="update" value="Actualizar Contraseña" onclick="return confirm('¿Esta seguro(a) que todos los datos son correctos?')"/>
                    <br> <br>
                    <div id="updateArea" style="color: #575d63; font-weight: bold;"></div>
                  </footer>
                </g:formRemote>
              </div>
              
               
              
              
            </div>
            
          
            
          </div>
        
        
    </body>
</html>