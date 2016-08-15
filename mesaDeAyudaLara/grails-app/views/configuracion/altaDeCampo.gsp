<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="layout" content="rt"/>
    </head>
    <body>
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
        
        
        <div class="col-md-12  bootstrap-grid">
            <div class="powerwidget green" id="most-form-elements" data-widget-editbutton="false">
              <header>
                <h2>Alta de Campo<small>${categoria}</small></h2>
              </header>
              

              
              
              <div class="inner-spacer">
                  
                  
                  <g:if test="${fail}">
                      <div class="callout callout-danger">
                          <h4>Error</h4>
                          <p><b>${fail}</b></p>
                      </div>                                
                  </g:if> 
                  
                <g:form  url="[controller: 'configuracion', action:'saveDatoSolicitado']" class="orb-form">  
                    <fieldset>
                    <section>
                      <label class="label">Categoria Del Problema</label>
                      <label class="input">
                          <input type="text" value="${categoria}" readonly="true">
                          <input type="hidden" value="${categoria?.id}" name="idCategoria">
                      </label>
                    </section>


                  </fieldset>
                  <fieldset>
                    <section>
                      <label class="label">Nombre  del Campo</label>
                      <label class="input">
                          <input type="text" name="nombre" required="true">
                      </label>
                    </section>


                  </fieldset>
                  <fieldset>
                    <section>
                      <label class="label">Tipo de Dato</label>
                      <label class="select">
                          <select name="tipo">
                          <option value="int">Numérico</option>
                          <option value="varchar">Cadena de Texto</option>
                          <option value="linea">Linea de Captura</option>
                          <option value="correo">Correo Electrónico</option>
                          <option value="impresora">Impresora</option>
                        </select>
                        <i></i> </label>
                    </section>
                  </fieldset>

   
                  <fieldset>
                    <section>
                      <label class="label">Columned checkboxes</label>
                      <div class="row">
                        <div class="col col-4">
                          <label class="checkbox">
                            <input type="checkbox" name="activo" checked>
                            <i></i>Activo</label>
                          <label class="checkbox">
                            <input type="checkbox" name="required">
                            <i></i>Obligatorio</label>
                        </div>                       
                      </div>
                    </section>
                  </fieldset>
                  
                  <footer>
                    <button type="submit" class="btn btn-default">Agregar Campo</button>
                  </footer>
                </g:form>
              </div>
            </div>
          </div>
        
    </body>
</html>
