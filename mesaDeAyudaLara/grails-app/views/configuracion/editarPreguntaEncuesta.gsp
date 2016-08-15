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
            <h1>Configuración de Encuesta <small>${unidadDeUsuario?.unidad}</small></h1>
        </div>
        
        
        <div class="col-md-12  bootstrap-grid">
            <div class="powerwidget green" id="most-form-elements" data-widget-editbutton="false">
              <header>
                <h2>Alta de Pregunta <small>${encuesta}</small></h2>
              </header>
              

              
              
              <div class="inner-spacer">
                  
                  
                  <g:if test="${fail}">
                      <div class="callout callout-danger">
                          <h4>Error</h4>
                          <p><b>${fail}</b></p>
                      </div>                                
                  </g:if> 
                  
                <g:form  url="[controller: 'configuracion', action:'actualizarPreguntaEncuesta']" class="orb-form">  
                    <fieldset>
                    <section>
                      <label class="label">Encuesta</label>
                      <label class="input">
                          <input type="text" value="${encuesta}" readonly="true">
                          <input type="hidden" value="${pregunta?.id}" name="idPregunta">
                      </label>
                    </section>


                  </fieldset>
                  <fieldset>
                    <section>
                      <label class="label">Pregunta</label>
                      <label class="input">
                          <input type="text" name="pregunta" required="true" value="${pregunta?.pregunta}">
                      </label>
                    </section>
                  </fieldset> 
                  <fieldset>
                    <section>
                      <label class="label">Rubro</label>
                      <label class="select">                         
                          <g:select id="rubro" name="rubro" from="${mx.gob.ifr.rt.RubrosDeEncuesta.findAllByEncuesta(encuesta)}" optionKey="id" required="" value="${pregunta?.rubro?.id}" class="many-to-one"/>
                      </label>
                    </section>
                  </fieldset>
                  <fieldset>
                    <section>
                      <div class="row">
                        <div class="col col-4">
                          <label class="checkbox">
                              <g:if test="${pregunta?.activo==true}">
                                  <input type="checkbox" name="activo" checked="true">
                                  </g:if>
                              <g:else>
                                  <input type="checkbox" name="activo">
                              </g:else>

                            <i></i>Pregunta Activa</label>
                        </div>                       
                      </div>
                    </section>
                  </fieldset>
                  
                  <footer>
                    <button type="submit" class="btn btn-success">Agregar Pregunta</button>
                  </footer>
                </g:form>
              </div>
            </div>
          </div>
        
    </body>
</html>
