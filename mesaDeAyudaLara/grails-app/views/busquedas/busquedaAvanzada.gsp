<!DOCTYPE html>
<html lang="es">
<head>
<meta name="layout" content="rt"/>

</head>

<body>

<!--Smooth Scroll-->
<div class="smooth-overflow">
<!--Navigation-->
  
        
        <!--Breadcrumb-->
        <div class="breadcrumb clearfix">
          <ul>
            <li><a href="${createLink(controller:'solicitudDeCaso', action:'bandejaDeCasos')}"><i class="fa fa-home"></i></a></li>
            <li><a href="${createLink(controller:'solicitudDeCaso', action:'bandejaDeCasos')}">Mesa de Ayuda</a></li>
            <li class="active">Bandeja de Tickets</li>
          </ul>
        </div>
        <!--/Breadcrumb-->
        
        <div class="page-header">
          <h1>Busqueda de Tickets<small>${unidadDeUsuario?.unidad}</small></h1>
        </div>      
        <!-- Widget Row Start grid -->
        <div class="row" id="powerwidgets">
          <div class="col-md-12 bootstrap-grid"> 
            
            <!-- New widget -->
            <div class="powerwidget cold-grey"  data-widget-editbutton="false">
              <header>
                <h2> <sec:ifLoggedIn>Bienvenido <sec:username/>!</sec:ifLoggedIn><sec:ifNotLoggedIn><g:link controller='login' action='auth'>Login</g:link></sec:ifNotLoggedIn></h2>
              </header>
              <div class="inner-spacer">

                <div class="mailinbox">
                  <div class="row">
                    <div class="col-md-1">
                      <div class="left-content">
                        <div class="list-group"> <a href="${createLink(controller:'solicitudDeCaso', action:'bandejaDeCasos')}" class="list-group-item active"><i class="entypo-inbox"></i><b>Bandeja</b></a> 
                                <a href="${createLink(controller:'solicitudDeCaso', action:'bandejaCasosConcluidos')}" class="list-group-item"><i class="entypo-archive"></i><b>Archivo de Casos</b><span class="badge">${casoInstanceCount}</span></a> 
                                <a href="${createLink(controller:'busquedas', action:'busquedaAvanzada')}" class="list-group-item active"><i class="entypo-search"></i><b>Busqueda Avanzada</b></a> 
                        </div>
                      </div>
                    </div>
                    <div class="col-md-11">
                      <div class="right-content clearfix">
                          <div class="big-icons-buttons clearfix margin-bottom"> 
                              <g:remoteLink controller="busquedas" action="busquedaPorFechas" class="btn btn-sm btn-default" update="updateArea"><i class="fa fa-calendar"></i>Rango de Fechas</g:remoteLink>
                              <g:remoteLink controller="busquedas" action="busquedaCategoria" class="btn btn-sm btn-default" update="updateArea"><i class="fa fa-folder-open"></i>Categoria de Problema</g:remoteLink>
                             <g:remoteLink controller="busquedas" action="busquedaDatoEspecifico" class="btn btn-sm btn-default" update="updateArea"><i class="fa fa-pencil-square"></i>Dato Especifico</g:remoteLink>   
                    
                             <div id="updateArea" class="col-md-12"></div> 
                          
                          </div>
                  </div>
                </div>
                    
                                

              </div>
            </div>
            <!-- End Widget --> 
            
          </div>
          <!-- /Inner Row Col-md-12 --> 
        </div>
        <!-- /Widgets Row End Grid--> 
      </div>
      <!-- / Content Wrapper --> 

            
         </div>
    <!--/MainWrapper--> 
  </div>
<!--/Smooth Scroll-->       
  

<!-- scroll top -->
<div class="scroll-top-wrapper hidden-xs">
    <i class="fa fa-angle-up"></i>
</div>
<!-- /scroll top -->



<!--Modals-->

<!--Power Widgets Modal-->
<div class="modal" id="delete-widget">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <i class="fa fa-power-off"></i> </div>
      <div class="modal-body text-center">
        <p>Are you sure to delete this widget?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="trigger-deletewidget-reset">Cancel</button>
        <button type="button" class="btn btn-primary" id="trigger-deletewidget">Delete</button>
      </div>
    </div>
    <!-- /.modal-content --> 
  </div>
  <!-- /.modal-dialog --> 
</div>
<!-- /.modal --> 

<!--Sign Out Dialog Modal-->
<div class="modal" id="signout">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <i class="fa fa-lock"></i> </div>
      <div class="modal-body text-center">Are You Sure Want To Sign Out?</div>
      <div class="modal-footer">
        <a class="btn btn-default" id="yesigo">Ok</a>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
      </div>
    </div>
    <!-- /.modal-content --> 
  </div>
  <!-- /.modal-dialog --> 
</div>
<!-- /.modal --> 

<!-- /.modal --> 



</body>
</html>