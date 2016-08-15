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
            <li class="active">Alta de Registro de Atención Directa</li>
          </ul>
        </div>
        <!--/Breadcrumb-->
        
        <div class="page-header">
            <h1>Atención Directa <small>${unidadDeUsuario?.unidad}</small></h1>
        </div>
        
        
        <div class="col-md-12  bootstrap-grid">
            <div class="powerwidget green" id="most-form-elements" data-widget-editbutton="false">
              <header>
                <h2>Atención Directa<small>${tipo}</small></h2>
              </header>
              

              
              
              <div class="inner-spacer">
                  
                  
                  <g:if test="${fail}">
                      <div class="callout callout-danger">
                          <h4>Error</h4>
                          <p><b>${fail}</b></p>
                      </div>                                
                  </g:if> 
                  
                <g:form  url="[controller: 'configuracion', action:'saveAtencionDirecta']" class="orb-form">  
                    
                                      <fieldset>
                    <section>
                      <label class="label">Unidad Administrativa</label>
                      <label class="select">
                    <g:select id="area"  from="${areas}" optionKey="id"  optionValue="nombre"  name="unidad" placeholder="First name" style="width:100%;" required="true"/> 
                      </label>
                    </section>


                  </fieldset>
                    
                    
                    <fieldset>
                    <section>
                      <label class="label">
                          <g:if test="${teamViewer}">
                              Identificador de <b>TeamViewer</b>
                          </g:if>
                          <g:if test="${llamada}">
                              Número Telefónico
                          </g:if>
                          <g:if test="${sitio}">
                              Lugar de <b>Atención</b>
                          </g:if>
                      </label>    
                      <label class="input">
                          <g:if test="${teamViewer}">
                              <input type="hidden" name="tipo" value="teamViewer">
                              <input type="text" name="teamviewer" required="true" placeholder="Ingresa el numero de de id del teamviewer ..." maxlength="9" pattern="[0-9]*">
                          </g:if>
                          <g:if test="${llamada}"> 
                              <input type="hidden" name="tipo" value="llamada" >
                              <input type="text" name="llamada" required="true" placeholder="ingresa el número de telefono"  maxlength="10" pattern="[0-9]*" >
                          </g:if>
                          <g:if test="${sitio}">
                              <input type="hidden" name="tipo" value="sitio">
                              <input type="text" name="sitio" required="true" placeholder="Ingresa el nombre del sitio donde se presto el servicio">
                          </g:if>
                      </label>
                    </section>


                  </fieldset>
                  <fieldset>
                    <section>
                      <label class="label">Nombre del Usuario a quien se le proporciona la Atención</label>
                      <label class="input">
                          <input type="text" name="usuarioQueSeAtiende" required="true">
                      </label>
                    </section>


                  </fieldset>
                  <fieldset>
                    <section>
                      <label class="label">Descripcion Del Problema</label>
                      <label class="textarea"> <i class="icon-append fa fa-question"></i>
                        <textarea rows="3" placeholder="descripcion del problema" maxlength="256" name="descripcionDelProblema" ></textarea>
                        <b class="tooltip tooltip-top-right">En este apartado podras describir a detalle el problema que presenta el usuario final.</b> </label>
                    </section>
                  </fieldset>

   
                  <fieldset>
                                        <section>
                      <label class="label">Tipo de Problema/Categoria</label>
                      <label class="select">
                       <g:select id="area"  from="${topicos}" optionKey="id"  optionValue="nombre"  name="categoria" placeholder="First name" style="width:100%;" required="true"/> 
                      </label>
                      <div class="note"><strong>Nota:</strong> Selecciona el tipo de problema que mas se acerque al real.</div>
                    </section>
                  </fieldset>                  
                  <footer>
                    <button type="submit" class="btn btn-success">Crear Ticket de Atención Directa</button>
                  </footer>
                </g:form>
              </div>
            </div>
          </div>
        
    </body>
</html>
