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
        
        
        
        <div class="col-md-12  bootstrap-grid">
            <div class="powerwidget green" id="most-form-elements" data-widget-editbutton="false">
              <header>
                <h2>Crear Usuario</h2>
              </header>
              

              
              
              <div class="inner-spacer">
                  
                  
                  <g:if test="${fail}">
                      <div class="callout callout-danger">
                          <h4>Error</h4>
                          <p><b>${fail}</b></p>
                      </div>                                
                  </g:if> 

                <g:form  url="[controller: 'configuracion', action:'saveUsuario']" class="orb-form"> 
                    <input type="hidden" name="idUser" value="${user?.id}">
                    <fieldset>
                    <section>
                      <label class="label">Nombre</label>
                      <label class="input">
                          <input id="categoria" name="nombre" required="true" value="${user?.nombre}"/>
                      </label>
                    </section>
                  </fieldset> 

                  <fieldset>
                    <section>
                      <label class="label">Usuario</label>
                      <label class="input">
                          <input type="text" name="username" required="true" value="${user?.username}">
                      </label>
                    </section>
                  </fieldset> 
                      <fieldset>
                    <section>
                      <label class="label">Contraseña</label>
                      <label class="input">
                          <input type="text" name="password" required="true" value="${user?.password}">
                      </label>
                    </section>
                  </fieldset>  
                  <fieldset>
                    <section>
                      <label class="label">Correo Electrónico</label>
                      <label class="input">
                          <input type="email" name="email" required="true" value="${user?.email}">
                      </label>
                    </section>
                  </fieldset>
                  <fieldset>
                    <section>
                      <label class="label">Tipo Usuario</label>
                      <label class="select">
                            <g:select id="cargo" name="cargoId" from="${mx.gob.ifr.rt.Cargo.list()}" optionKey="id" required="true" value="${usuarioInstance?.cargo?.id}" class="many-to-one"/>
                        <i></i> </label>
                    </section>
                  </fieldset>

                      <fieldset>
                    <section>
                      <label class="label">Unidad Administrativa</label>
                      <label class="select">
                        <g:select id="unidad" name="unidadId" from="${mx.gob.ifr.rt.UnidadAdministrativa.list()}" optionKey="id" required="true" value="${usuarioUnidadAdministrativaInstance?.unidad?.id}" class="many-to-one"/>
                     </label>
                    </section>
                  </fieldset>
   
                  <fieldset>
                    <section>
                      <label class="label">Opciones de Cuenta</label>
                      <div class="row">
                        <div class="col col-4">
                          <label class="checkbox">                          
                            <g:checkBox  name="activo" value="${user?.enabled}" />
                            <i></i>Activo</label>
                          <label class="checkbox">
                            <g:checkBox  name="passwordExpired" value="${user?.passwordExpired}"/>
                            <i></i>Contraseña Expirada</label> 
                            <label class="checkbox">
                            <g:checkBox  name="accountExpired" value="${user?.accountExpired}"/>
                            <i></i>Cuenta Expirada</label>
                                                        <label class="checkbox">
                            <g:checkBox  name="accountLocked" value="${user?.accountLocked}"/>
                            <i></i>Cuenta Bloqueada</label>
                        </div>                       
                      </div>
                    </section>
                  </fieldset>
                  
                  <footer>
                    <g:submitButton  class="btn btn-success" name="update" value="Crear Usuario" onclick="return confirm('¿Esta seguro(a) que todos los datos son correctos?')"/>
                  </footer>
                </g:form>
              </div>
            </div>
          </div>
        
        


        
    </body>
</html>