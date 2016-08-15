            <!--paso2 -->
             
                         <div class="powerwidget green"  data-widget-editbutton="false">
              <header>
                <h2>Repositorio de Ayuda<small>paso 2</small></h2>
              </header>
     <g:if test="${categoriaDelProblema}">       
              <div class="inner-spacer">
                <g:formRemote url="[controller: 'solicitudDeCaso', action:'crearTicket']"  name="mostrarFormulario" class="orb-form" update="repositotioAyuda">
                  <fieldset>
                    <section>
                                      <input id="codeHtml" type="hidden" value="${wiki}" />
                          <div id="wikipedia"></div>

                    </section>
                  </fieldset>
                  
                <fieldset>
                    <section>
                      <label class="label">¿Le ha sido útil esta información?</label>
                      <div class="inline-group">
                        <label class="radio">
                          <input type="radio" id="siRepo" name="radio-inline" >
                          <i></i>SI</label>
                        <label class="radio">
                          <input type="radio" id="noRepo" name="radio-inline">
                          <i></i>NO</label>
                      </div>
                    </section>
                  </fieldset>
                 
                  <footer>                      
                      <input type="hidden" name="idCategoria" value="${categoriaDelProblema?.id}">
                      <a href="${createLink(controller:'solicitudDeCaso', action:'bandejaDeCasos')}" class="btn btn-success" id="finalizarTicket" style="color: #FFF;">Finalizar</a>
                      <button type="submit" class="btn btn-success" id="crearTicket"> &nbsp;&nbsp;&nbsp;&nbsp;Siguiente&nbsp;&nbsp;&nbsp;&nbsp;</button>
                  </footer>
                </g:formRemote>
              </div>
</g:if>
<g:else>
    <div class="alert alert-danger" style="color: gray;">
                  <strong>Debe Seleccionar algun probema del area seleccionada para poder levantar el ticket.</strong> 
       </div>
</g:else>
            </div>
     
            
            
            <script type="text/javascript">
            
            jQuery( "#finalizarTicket").hide();
            jQuery( "#crearTicket").hide();
            
                jQuery( "#noRepo" ).click(function() {
                    jQuery( "#finalizarTicket").hide();
                    jQuery( "#crearTicket").show();
                });    
                jQuery( "#siRepo" ).click(function() {
                        jQuery( "#finalizarTicket").show();
                        jQuery( "#crearTicket").hide();
                });
            </script>
            

            <script>
                var code=jQuery( "#codeHtml").val();
                jQuery("#wikipedia").html(code);
            </script>
            