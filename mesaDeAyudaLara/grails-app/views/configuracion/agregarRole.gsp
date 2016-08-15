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
            <h1>Configuración de Usuarios<small>${unidadDeUsuario?.unidad}</small></h1>
        </div>
        
        
        
        <div class="col-md-12  bootstrap-grid">
            <div class="powerwidget green" id="most-form-elements" data-widget-editbutton="false">
              <header>
                <h2>Agregar Rol a Usuario</h2>
              </header>
              

              
              
              <div class="inner-spacer">
                  
                  
                  <g:if test="${fail}">
                      <div class="callout callout-danger">
                          <h4>Error</h4>
                          <p><b>${fail}</b></p>
                      </div>                                
                  </g:if> 

                <g:form  url="[controller: 'configuracion', action:'guardarRoleUsuario']" class="orb-form"> 
                    <fieldset>
                    <section>
                      <label class="label">Usuario</label>
                      <label class="select">
                          <g:select name="usuario" from="${usuarios}" optionKey="id" />
                      </label>
                    </section>
                  </fieldset> 

                  <fieldset>
                    <section>
                      <label class="label">Rol</label>
                      <label class="select">
                           <g:select name="rol" from="${roles}" optionKey="id" />
                      </label>
                    </section>
                  </fieldset> 
                                       
                  <footer>
                    <g:submitButton  class="btn btn-success" name="update" value="Agregar Rol a Usuario" onclick="return confirm('¿Esta seguro(a) que todos los datos son correctos?')"/>
                  </footer>
                </g:form>
              </div>
            </div>
          </div>
        
        
    </body>
</html>