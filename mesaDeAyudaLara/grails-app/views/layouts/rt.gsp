<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> 
<%@ page import="mx.gob.mx.rt.tareas.TareasAutomatizadasService" %>

<html lang="es" class="no-js"><!--<![endif]-->
	<head>
		<title><g:layoutTitle default="Ifrem | Mesa de Ayuda"/></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<meta name="keywords" content="admin template, admin dashboard, inbox templte, calendar template, form validation">
<meta name="author" content="DazeinCreative">
<meta name="description" content="ORB - Powerfull and Massive Admin Dashboard Template with tonns of useful features">
<meta name="viewport" content="width=device-width, initial-scale=1">

<asset:stylesheet src="styles.css"/>
<asset:stylesheet src="styles.css"/>
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
<asset:javascript src="vendors/modernizr/modernizr.custom.js"/>

		<g:layoutHead/>
	</head>
	<body>
		
              <nav class="main-header clearfix" role="navigation"> <a class="navbar-brand" href="index.html"><span class="text-blue">IFREM</span></a> 
      

      
      <!--Navigation Itself-->
      
      <div class="navbar-content"> 
        
        <!--Sidebar Toggler--> 
        <a href="#" class="btn btn-default left-toggler"><i class="fa fa-bars"></i></a> 
        <!--Right Userbar Toggler--> 
        <a href="#" class="btn btn-user right-toggler pull-right"><i class="entypo-vcard"></i> <span class="logged-as hidden-xs">Logged as</span><span class="logged-as-name hidden-xs">Anton Durant</span></a> 
        <!--Fullscreen Trigger-->
        <button type="button" class="btn btn-default hidden-xs pull-right" id="toggle-fullscreen"> <i class=" entypo-popup"></i> </button>

        
        <!--Lock Screen--> 
        <a href="#" data-toggle="modal" class="btn btn-default hidden-xs pull-right lockme"> <i class="fa fa-power-off"></i> </a> 
        
        <!--Notifications Dropdown-->
           <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION">  
        <div class="btn-group">
          <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"> <i class="entypo-megaphone"></i><span class="new"></span></button>
          <div id="notification-dropdown" class="dropdown-menu">
            <div class="dropdown-header">Notificaciones <span class="badge pull-right"></span></div>
            <div class="dropdown-container">
              <div class="nano">
                <div class="nano-content">
                  <ul class="notification-dropdown">
                    <li class="bg-danger"><a href="#"> <span class="notification-icon"><i class="fa entypo-alert"></i></span>
                      <h4>Tickets  de Prioridad: Critico</h4>
                      <span class="label label-default"><i class="entypo-clock"></i> <g:include controller="solicitudDeCaso" action="contarCasosPrioridad" id="1" /> Tickets Pendientes</span> </a> </li>
                    <li class="bg-warning"><a href="#"> <span class="notification-icon"><i class="fa entypo-attention"></i></span>
                      <h4>Tickets  de Prioridad: Alto</h4>  
                      <span class="label label-default"><i class="entypo-clock"></i> <g:include controller="solicitudDeCaso" action="contarCasosPrioridad" id="2" /> Tickets Pendientes</span> </a> </li>
                    <li class="bg-primary"><a href="#"> <span class="notification-icon"><i class="fa entypo-traffic-cone"></i></span>
                      <h4>Tickets  de Prioridad:  Medio</h4>
                      <span class="label label-default"><i class="entypo-clock"></i> <g:include controller="solicitudDeCaso" action="contarCasosPrioridad" id="3" /> Tickets Pendientes</span> </a> </li>
                    <li class="bg-info"><a href="#"> <span class="notification-icon"><i class="fa entypo-back-in-time"></i></span>
                      <h4>Tickets  de Prioridad:  Bajo</h4>
                      <span class="label label-default"><i class="entypo-clock"></i> <g:include controller="solicitudDeCaso" action="contarCasosPrioridad" id="4" /> Tickets Pendientes</span> </a> </li>
                      <li class="bg-success"><a href="#"> <span class="notification-icon"><i class="fa entypo-hourglass"></i></span>
                      <h4>Tickets  de Prioridad:  Planeado</h4>
                      <span class="label label-default"><i class="entypo-clock"></i> <g:include controller="solicitudDeCaso" action="contarCasosPrioridad" id="5" /> Tickets Pendientes</span> </a> </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="dropdown-footer"></div>
          </div>
        </div>
         </sec:ifAnyGranted>
        <!--Inbox Dropdown-->
        <div class="btn-group">
          <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><i class="entypo-mail"></i><span class="new"></span></button>
          <div id="inbox-dropdown" class="dropdown-menu inbox">
            <div class="dropdown-header">
                <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION"> 
                Tickets Recientes</sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ENLACE"> 
                Tickets Atendidos 
                </sec:ifAnyGranted>
                <span class="badge pull-right"> 
                      <g:include controller="solicitudDeCaso" action="contarCasos" id="1" /> 
                </span></div>
            <div class="dropdown-container">
              <div class="nano">
                <div class="nano-content">
                  <ul class="inbox-dropdown">
                    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION">  
                      <g:include controller="solicitudDeCaso" action="casosRecientes" id="1" /> 
                    </sec:ifAnyGranted>
                      <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ENLACE"> 
                       <g:include controller="solicitudDeCaso" action="casosRecientesAtendidos" id="1" /> 
                      </sec:ifAnyGranted> 
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </nav>
    
    <!--/Navigation--> 
    
    <!--MainWrapper-->
    <div class="main-wrap"> 
      
      <!--OffCanvas Menu -->
      <aside class="user-menu"> 
        
        <!-- Tabs -->
        <div class="tabs-offcanvas">
          <ul class="nav nav-tabs nav-justified">
            <li class="active"><a href="#userbar-one" data-toggle="tab">Perfil</a></li>
            <li><a href="#userbar-two" data-toggle="tab">Unidades</a></li>
          </ul>
          <div class="tab-content"> 
            
            <!--User Primary Panel-->
            <div class="tab-pane active" id="userbar-one">
              <div class="main-info">
                <div class="user-img"><img src="data:image/png;base64,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" alt="User Picture" /></div>
                <h1><g:include controller="solicitudDeCaso" action="nombreUsuario" id="1" /><small> <g:include controller="solicitudDeCaso" action="nombreAreaUsuario" id="1" /> </small></h1>
              </div>
              <div class="list-group">
                  <a href="${createLink(controller:'solicitudDeCaso', action:'utilidades')}" class="list-group-item"><i class="fa fa-cog"></i>Utilidades</a> 
                <div class="empthy"></div>
      
                <div class="empthy"></div>
                <a href="${createLink(controller:'logout', action:'index')}" data-toggle="modal" class="list-group-item lockme"><i class="fa fa-power-off"></i> Cerrar Sesion</a> 
                </div>
            </div>
            
            <!--User Chat Panel-->
            <div class="tab-pane" id="userbar-two">
              <div class="chat-users-menu"> 
                <!--Adding Some Scroll-->
                <div class="nano">
                  <div class="nano-content">
                    <div class="buttons">

                    </div>
                    <ul>
                        <g:include controller="solicitudDeCaso" action="listaDeUsuarios" id="1" />
   </ul>
                  </div>
                </div>
              </div>
            </div>
            
            <!--User Tasks Panel-->
            <div class="tab-pane" id="userbar-three">
              <div class="nano"> 
                <!--Adding Some Scroll-->
                <div class="nano-content">
                  <div class="small-todos">
                    <div class="input-group input-group-sm">
                      <input id="new-todo" placeholder="Add ToDo" type="text" class="form-control">
                      <span class="input-group-btn">
                      <button id="add-todo" class="btn btn-default" type="button"><i class="fa fa-plus-circle"></i></button>
                      </span> </div>
                    <section id="task-list">
                      <ul id="todo-list">
                      </ul>
                    </section>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <!-- /tabs --> 
        
      </aside>
      <!-- /Offcanvas user menu--> 
      
      <!--Main Menu-->
      <div class="responsive-admin-menu">
        <div class="responsive-menu">ORB
          <div class="menuicon"><i class="fa fa-angle-down"></i></div>
        </div>
      <ul id="menu">
         <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION">             
            <li><a class="submenu" href="#" title="Dashboard" data-id="dash-sub"><i class="entypo-chart-line"></i><span> Estadística</span></a>
              <ul id="dash-sub">
                <li><a href="${createLink(controller:'estadistica', action:'estadistica')}" title="Dashboard Anual"><i class="glyphicon glyphicon-signal"></i><span>  Anual</span></a></li>
                <li><a href="${createLink(controller:'estadistica', action:'estadisticaConfigurable')}" title="Dashboard Rango de Fechas"><i class="entypo-chart-pie"></i><span> Configurable </span></a></li>
                <li><a href="${createLink(controller:'estadistica', action:'encuestas')}" title="Dashboard Encuestas"><i class="fa fa-bar-chart-o"></i><span> Encuestas </span></a></li>
              </ul>
            </li>
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION, ROLE_ENLACE">   
          <li>
              <a class="active" href="${createLink(controller:'solicitudDeCaso', action:'bandejaDeCasos')}" title="Inbox">
                  <i class="entypo-inbox"></i><span> Bandeja de Casos <span class="badge"><g:include controller="solicitudDeCaso" action="contarCasos" id="1" /></span></span>
              </a>
          </li>  
        </sec:ifAnyGranted>       
         <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION">            
            <li><a class="submenu" href="#" title="Dashboard" data-id="dash-sub2"><i class="fa fa-cogs"></i><span> Configuración</span></a>
            <ul id="dash-sub2">
              <li><a href="${createLink(controller:'configuracion', action:'index')}" title="Configuracion de topicos"><i class="fa fa-cubes"></i><span> Categorias </span></a></li>
              <li><a href="${createLink(controller:'configuracion', action:'listaUsuarios')}" title="Configuracion de Usuarios"><i class="fa fa-male"></i><span> Usuarios</span></a></li>
              <li><a href="${createLink(controller:'configuracion', action:'encuesta')}" title="Configuracion de Encuesta"><i class="fa fa-codepen"></i><span> Encuesta</span></a></li>
            </ul>
          </li>
        </sec:ifAnyGranted> 
        </ul>
      </div>
      <!--/MainMenu-->
      
      <!--Content Wrapper-->
      <div class="content-wrapper"> 
        <!--Horisontal Dropdown-->
        <nav class="cbp-hsmenu-wrapper" id="cbp-hsmenu-wrapper">
          <div class="cbp-hsinner">
            <ul class="cbp-hsmenu">
              <li> <a href="#"><span class="icon-bar"></span></a>

              </li>
            </ul>
          </div>
        </nav>

            
            

