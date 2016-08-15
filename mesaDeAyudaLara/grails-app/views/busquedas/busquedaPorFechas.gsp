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
                <g:formRemote url="[controller: 'busquedas', action:'generarBusquedaFecha']" class="orb-form" update="estadistica" name="estadostica">  
                    <fieldset class="col-12">
                        <section class="col-12  bootstrap-grid">
                            <label class="label">Fecha Inicial</label>
                            <label class="input">
                                <input type="text" name="fechaInicio" id="fechaInicio" required="true">   
                            </label>
                        </section>
                        <section class="col-12 bootstrap-grid">
                            <label class="label">Fecha Final</label>
                            <label class="input">
                                <input type="text" name="fechaFin" id="fechaFin" required="true">
                            </label>
                        </section>
                    </fieldset>

                      <button type="submit" class="btn btn-success"><i class="fa fa-search"></i> Buscar Tickets</button>
    
                </g:formRemote>
              </div>
            </div>
                   <div id="estadistica"></div>
          </div>
             
                            <script>
                   

$(function($){
    $.datepicker.regional['es'] = {
        closeText: 'Cerrar',
        prevText: 'Ant',
        nextText: 'Sig',
        currentText: 'Hoy',
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
        dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
        weekHeader: 'Sm',
        dateFormat: 'dd/mm/yy',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    };
    $.datepicker.setDefaults($.datepicker.regional['es']);
});
                   
                   
            jQuery(document).ready(function(){
                jQuery(function() {
                    jQuery.datepicker.setDefaults(jQuery.datepicker.regional["es"]);
                    jQuery('#fechaInicio').datepicker({
                    dateFormat: "dd/mm/yy",
                    controlType: 'select',
                    buttonImageOnly: false
                    });
                });   
                jQuery(function() {
                    jQuery.datepicker.setDefaults(jQuery.datepicker.regional["es"]);
                    jQuery('#fechaFin').datepicker({
                    dateFormat: "dd/mm/yy",
                    controlType: 'select',
                    buttonImageOnly: false
                    });
                });
            });
        </script>