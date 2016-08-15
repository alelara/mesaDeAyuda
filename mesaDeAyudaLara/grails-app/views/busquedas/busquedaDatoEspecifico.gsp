             <div class="col-md-12  bootstrap-grid">
             <br><br>
            <div class="powerwidget green" id="most-form-elements" data-widget-editbutton="false">
              <header>
                <h2>Busquedas<small>Dato Especifico</small></h2>
              </header>
              

              
              
              <div class="inner-spacer">                  
                                    <g:if test="${fail}">
                      <div class="callout callout-danger">
                          <h4>Error</h4>
                          <p><b>${fail}</b></p>
                      </div>                                
                  </g:if>                   
                <g:formRemote url="[controller: 'busquedas', action:'generarBusquedaContenido']" class="orb-form" update="estadistica" name="estadostica">  
                    <fieldset class="col-12">
                        <section class="col-12  bootstrap-grid">
                            <label class="label">Ingresa el <b>dato/valor</b> a buscar</label>
                            <label class="input">
                                <input name="dato" required="true"/>
                            </label>
                        </section>
                    </fieldset>

                      <button type="submit" class="btn btn-success"><i class="fa fa-search"></i> Buscar <b>dato/valor</b> en los Tickets</button>
    
                </g:formRemote>
              </div>
            </div>
                   <div id="estadistica"></div>
          </div>