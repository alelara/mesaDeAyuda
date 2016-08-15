<!--paso2 -->

<div class="powerwidget green"  data-widget-editbutton="false">
    <header>
        <h2>Repositorio de Ayuda<small>Consulta de Wiki</small></h2>
    </header>
    <g:if test="${categoriaDelProblema}">       
        <div class="inner-spacer">
            <g:if test="${wiki}">
            <fieldset>
                <section>
                    <input id="codeHtml" type="hidden" value="${wiki}" />
                    <div id="wikipedia"></div>

                </section>
            </fieldset>       
            </g:if>
            <g:else>
               <fieldset>
                <section>
                    <p class="lead"> Repositorio de Ayuda <b>No Disponible</b></p>
                </section>
            </fieldset>   
            </g:else>
        </div>
    </g:if>
    <g:else>
        <div class="alert alert-danger" style="color: gray;">
            <strong>Debe Seleccionar algun probema del area seleccionada para poder consultar el repositorio de ayuda.</strong> 
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
