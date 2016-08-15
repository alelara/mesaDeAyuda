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
            <li class="active">Configuración de Impresora/Scanner</li>
          </ul>
        </div>
        <!--/Breadcrumb-->
        
        <div class="page-header">
            <h1>Configuración de Impresora/Scanner <small>${unidadDeUsuario?.unidad}</small></h1>
        </div>
        
        
        <div class="col-md-12  bootstrap-grid">
            <div class="powerwidget green" id="most-form-elements" data-widget-editbutton="false">
              <header>
                <h2>Editar de Impresora/Scanner</h2>
              </header>
              

              
              
              <div class="inner-spacer">
                  
                  
                  <g:if test="${fail}">
                      <div class="callout callout-danger">
                          <h4>Error</h4>
                          <p><b>${fail}</b></p>
                      </div>                                
                  </g:if> 
                  
                <g:form  url="[controller: 'configuracion', action:'updateImpresoraScanner']" class="orb-form">  
                    <fieldset>
                    <section>
                      <label class="label">Marca de Impresora/Scanner</label>
                      <label class="input">
                          <input type="text" name="marca" required="true" value="${dispositivo?.marca}">
                          <input type="hidden" name="idDispositivo" value="${dispositivo?.id}"> 
                      </label>
                    </section>


                  </fieldset>
                  <fieldset>
                    <section>
                      <label class="label">Modelo Impresora/Scanner</label>
                      <label class="input">
                          <input type="text" name="modelo" required="true" value="${dispositivo?.modelo}">
                      </label>
                    </section>


                  </fieldset>
                  <fieldset>
                    <section>
                      <label class="label">Tipo de Dispositivo</label>
                      <label class="select">
                          <select name="tipo" >
                              <g:if test="${dispositivo?.tipo=='IMPRESORA'}">
                                 <option value="impresora" selected>Impresora</option>
                                 <option value="scanner" >Scanner</option>
                            </g:if>
                            <g:if test="${dispositivo?.tipo=='SCANNER'}">
                                 <option value="impresora" >Impresora</option>
                                 <option value="scanner" selected>Scanner</option>
                            </g:if>
                        </select>
                        <i></i> </label>
                    </section>
                  </fieldset>

                  
                  <footer>
                    <button type="submit" class="btn btn-success">Actualizar Impresora/Scanner</button>
                  </footer>
                </g:form>
              </div>
            </div>
          </div>
        
    </body>
</html>
