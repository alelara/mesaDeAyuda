﻿<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="rt"/>
        
                <style>
        /* PAGINATION */

.pagination {
	border-top: 0;
	margin: 0;
	padding: 0.3em 0.2em;
	text-align: center;
	   -moz-box-shadow: 0 0 3px 1px #CCC;
	-webkit-box-shadow: 0 0 3px 1px #CCC;
	        box-shadow: 0 0 3px 1px #CCC;
	background-color: #FFF;
}

.pagination a,
.pagination .currentStep {
	color: #666666;
	display: inline-block;
	margin: 0 0.1em;
	padding: 0.25em 0.7em;
	text-decoration: none;
	   -moz-border-radius: 0.3em;
	-webkit-border-radius: 0.3em;
	        border-radius: 0.3em;
}

.pagination a:hover, .pagination a:focus,
.pagination .currentStep {
	background-color: #999999;
	color: #ffffff;
	outline: none;	
        border-color: #ccc;
}

.no-borderradius .pagination a:hover, .no-borderradius .pagination a:focus,
.no-borderradius .pagination .currentStep {
	background-color: transparent;
	color: #444444;
	text-decoration: underline;
}
 </style> 
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
          <h1>Bandeja de Tickets<small>${usuario?.unidad}</small></h1>
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
                              <a href="${createLink(controller:'solicitudDeCaso', action:'bandejaCasosConcluidos')}" class="list-group-item"><i class="entypo-archive"></i><b>Archivo de Casos</b></a> 
                              <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION"> 
                                  <a href="${createLink(controller:'solicitudDeCaso', action:'bandejaCasosAtendidos')}" class="list-group-item"><i class="glyphicon glyphicon-check"></i><b>Archivo de Casos Atendidos</b></a> 
                              </sec:ifAnyGranted>
                              <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ENLACE"> 
                                  <a href="${createLink(controller:'solicitudDeCaso', action:'bandejaCasosProceso')}" class="list-group-item"><i class="entypo-archive"></i><b>Archivo de Casos en Proceso</b><span class="badge">${casoInstanceCount}</span></a> 
                              </sec:ifAnyGranted> 
                              <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION"> 
                                  <a href="${createLink(controller:'busquedas', action:'busquedaAvanzada')}" class="list-group-item active"><i class="entypo-search"></i><b>Busqueda Avanzada</b></a> 
                              </sec:ifAnyGranted>  </div>
                      </div>
                    </div>
                    <div class="col-md-11">
                      <div class="right-content clearfix">
                          <div class="big-icons-buttons clearfix margin-bottom"> <a href="${createLink(controller:'solicitudDeCaso', action:'altaDeTicket')}" class="btn btn-sm btn-default"><i class="fa fa-envelope"></i>Nuevo Ticket</a>
                          
                        </div>
                        <g:form name="comentario"  controller="solicitudDeCaso">
                        <div class="input-group margin-bottom">
                          
                              <input type="text" class="form-control" name="idCaso" placeholder="Buscar Ticket" required="true" pattern="[0-9]*">
                          <span class="input-group-btn">
                              
                        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ENLACE">                       
                              <g:actionSubmit value=" Buscar ENLACE"  action="verCasoUnidad" class="btn btn-success pull-right" /> 
                         </sec:ifAnyGranted>   
                         <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION">                       
                              <g:actionSubmit value=" Buscar ATENCION"  action="verCaso" class="btn btn-success pull-right" /> 
                         </sec:ifAnyGranted>
                          </span>
                         
                        </div>
                         </g:form>

                        <div class="panel panel-default">
                             <div class="panel-body">
                           <g:if test="${success}">                            
                                <div class="callout callout-info">
                                    <h4>Ticket Creado Correctamente</h4>
                                    <p>Se ha creado correctamente el  <b>${success}</b> , y se le asigno al area correspondiente.</p>
                                </div>  
                           </g:if>
                            <g:if test="${error}">
                                    <div class="callout callout-danger">
                                        <h4>Error</h4>
                                        <p>${error}</p>
                                    </div>                                
                            </g:if> 
                           <g:if test="${turnarCaso}">
                                    <div class="callout callout-info">
                                        <h4>Asignacion de Caso</h4>
                                        <p>${turnarCaso}</p>
                                    </div>                                
                            </g:if>
                           </div>
                        </div>
                        
                        <!-- /input-group -->
                        
                        <div class="table-relative table-responsive">
                          <table class="table table-condensed table-striped margin-0px">
                            <thead>
                              <tr>
                                <th><input id="all" type="checkbox" class="checkall" />
                                  <label for="all"></label></th>
                                <th colspan="2">Remitente</th>
                                <th>Categoria</th>
                                <th>Unidad</th>
                                <th>Fecha de Creacion</th>

                                  <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION"> 
                                        <th>Prioridad</th>
                                  </sec:ifAnyGranted>
                                    <th>Estado</th>

                              </tr>
                            </thead>
                            <tbody>
                                
                            <g:each in="${casos}" var="ticket" name="casos">    
                              <tr class="unread">
                                <td><div class="user-image">
                                        <g:if test="${ticket?.categoria?.prioridad.id==1}">  
                                            <img alt="User" src="http://xylitol-sucre.org/WordPress/wp-content/uploads/2011/04/xylitol-danger1.png"/>
                                        </g:if>
                                        <g:if test="${ticket?.categoria?.prioridad.id==2}">  
                                            <img alt="User" src="data:image/jpeg;base64,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"/>
                                        </g:if>
                                        <g:if test="${ticket?.categoria?.prioridad.id==3}">  
                                            <img alt="User" src="data:image/jpeg;base64,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"/>
                                        </g:if>
                                        <g:if test="${ticket?.categoria?.prioridad.id==4}">  
                                            <img alt="User" src="data:image/jpeg;base64,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"/>
                                        </g:if>
                                        <g:if test="${ticket?.categoria?.prioridad.id==5}">  
                                            <img alt="User" src="data:image/jpeg;base64,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"/>
                                        </g:if>
                                    <input id="1" type="checkbox" class="checkbox" name="check-row" />
                                    <label for="1"></label>
                                  </div></td>
                                  <td class="star"><a class="fa fa-flag fa-folder-open" href="${createLink(controller:'solicitudDeCaso', action:'verCaso', params:['idCaso':ticket?.caso?.id])}"></a></td>
                                <td><a href="#">${mx.gob.ifr.rt.UsuarioUnidadAdministrativa.findByUsuario(ticket?.caso?.creador)?.unidad}</a> <small><a href="#">${ticket?.caso?.creador}</a></small></td>
                                <td> <a href="#">${ticket?.categoria}</a><small>Número de Ticket: ${ticket?.caso?.id}</small></td>
                                
                                <td>${ticket?.categoria?.unidadAdministrativaResponsable}<small></small></td>
                                <td>${ticket?.caso?.fechaDeCreacion}</td> 

                                        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION"> 
                                <td>${ticket?.categoria?.prioridad}<small>${ticket?.categoria?.prioridad?.tiempoDeResolucion}</small></td>
                                        </sec:ifAnyGranted>
                                <td>${ticket?.caso?.estado}</td>

                              </tr>
                             </g:each>
                            </tbody>
                          </table>
                        </div>                                           
                            <div  class="pagination" style="margin-left: 2px; margin-top: 5px;">
                                                <g:paginate total="${casoInstanceCount ? casoInstanceCount : 0 }" max="10" offset="${session.offsetPaginacion?.offset}" params="${[paginate:'SI', id: q?.id, idCategoria:categoria?.id]}" />
                            </div>      
                      </div>
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