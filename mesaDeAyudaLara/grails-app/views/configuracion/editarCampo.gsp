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
            <li><a ><i class="fa fa-home"></i></a></li>
            <li><a href="${createLink(controller:'solicitudDeCaso', action:'bandejaDeCasos')}">Mesa de Ayuda</a></li>
            <li class="active">Configuración de Categorias de Problemas</li>
          </ul>
        </div>
        <!--/Breadcrumb-->
        
        <div class="page-header">
            <h1>Editar Dato Requerido<small>${unidadDeUsuario?.unidad}</small></h1>
        </div>
        

         <div class="col-md-12  bootstrap-grid">
            <div class="powerwidget green" id="most-form-elements" data-widget-editbutton="false">
              <header>
                <h2>Editar de Campo<small>${campo?.categoria} | ${campo}</small></h2>
              </header>
              

              
              
              <div class="inner-spacer">
                  
                  
                  <g:if test="${fail}">
                      <div class="callout callout-danger">
                          <h4>Error</h4>
                          <p><b>${fail}</b></p>
                      </div>                                
                  </g:if> 

                <g:form  url="[controller: 'configuracion', action:'updateDatoSolicitado']" class="orb-form"> 
                    <input type="hidden" name="idDato" value="${campo?.id}">
                    <fieldset>
                    <section>
                      <label class="label">Categoria Del Problema</label>
                      <label class="select">
                          <g:select id="categoria" name="categoriaId" from="${mx.gob.ifr.rt.CategoriaDelProblema.findAllByUnidadAdministrativaResponsable(unidadDeUsuario?.unidad)}" optionKey="id" required="" value="${campo?.categoria?.id}" class="many-to-one"/>
                      </label>
                    </section>


                  </fieldset>
                  <fieldset>
                    <section>
                      <label class="label">Nombre  del Campo</label>
                      <label class="input">
                          <input type="text" name="nombre" required="true" value="${campo?.nombreCampo}">
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
                      <label class="label">Opciones del Dato Requerido</label>
                      <div class="row">
                        <div class="col col-4">
                          <label class="checkbox">                          
                            <g:checkBox  name="activo" value="${campo?.activo}" />
                            <i></i>Activo</label>
                          <label class="checkbox">
                            <g:checkBox  name="required" value="${campo?.obligatorio}"/>
                            <i></i>Obligatorio</label>
                        </div>                       
                      </div>
                    </section>
                  </fieldset>
                  
                  <footer>                      <div class="callout callout-warning">
                          <h4>Advertencia</h4>
                          <p>Verifique que el tipo de dato sea el correcto.</p>
                      </div> 
                    <g:submitButton  class="btn btn-success" name="update" value="Actualizar Campo" onclick="return confirm('¿Esta seguro(a) que desea Actualizar el Resgistro?')"/>
                  </footer>
                </g:form>
              </div>
            </div>
          </div>
        
        
        
    </body>
</html>
