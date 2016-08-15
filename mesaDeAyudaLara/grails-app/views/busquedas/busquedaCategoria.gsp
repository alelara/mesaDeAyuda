             <div class="col-md-12  bootstrap-grid">
             <br><br>
            <div class="powerwidget green" id="most-form-elements" data-widget-editbutton="false">
              <header>
                <h2>Busquedas<small>Rangos de Fechas</small></h2>
              </header>
              

              
              
              <div class="inner-spacer">                  
                                    <g:if test="${fail}">
                      <div class="callout callout-danger">
                          <h4>Error</h4>
                          <p><b>${fail}</b></p>
                      </div>                                
                  </g:if>                   
                <g:formRemote url="[controller: 'busquedas', action:'generarBusquedaTopico']" class="orb-form" update="estadistica" name="estadostica">  
                    <fieldset class="col-12">
                        <section class="col-12  bootstrap-grid">
                            <label class="label">Seleccione la Categoria del Problema</label>
                            <label class="select">
                                <g:select name="topico" from="${topicos}"  required="true" optionKey="id" optionValue="nombre"/>
                            </label>
                        </section>
                    </fieldset>

                      <button type="submit" class="btn btn-success"><i class="fa fa-search"></i> Buscar Tickets</button>
    
                </g:formRemote>
              </div>
            </div>
                   <div id="estadistica"></div>
          </div>