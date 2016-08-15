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
        
        
        
        <div class="col-md-12  bootstrap-grid">
            <div class="powerwidget green" id="most-form-elements" data-widget-editbutton="false">
              <header>
                <h2>Crear  Unidad Administrativa</h2>
              </header>
              

              
              
              <div class="inner-spacer">
                  
                  
                  <g:if test="${fail}">
                      <div class="callout callout-danger">
                          <h4>Error</h4>
                          <p><b>${fail}</b></p>
                      </div>                                
                  </g:if> 

                <g:form  url="[controller: 'configuracion', action:'saveUnidad']" class="orb-form"> 
                    <input type="hidden" name="idUser" value="${user?.id}">
                    <fieldset>
                    <section>
                      <label class="label">Nombre</label>
                      <label class="input">
                          <input id="categoria" name="nombre" required="true" placeholder="Ingrese el nombre de la Unidad Administrativa"/>
                      </label>
                    </section>
                  </fieldset> 

                  <fieldset>
                    <section>
                      <label class="label">Tipo de Unidad</label>
                      <label class="input">
                          <input type="text" name="tipo" required="true" placeholder="Ingrese el tipo de unidad">
                      </label>
                    </section>
                  </fieldset> 
                      <fieldset>
                    <section>
                      <label class="label">Clave</label>
                      <label class="input">
                          <input type="text" name="clave" required="true" placeholder="Ingrese la clave de la unidad">
                      </label>
                    </section>
                  </fieldset>
                  <fieldset>
                    <section>
                      <label class="label">Nuemero Telefonico</label>
                      <label class="input">
                          <input type="text" name="numero" required="true" placeholder="Ingrese el numero telefonico">
                        <i></i> </label>
                    </section>
                  </fieldset>

                      <fieldset>
                    <section>
                      <label class="label">Extencion(es)</label>
                      <label class="input">
                          <input type="text" name="extension" placeholder="Ingrese el numero de extension(es) p.e. ext1, ext2, ext3 ...">
                     </label>
                    </section>
                  </fieldset>    
                      <fieldset>
                    <section>
                      <label class="label">Correo Electronico</label>
                      <label class="input">
                          <input type="text" name="correo" placeholder="Ingrese el electronico de la unidad p.e. or@ifrem.mx" required="true">
                     </label>
                    </section>
                  </fieldset>                   
                  <footer>
                    <g:submitButton  class="btn btn-success" name="update" value="Crear Unidad Administrativa" onclick="return confirm('¿Esta seguro(a) que todos los datos son correctos?')"/>
                  </footer>
                </g:form>
              </div>
            </div>
          </div>
        
        
    </body>
</html>