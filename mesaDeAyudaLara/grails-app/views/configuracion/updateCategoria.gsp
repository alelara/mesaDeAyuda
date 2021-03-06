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
            <h1>Editar de Categoria del Problema<small>${unidadDeUsuario?.unidad}</small></h1>
        </div>
        
        
        
        
         <div class="col-md-12  bootstrap-grid">
            <div class="powerwidget green" id="most-form-elements" data-widget-editbutton="false">
              <header>
                <h2>Actualizar Categoria<small>${unidadDeUsuario?.unidad}</small></h2>
              </header>
              

              
              
              <div class="inner-spacer">
                  


                <g:form  url="[controller: 'configuracion', action:'actualizarCategoria']" class="orb-form"> 
                    <input type="hidden" name="idDato" value="${campo?.id}">
                    <fieldset>
                    <section>
                      <label class="label">Unidad Responsable</label>
                      <label class="input">
                          <input type="text" value="${unidadDeUsuario?.unidad}" readonly="true">
                          <input type="hidden" value="${categoria?.id}" name="idCategoria">
                      </label>
                    </section>


                  </fieldset>
                  <fieldset>
                    <section>
                      <label class="label">Nombre  de la Categoria</label>
                      <label class="input">
                          <input type="text" name="nombre" required="true" value="${categoria?.nombre}" >
                      </label>
                    </section>


                  </fieldset>       
                  <fieldset>
                     <section>
                      <label class="label">Descripción de la Categoria</label>
                      <label class="textarea"> <i class="icon-append fa fa-question"></i>
                          <textarea rows="3" name="descripcion" placeholder="Descripción breve de la problematica..." required="true">${categoria?.descripcion}</textarea>
                        <b class="tooltip tooltip-top-right">Decribe brevemente la problematica de esta caso nuevo...</b> </label>
                    </section>

                  </fieldset>
                  <fieldset>
                    <section>
                      <label class="label">Prioridad</label>
                      <label class="select">
                            	<g:select id="prioridad" name="prioridad" from="${mx.gob.ifr.rt.PrioridadDelProblema.list()}" optionKey="id" required="" value="${categoria?.prioridad?.id}" class="many-to-one"/>

                        <i></i> </label>
                    </section>
                  </fieldset>

   
                  <fieldset>
                    <section>
                      <label class="label">Opciones</label>
                      <div class="row">
                         
                        <div class="col col-5">
                          <label class="checkbox">                          
                            <g:checkBox  name="activo" value="${categoria?.activo}" />
                            <i></i>Activo</label>
                        </div>                       
                      </div>
                    </section>
                  </fieldset>
                  
                  <footer> 
                    <g:submitButton  class="btn btn-success" name="update" value="Actualizar Categoria" onclick="return confirm('¿Todos los datos son correctos?')"/>
                  </footer>
                </g:form>
              </div>
            </div>
          </div>
        
    </body>
</html>

