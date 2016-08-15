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
        <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
        <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script type="text/javascript">            
            jQuery(document).ready(function(){

            });
        </script>   
        
    </head>
    <body>
        
                <div class="breadcrumb clearfix">
          <ul>
              <li><a href="${createLink(controller:'solicitudDeCaso', action:'bandejaDeCasos')}"><i class="fa fa-home"></i></a></li>
            <li><a href="${createLink(controller:'solicitudDeCaso', action:'bandejaDeCasos')}">Mesa de Ayuda</a></li>
            <li class="active">Consulta de Repositorio de Ayuda</li>
          </ul>
        </div>
        <!--/Breadcrumb-->
        
        <div class="page-header">
          <h1>Consulta de Repositorio de Ayuda<small>${usuario?.unidad}</small></h1>
        </div>

        
        <!-- Widget Row Start grid -->
        <div class="row" id="powerwidgets">
         <!--Breadcrumb-->
   <div class="col-md-12  bootstrap-grid">

       
            <div class="powerwidget green"  data-widget-editbutton="false">
              <header>
                <h2>Repositorio de Ayuda<small>Consulta de Wiki</small></h2>
              </header>
              <div class="inner-spacer">
                <g:formRemote  url="[controller: 'consulta', action:'buscarReposotorioAyuda']"  name="buscarReposotorioAyuda" class="orb-form" update="repositotioAyuda">
                  <fieldset>
                    <section>
                      <label class="label">Seleccione el Area</label>
                      <label class="select">
                                                           <g:select id="area" noSelection="${['null':'Seleccione Area...']}" from="${areas}" optionKey="id"  optionValue="nombre"  name="fname" placeholder="First name" style="width:100%;"
             onchange="${remoteFunction( 
            controller:'consulta', 
            action:'categoriasDeArea', 
            params:'\'id=\' + escape(this.value)', 
            update:'categoria')}" required="true"/> 

                      </label>
                      <div class="note"><strong>Note:</strong> works in Chrome, Firefox, Opera and IE10.</div>
                    </section>
                  </fieldset>
                  <fieldset>
                    <section>
                      <label class="label">Seleccione el tipo de problema que presenta</label>
                       <div id="categoria"> </div>
                    </section>

                  </fieldset>



                  
                  <footer>
                    <button type="submit" class="btn btn-success">Consultar Repositorio de Ayuda</button>
                  </footer>
                </g:formRemote>
              </div>
            </div>
            
            
            <div id="repositotioAyuda"></div>
            


          </div>
         </div> 

         
         
    </body>
</html>