<!--Scripts--> 
<!--JQuery--> 
            
            
            

        
<!--JQuery--> 
<asset:javascript src="vendors/jquery/jquery.min.js"/>
<asset:javascript src="vendors/jquery/jquery-ui.min.js"/>

<!--Fullscreen--> 
<asset:javascript src="vendors/fullscreen/screenfull.min.js"/>

<!--Forms--> 
<asset:javascript  src="vendors/forms/jquery.form.min.js"/>
<asset:javascript  src="vendors/forms/jquery.validate.min.js"/>
<asset:javascript src="vendors/forms/jquery.maskedinput.min.js"/>
<asset:javascript  src="vendors/jquery-steps/jquery.steps.min.js"/>



<!--NanoScroller-->  
<asset:javascript src="vendors/nanoscroller/jquery.nanoscroller.min.js"/>


<!--Sparkline--> 
<asset:javascript src="vendors/sparkline/jquery.sparkline.min.js"/>

<!--Horizontal Dropdown--> 
<asset:javascript src="vendors/horisontal/cbpHorizontalSlideOutMenu.js"/>
<asset:javascript src="vendors/classie/classie.js"/>

<!--PowerWidgets--> 
<asset:javascript src="vendors/powerwidgets/powerwidgets.min.js"/>

<!--Summernote--> 
<asset:javascript src="vendors/summernote/summernote.min.js"/>

