 <!-- New widget -->
            
            <div class="powerwidget green" id="tooltips" data-widget-editbutton="false">
              <header>
                <h2>Crear Ticket <small>paso 3 </small></h2>
              </header>
              <div class="inner-spacer">
                           <g:uploadForm name="capturarTicket" url="[controller: 'solicitudDeCaso', action:'saveTicket']" class="orb-form">  
                  <input type="hidden" name="idCategoria" value="${categoria?.id}">
                  <input type="hidden" name="valores.0" value="0">
                  <fieldset> 
                        <section>  
                   <h4>Unidad Administrativa Destino<small>${categoria?.unidadAdministrativaResponsable}</small></h4><br>
                   <h4>Problema<small>${categoria}</small></h4><br>
                   <h4>Unidad Administrativa Remitente<small>${unidadDeUsuario?.unidad}</small></h4>
                        </section>
                   </fieldset>  
                   <fieldset> 
                     <g:each in="${datosRequeridos}" name="datos">  
                    <section>
                      <label class="label">${it}<g:if test="${it?.obligatorio==true}"><span style="color:red;">&nbsp*</span></g:if></label>
                      <label class="input"> <i class="icon-prepend fa fa-pencil-square"></i>
                          
                      <g:if test="${it?.tipoDeDato=='int'}">
                          <g:if test="${it?.obligatorio}">
                              <input id="prependedtext" class="form-control"  name="valores.${it?.id}" placeholder="Ingresa el dato solicitado [0-9]" type="text" pattern="[0-9]*" required="true">
                          </g:if>
                          <g:else>
                              <input id="prependedtext" class="form-control"  name="valores.${it?.id}" placeholder="Ingresa el dato solicitado [0-9]" type="text" pattern="[0-9]*">
                          </g:else>
                      </g:if>                      
                      <g:if test="${it?.tipoDeDato=='correo'}">
                          <g:if test="${it?.obligatorio}">
                              <input id="prependedtext" class="form-control"  name="valores.${it?.id}" placeholder="tucorreoelectronico@ejemplo.com" type="email" title="Ingresa un correo valido, ya que a este correo se le hara llegar la nueva contraseña" required="true">
                          </g:if>
                          <g:else>
                              <input id="prependedtext" class="form-control"  name="valores.${it?.id}" placeholder="tucorreoelectronico@ejemplo.com" type="email"  title="Ingresa un correo valido, ya que a este correo se le hara llegar la nueva contraseña"  pattern="[0-9]*">
                          </g:else>
                      </g:if>   
                      <g:if test="${it?.tipoDeDato=='linea'}"> 
                          <g:if test="${it?.obligatorio}">
                              <input id="prependedtext" class="form-control" name="valores.${it?.id}" placeholder="Ingresa la linea de captura" type="text"  maxlength="23" required="true">
                          </g:if>
                          <g:else>
                              <input id="prependedtext" class="form-control" name="valores.${it?.id}" placeholder="Ingresa la linea de captura" type="text"  maxlength="23">
                          </g:else>
                      </g:if>
                      <g:if test="${it?.tipoDeDato=='varchar'}">
                      <g:if test="${it?.obligatorio}">
                              <input id="prependedtext"  class="form-control"  name="valores.${it?.id}" placeholder="Ingresa el dato solicitado [a-z]*" type="text"   maxlength="25" required="true">
                          </g:if>
                          <g:else> 
                              <input id="prependedtext"  class="form-control"  name="valores.${it?.id}" placeholder="Ingresa el dato solicitado [a-z]*" maxlength="25" type="text" >
                          </g:else>
                      </g:if>
 
                       <g:if test="${it?.tipoDeDato=='impresora'}">
                      <g:if test="${it?.obligatorio}"> 
                              <g:select  name="valores.${it?.id}" from="${impresoras}"  class="form-control" required="true"/>
                          </g:if>
                          <g:else> 
                              <g:select  name="valores.${it?.id}" from="${impresoras}" class="form-control" />
                          </g:else>
                      </g:if>

                        <b class="tooltip tooltip-left"></b> </label>
                    </section>
                      </g:each>
                  </fieldset>
                  <fieldset>
                    <section>
                      <label class="label">Ingresa la descripcion Del Problema</label>
                      <label class="textarea"> <i class="icon-append fa fa-question"></i>
                        <textarea rows="3" placeholder="descripcion del problema" maxlength="256" name="descripcionDelProblema" ></textarea>
                        <b class="tooltip tooltip-top-right">En este apartado podras describir a detalle el problema que presentas.</b> </label>
                    </section>                   
                  </fieldset>  
                  <fieldset>
                    <section>
                      <label class="label">Adjuntar Archivos</label>
                        <div  class="orb-form">
                            <div  class="input input-file">
                                <input type="file" id="file" name="file">
                            </div> 
                        </div> 
                    </section>                   
                  </fieldset>
                  <footer>
                    <button type="submit" class="btn btn-success" id="crearTicket" onclick="return confirm('¿Todos los datos ingreados son los correctos?')">Crear Ticket</button>
                  </footer>
                </g:uploadForm>
              </div>
            </div>
          </div>
          <!-- End powerwidget -->

                         
                         