<!--Bootstrap--> 
<asset:javascript src="vendors/bootstrap/bootstrap.min.js"/>

<!--Chat--> 
<asset:javascript src="vendors/todos/todos.js"/>

<!--ToDo--> 
<asset:javascript  src="vendors/todos/todos.js"/>

<!--Main App--> 
<asset:javascript src="scripts.js"/>

<!--FlotChart--> 
<asset:javascript src="vendors/flotchart/jquery.flot.min.js"/>
<asset:javascript src="vendors/flotchart/jquery.flot.resize.min.js"/> 
<asset:javascript src="vendors/flotchart/jquery.flot.axislabels.js"/>
<asset:javascript src="vendors/flotchart/jquery.flot-tooltip.js"/>


 
<asset:javascript src="vendors/flotchart/jquery.flot.time.min.js"/>
<asset:javascript src="vendors/flotchart/jquery.flot.resize.min.js"/>
<asset:javascript src="vendors/flotchart/jquery.flot.axislabels.js"/>
<asset:javascript src="vendors/flotchart/jquery.flot-tooltip.js"/>
<asset:javascript src="vendors/flotchart/jquery.flot.pie.min.js"/>

<!--Chart.js--> 
<asset:javascript  src="vendors/chartjs/chart.min.js"/>


<!--Morris Chart--> 
<asset:javascript src="vendors/raphael/raphael-min.js"/>
<asset:javascript  src="vendors/morris/morris.min.js"/>

<!--Calendar--> 
<asset:javascript src="vendors/fullcalendar/fullcalendar.min.js"/>
<asset:javascript src="vendors/fullcalendar/gcal.js"/>


<!--EasyPieChart--> 
<asset:javascript src="vendors/easing/jquery.easing.1.3.min.js"/>
<asset:javascript src="vendors/easypie/jquery.easypiechart.min.js"/>


<!--Just Gauge--> 
<asset:javascript src="vendors/just-gauge/justgage.1.0.1.min.js"/>

<!--Morris Chart--> 
<asset:javascript src="vendors/raphael/raphael-min.js"/>
<!--/Scripts-->
            
 <!--Morris Chart--> 
 <asset:javascript src="jquery-ui-timepicker-addon.js"/>
<!--/Scripts-->         
          
          
<!--Lock Screen Dialog Modal-->
<div class="modal" id="lockscreen">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <i class="fa fa-power-off"></i> </div>
      <div class="modal-body text-center">¿Estas seguro que deseas cerrar sesión?</div>
      <div class="modal-footer">
        <g:link controller='logout' action='index' class="btn btn-default" >Salir</g:link>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
      </div>
    </div>
    <!-- /.modal-content --> 
  </div>
  <!-- /.modal-dialog --> 
</div>
<g:layoutBody/>

	</body>
</html>