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

    </head>
    <body>


        <div class="breadcrumb clearfix">
            <ul>
                  <li><a href="${createLink(controller:'solicitudDeCaso', action:'bandejaDeCasos')}"><i class="fa fa-home"></i></a></li>
                <li><a href="${createLink(controller:'solicitudDeCaso', action:'bandejaDeCasos')}">Mesa de Ayuda</a></li>
                <li class="active">Detalle del Ticket</li>
            </ul>
        </div>
        <!--/Breadcrumb-->
 <g:if test="${existeCaso}">
     <g:if test="${visible}">
        <div class="page-header">
            <h1>Ticket número ${ticket?.caso?.id}<small>${usuario?.unidad}</small></h1>
        </div>
        
       
        
        
        <g:if test="${respuesta=='true'}">                            
            <div class="callout callout-info">
                <h4>Se ha agregado correctamente el comentario al Ticket ${ticket?.caso?.id}</h4>
            </div>  
        </g:if>
        <g:if test="${respuesta=='false'}">
            <div class="callout callout-danger">
                <h4>Error</h4>
                <p>No se agrego correctamente el comentario al Ticket ${ticket?.caso?.id}</p>
            </div>                                
        </g:if>
            
                 <g:if test="${adjunto=='true'}">                            
            <div class="callout callout-info">
                <h4>Se ha agregado correctamente el adjunto al Ticket ${ticket?.caso?.id}</h4>
            </div>  
        </g:if>
        <g:if test="${adjunto=='false'}">
            <div class="callout callout-danger">
                <h4>Error</h4>
                <p>No se agrego correctamente el adjunto al Ticket ${ticket?.caso?.id}, Intetelo de nuevo</p>
            </div>                                
        </g:if>   
        <g:if test="${resuelto=='true'}">                            
            <div class="callout callout-info">
                <h4>Se ha atendido correctamente el Ticket ${ticket?.caso?.id}</h4>
            </div>  
        </g:if>
        <g:if test="${resuelto=='false'}">
            <div class="callout callout-danger">
                <h4>Error</h4>
                <p>No se actualizo el status del Ticket ${ticket?.caso?.id}</p>
            </div>                                
        </g:if>            
            
        <g:if test="${cerrado=='true'}">                            
            <div class="callout callout-info">
                <h4>Se ha concluido correctamente el Ticket ${ticket?.caso?.id}</h4>
            </div>  
        </g:if>
        <g:if test="${cerrado=='false'}">
            <div class="callout callout-danger">
                <h4>Error</h4>
                <p>No se cerro el Ticket ${ticket?.caso?.id} correctamente; favor de intentarlo mas tarde.</p>
            </div>                                
        </g:if>    

        <g:if test="${success}">                            
            <div class="callout callout-info">
                <h4>Se ejecuto correctamente la operación</h4>
                <p>${success}</p>
            </div>  
        </g:if>
        <g:if test="${fail}">
            <div class="callout callout-danger">
                <h4>Error</h4>
                <p>${fail}</p>
            </div>                                
        </g:if>       
            

<!--Panel-->
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title pull-left">Detalles del Ticket</div>
                <div class="pull-right"> <a href="#" data-toggle="modal" data-target="#panel-question" class="btn-question"><i class="fa fa-question-circle"></i></a> <a href="#" class="btn-minmax"><i class="fa fa-chevron-circle-up"></i></a> <a href="#" class="btn-close"><i class="fa fa-times-circle"></i></a> </div>
                <div class="clearfix"></div>
            </div>
            <div class="panel-body">
<!-- Widget Row Start grid -->
                <div class="row" id="powerwidgets">
                    <div class="col-md-6 bootstrap-grid"> 
                      <!-- New widget -->

                        <div class="inner-spacer">
                            <table class="table table-striped table-hover margin-0px">
                                <thead>
                                    <tr>
                                        <th>Campo</th>
                                        <th>Valor</th>
                                    </tr>
                                </thead>
                                <tbody> 
                                    <tr>
                                        <td>Estado del Ticket</td>
                                        <td><b>${ticket?.caso?.estado}</b></td>
                                    </tr>
                                    <tr>
                                        <td>Creador del Ticket</td>
                                        <td>${ticket?.caso?.creador}</td>
                                    </tr>
                                    <tr>
                                        <td>Unidad Administrativa</td>
                                        <td>${mx.gob.ifr.rt.UsuarioUnidadAdministrativa.findByUsuario(ticket?.caso?.creador)?.unidad}</td>
                                    </tr>
                                    <tr>
                                        <td>Fecha de Creación</td>
                                        <td>${ticket?.caso?.fechaDeCreacion}</td>
                                    </tr>
                                    <tr>
                                        <td>Propietario de Atencion</td>
                                        <td>${ticket?.caso?.propietarioActual}</span></td>
                                    </tr>
                                    <tr>
                                        <td>Problema</td>
                                        <td>${ticket?.categoria}</td>
                                    </tr>
                                    <g:if test="${ticket?.caso?.estado?.id==4}"> 
                                    <tr>
                                        <td>Atendio</td>
                                        <td>${ticket?.caso?.responsable}</td>
                                    </tr>
                                    </g:if>
                                    
                                    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION"> 
                                    <tr>
                                        <td>Prioridad</td>
                                        <g:if test="${ticket?.categoria?.prioridad.id==1}">  
                                            <td><span class="label label-danger">${ticket?.categoria?.prioridad} | ${ticket?.categoria?.prioridad?.tiempoDeResolucion}</span></td>
                                        </g:if>
                                        <g:if test="${ticket?.categoria?.prioridad.id==2}">  
                                            <td><span class="label label-danger">${ticket?.categoria?.prioridad} | ${ticket?.categoria?.prioridad?.tiempoDeResolucion}</span></td>
                                        </g:if>
                                        <g:if test="${ticket?.categoria?.prioridad.id==3}">  
                                            <td><span class="label label-warning">${ticket?.categoria?.prioridad} | ${ticket?.categoria?.prioridad?.tiempoDeResolucion}</span></td>
                                        </g:if>
                                        <g:if test="${ticket?.categoria?.prioridad.id==4}">  
                                            <td><span class="label label-info">${ticket?.categoria?.prioridad} | ${ticket?.categoria?.prioridad?.tiempoDeResolucion}</span></td>
                                        </g:if>
                                        <g:if test="${ticket?.categoria?.prioridad.id==5}">  
                                            <td><span class="label label-success">${ticket?.categoria?.prioridad} | ${ticket?.categoria?.prioridad?.tiempoDeResolucion}</span></td>
                                        </g:if>

                                    </tr>
                                    </sec:ifAnyGranted>
                                    <g:each in="${valoresDatosRequeridos}" var="datoRequerido" name="valoresDatosRequeridos">  
                                        <tr>
                                            <td>${datoRequerido?.campo}</td>
                                            <td><b>${datoRequerido?.valor=='' ? '---' : datoRequerido?.valor}</b></td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>
                        </div>
                      <!-- End .powerwidget --> 
                    </div> 
                    <div class="col-md-6 bootstrap-grid">                 

                        <div class="icon-block"><i class="fa fa-5x fa-bell"></i></div>
                        <p style="text-align: justify;"> <h2>Descripción del Problema</h2> ${ticket?.caso?.descripcionDelProblema} </p>


                    </div> 
                </div>
                <!--/Panel--> 
                        <!--User Chat Panel-->

            </div>          
        </div>   
       
            
            <g:if test="${ticket?.caso?.estado?.id == 1 || ticket?.caso?.estado?.id == 2}">
                 <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION"> 
                 <g:form name="resolverTicket"  url="[controller: 'solicitudDeCaso', action:'resolverTicket']" >
                     <input type="hidden" name="casoId" value="${ticket?.caso?.id}">
                        <div class="row" id="powerwidgets">
                            <div class="col-md-6 bootstrap-grid">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <div class="panel-title pull-left">Diagnóstico del Ticket</div>
                                        <div class="pull-right"> <a href="#" data-toggle="modal" data-target="#panel-question" class="btn-question"><i class="fa fa-question-circle"></i></a> <a href="#" class="btn-minmax"><i class="fa fa-chevron-circle-up"></i></a> <a href="#" class="btn-close"><i class="fa fa-times-circle"></i></a> </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="panel-body">  
                                        <div class="col-md-12">
                                            <textarea placeholder="Escribe el diagnostico del problema presentado ..." class="form-control margin-bottom" rows="4" name="diagnostico" required>${ticket?.caso?.diagnostico}</textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 bootstrap-grid">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <div class="panel-title pull-left">Solución  del Ticket</div>
                                        <div class="pull-right"> <a href="#" data-toggle="modal" data-target="#panel-question" class="btn-question"><i class="fa fa-question-circle"></i></a> <a href="#" class="btn-minmax"><i class="fa fa-chevron-circle-up"></i></a> <a href="#" class="btn-close"><i class="fa fa-times-circle"></i></a> </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="panel-body"> 
                                        <div class="col-md-12">
                                            <textarea placeholder="Escribe la solución del problema presentado..." class="form-control margin-bottom" rows="4" name="solucion" required>${ticket?.caso?.solucion}</textarea>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                            <div class="col-md-12 col-sm-4 col-xs-4">
                                <button class="btn btn-danger pull-right"  type="submit">Resolver Ticket</button>
                            </div>
                        </div>
                     </g:form> 
 </sec:ifAnyGranted>
            </g:if>  
            <g:else>
                                    <div class="row" id="powerwidgets">
                            <div class="col-md-6 bootstrap-grid">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <div class="panel-title pull-left">Diagnóstico del Ticket - ${ticket?.caso?.fechaDeDiagnostico}</div>
                                        <div class="pull-right"> <a href="#" data-toggle="modal" data-target="#panel-question" class="btn-question"><i class="fa fa-question-circle"></i></a> <a href="#" class="btn-minmax"><i class="fa fa-chevron-circle-up"></i></a> <a href="#" class="btn-close"><i class="fa fa-times-circle"></i></a> </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="panel-body">  
                                        <div class="col-md-12">
                                            ${ticket?.caso?.diagnostico}
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 bootstrap-grid">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <div class="panel-title pull-left">Solución  del Ticket - ${ticket?.caso?.fechaDeSolucion}</div>
                                        <div class="pull-right"> <a href="#" data-toggle="modal" data-target="#panel-question" class="btn-question"><i class="fa fa-question-circle"></i></a> <a href="#" class="btn-minmax"><i class="fa fa-chevron-circle-up"></i></a> <a href="#" class="btn-close"><i class="fa fa-times-circle"></i></a> </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="panel-body"> 
                                        <div class="col-md-12">
                                            ${ticket?.caso?.solucion}
                                        </div>
                                    </div>
                                </div>
                            </div> 
                                    </div>
                                   <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ENLACE"> 
                                       <div class="col-md-12 col-sm-4 col-xs-4">
                                        <g:if test="${ticket?.caso?.estado?.id !=4}">
                                           <a class="btn btn-danger pull-right" href="${createLink(controller:'solicitudDeCaso', action:'cerrarTicket', params:['casoId':ticket?.caso?.id])}" type="submit"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cerrar Ticket&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                        </g:if> 
                                        <g:else>
                                            <div class="btn btn-danger pull-right" > Fecha de Cierre ${ticket?.caso?.fechaDeCierre}</div>
                                        </g:else>
                                            
                                       </div><br><br>
                                    </sec:ifAnyGranted>
                                       <sec:ifAnyGranted roles="ROLE_ATENCION">
                                        <g:if test="${ticket?.caso?.estado?.id ==4}">
                                            <div class="btn btn-danger pull-right" > Fecha de Cierre ${ticket?.caso?.fechaDeCierre}</div><br><br>
                                        </g:if>    
                                       </sec:ifAnyGranted>
            </g:else>                 
                    <br>
            <g:if test="${adjuntos}">        
                    <div class="row" id="powerwidgets">
                        <div class="col-md-12 bootstrap-grid">
                            <div class="panel panel-success">
                                <div class="panel-heading">
                                    <div class="panel-title pull-left">Archivos Adjuntos</div>
                                    <div class="pull-right"> <a href="#" data-toggle="modal" data-target="#panel-question" class="btn-question"><i class="fa fa-question-circle"></i></a> <a href="#" class="btn-minmax"><i class="fa fa-chevron-circle-up"></i></a> <a href="#" class="btn-close"><i class="fa fa-times-circle"></i></a> </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="panel-body">  
                                    <div class="inner-spacer">
                                        <table class="table table-striped table-hover margin-0px">
                                            <thead>
                                                <tr>
                                                    <th>Nombre del Archivo</th>
                                                    <th>Fecha de Adjunto</th>
                                                    <th style="text-align: center;">Descargar Archivo</th>
                                                </tr>
                                            </thead>
                                            <tbody> 
                                                <g:each in="${adjuntos}" var="archivo">
                                                <tr>
                                                    <td>${archivo?.nombreDelAdjunto}</td>
                                                    <td><b>${archivo?.fecha}</b></td>
                                                    <td  style="text-align: center; font-size: 2em;"><a href="${createLink(controller:'solicitudDeCaso', action:'descargarAdjunto', params:['ruta':archivo?.rutaDelAdjunto, 'nombre':archivo?.nombreDelAdjunto])}"><i class="fa fa-cloud-download"></i></a></td>
                                                </tr> 
                                                </g:each>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div> 
                        </div>       
                    </div>    
           </g:if>         
          
       <div class="row" id="powerwidgets">
          <div class="col-md-12 bootstrap-grid"> 
            
            <!-- New widget -->
            <div class="powerwidget green" data-widget-editbutton="false">
              <header>
                <h2>Comentarios<small>Ticket número ${ticket?.caso?.id} </small></h2>
              </header>
              <div class="inner-spacer">
                <div class="chat-container">
                  <div class="top-buttons clearfix">
                    <h2 class="margin-0px pull-left">Comentarios</h2>
  
                    
                  </div>

                  <div class="chat-container">
                    <div class="chat-pusher">
                      <div class="chat-content"><!-- this is the wrapper for the content -->
                        <div class="nano"><!-- this is the nanoscroller -->
                          <div class="nano-content">
                            <div class="chat-content-inner"><!-- extra div for emulating position:fixed of the menu --> 
                              
                              <!-- Top Navigation -->
                              
                              <div class="clearfix">
                                <div class="chat-messages chat-messages-with-sidebar">
                                  <ul>
                                  <g:each in="${comentarios}" name="comentarios" var="comentario">
                                      <li class="left clearfix">
                                          <div class="user-img pull-left"> <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK1WGffpNLKxiRcqrWr3RKn25qrBhYGbFfpBVLelfOXbpZJ9XK" alt="User Avatar" /> </div>
                                          <div class="chat-body clearfix">
                                              <div class="header"> <span class="name">${comentario?.usuario}</span><span class="name"></span> <span class="badge"><i class="fa fa-clock-o"></i>${comentario?.fechaDeComentario}</span></div>
                                              <p>${comentario?.textoComentario} </p>
                                          </div>
                                      </li>
                                  </g:each>    
                                      
                                    
                                  </ul>
                                </div>
                              </div>
                            </div>
                            
                            <!-- /chat-content-inner --> 
                          </div>
                        </div>
                        
                        <!-- /nano --> 
                        
                      </div>
                      
                      <!-- /chat-content --> 
                    </div>
                    <!-- /chat-pusher --> 
                  </div>
                </div>
                <!-- /chat-container--> 
                <!--Chat-form -->
                    <g:if test="${ticket?.caso?.estado?.id==4}">
                        <br><br>
                            <div class="row" id="powerwidgets">
                                <div class="col-md-12 bootstrap-grid">
                                    <div class="panel panel-success">
                                        <div class="panel-heading">
                                            <div class="panel-title pull-left">Encuesta de Satisfacción</div>
                                            <div class="pull-right"> <a href="#" data-toggle="modal" data-target="#panel-question" class="btn-question"><i class="fa fa-question-circle"></i></a> <a href="#" class="btn-minmax"><i class="fa fa-chevron-circle-up"></i></a> <a href="#" class="btn-close"><i class="fa fa-times-circle"></i></a> </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="panel-body">  
                                            <div class="inner-spacer">

                                                <div class="col-md-6 ">
                                                    <fieldset> 
                                                        <section>   
                                                           <g:each name="rubros" in="${rubros}" var="rubro">
                                                                                     <div class="alert alert-success alert-dismissable">
                                                                <strong>${rubro}</strong> 
                                                            </div>                              
                                                                    <g:each name="preguntas" in="${encuestaContestada}" var="pregunta">
                                                                        <g:if test="${pregunta?.pregunta?.rubro==rubro}">
                                                                               <p class="lead" style="margin-left: 5%;"> 
                                                                            ${pregunta}<br>
                                                                            <% for(int a=0; a< pregunta?.valor ; a++) {%>
                                                                            <i style="color: #D7DF01;" class="fa fa-star"></i>
                                                                            <%}%>                                                                               
                                                                               </p>
                                                                        </g:if> 
                                                                    </g:each>    
                                                            
                                                           </g:each>    
                                                         

                                                        </section>
                                                    </fieldset>
                                                </div>
                                                <div class="col-md-6 ">
                                                    <fieldset> 
                                                        <section>                                                            
                                                            <div class="alert alert-success alert-dismissable">
                                                                <strong>Observaciones</strong>                                                          
                                                            </div> 
                                                            <p class="lead" style="text-align: justify;">
                                                                    ${observaciones?.observacion}
                                                                </p>
                                                        </section>  
                                                    </fieldset>  
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                </div>       
                            </div>  
                        </g:if>    
                            
                
                <div class="chat-message-form">
                          <g:if test="${ticket?.caso?.estado?.id !=4}">  
                    <g:form name="comentario"  controller="solicitudDeCaso" >
                        <input type="hidden" name="casoId" value="${ticket?.caso?.id}">
                    <div class="row">
                    <div class="col-md-12">
                      <textarea placeholder="Escribe tu comentario ..." class="form-control margin-bottom" rows="2" name="comentario" required></textarea>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                      <div class="btn-group">
                          <a href="#myModal1" role="button" class="btn btn-default" data-toggle="modal"><i class="fa entypo-attach"></i></a>                                                    
                      </div>
                    </div>
                        <div class="col-md-4 col-sm-4 col-xs-4">                
                                    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION,ROLE_TURNAR"> 
                            <div  class="orb-form">       
                                <label class="select">
                                    <g:select from="${areas}" name="areaId" optionKey="id"  optionValue="nombre"/>                                  
                                </label>                                    
                            </div>      
                                </sec:ifAnyGranted>
                        </div>   
                        <div class="col-md-1 col-sm-1 col-xs-1"> 
                                    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION,ROLE_TURNAR"> 
                            <g:actionSubmit value="Turnar Caso " onclick="return confirm('¿Esta seguro que desea turnar el caso?')" action="turnarCaso" class="btn btn-danger pull-left"/>
                                    </sec:ifAnyGranted> 
                        </div>
                     <div class="col-md-4 col-sm-4 col-xs-4"> 
                         <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ENLACE"> 
                             <input type="hidden" name="usuario" value="${ticket?.caso?.responsable?.id}">
                              <g:actionSubmit value=" Enviar Comentario  ENLACE"  action="saveComentario" class="btn btn-success pull-right" /> 
                         </sec:ifAnyGranted>
                         <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION"> 
                             <input type="hidden" name="usuario" value="${ticket?.caso?.creador?.id}">
                             <g:actionSubmit value=" Enviar Comentario  ATENCION"  action="saveComentario" class="btn btn-success pull-right" />
                         </sec:ifAnyGranted>
                    </div>
                  </div>
                  </g:form>
                   </g:if>
                </div>
                
                <!-- /Chat-form --> 
                
              </div>
            </div>
            <!-- End Widget --> 
            
          </div>
          <!-- /Inner Row Col-md-12 --> 
        </div>
        
        
                
        
<div id="myModal1" class="modal" data-easein="fadeInLeft" data-easeout="fadeOutLeft"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title" id="myModalLabel">Adjuntar Archivo al Ticket</h4>
      </div>
      <div class="modal-body">
        <p>En este apartado podra subir cualquier tipo de archivo al ticket.</p>
      </div>
      <div class="modal-footer">          
          <g:uploadForm action="" class="orb-form" url="[controller: 'solicitudDeCaso', action:'adjuntarArchivo']">
              <input type="hidden" value="${ticket?.caso?.id}" name="casoId">
                  <fieldset>
                    <section>
                      <label class="label"></label>
                      <label for="file" class="input input-file">         
                          <input type="file" id="file" required="true" name="file" style="color: gray;">
                      </label>
                    </section>
                      <button class="btn btn-success" type="submit">Adjuntar Archivo</button>
          </fieldset>
          </g:uploadForm>       
      </div>
    </div>
  </div>
</div>
          </g:if>
          <g:else> <!-ELSE PARA VER EL ERROR DE NO ESTA AUTORIADO-->
                <!-- Widget Row Start grid -->
              
              
                <sec:ifAnyGranted roles="ROLE_CONSULTA"> 
         <div class="page-header">
            <h1>Ticket número ${ticket?.caso?.id}<small>${usuario?.unidad}</small></h1>
        </div>
        
       
        
        
        <g:if test="${respuesta=='true'}">                            
            <div class="callout callout-info">
                <h4>Se ha agregado correctamente el comentario al Ticket ${ticket?.caso?.id}</h4>
            </div>  
        </g:if>
        <g:if test="${respuesta=='false'}">
            <div class="callout callout-danger">
                <h4>Error</h4>
                <p>No se agrego correctamente el comentario al Ticket ${ticket?.caso?.id}</p>
            </div>                                
        </g:if>
            
                 <g:if test="${adjunto=='true'}">                            
            <div class="callout callout-info">
                <h4>Se ha agregado correctamente el adjunto al Ticket ${ticket?.caso?.id}</h4>
            </div>  
        </g:if>
        <g:if test="${adjunto=='false'}">
            <div class="callout callout-danger">
                <h4>Error</h4>
                <p>No se agrego correctamente el adjunto al Ticket ${ticket?.caso?.id}, Intetelo de nuevo</p>
            </div>                                
        </g:if>   
        <g:if test="${resuelto=='true'}">                            
            <div class="callout callout-info">
                <h4>Se ha atendido correctamente el Ticket ${ticket?.caso?.id}</h4>
            </div>  
        </g:if>
        <g:if test="${resuelto=='false'}">
            <div class="callout callout-danger">
                <h4>Error</h4>
                <p>No se actualizo el status del Ticket ${ticket?.caso?.id}</p>
            </div>                                
        </g:if>            
            
        <g:if test="${cerrado=='true'}">                            
            <div class="callout callout-info">
                <h4>Se ha concluido correctamente el Ticket ${ticket?.caso?.id}</h4>
            </div>  
        </g:if>
        <g:if test="${cerrado=='false'}">
            <div class="callout callout-danger">
                <h4>Error</h4>
                <p>No se cerro el Ticket ${ticket?.caso?.id} correctamente; favor de intentarlo mas tarde.</p>
            </div>                                
        </g:if>    

        <g:if test="${success}">                            
            <div class="callout callout-info">
                <h4>Se ejecuto correctamente la operación</h4>
                <p>${success}</p>
            </div>  
        </g:if>
        <g:if test="${fail}">
            <div class="callout callout-danger">
                <h4>Error</h4>
                <p>${fail}</p>
            </div>                                
        </g:if>       
            

<!--Panel-->
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title pull-left">Detalles del Ticket</div>
                <div class="pull-right"> <a href="#" data-toggle="modal" data-target="#panel-question" class="btn-question"><i class="fa fa-question-circle"></i></a> <a href="#" class="btn-minmax"><i class="fa fa-chevron-circle-up"></i></a> <a href="#" class="btn-close"><i class="fa fa-times-circle"></i></a> </div>
                <div class="clearfix"></div>
            </div>
            <div class="panel-body">
<!-- Widget Row Start grid -->
                <div class="row" id="powerwidgets">
                    <div class="col-md-6 bootstrap-grid"> 
                      <!-- New widget -->

                        <div class="inner-spacer">
                            <table class="table table-striped table-hover margin-0px">
                                <thead>
                                    <tr>
                                        <th>Campo</th>
                                        <th>Valor</th>
                                    </tr>
                                </thead>
                                <tbody> 
                                    <tr>
                                        <td>Estado del Ticket</td>
                                        <td><b>${ticket?.caso?.estado}</b></td>
                                    </tr>
                                    <tr>
                                        <td>Creador del Ticket</td>
                                        <td>${ticket?.caso?.creador}</td>
                                    </tr>
                                    <tr>
                                        <td>Unidad Administrativa</td>
                                        <td>${mx.gob.ifr.rt.UsuarioUnidadAdministrativa.findByUsuario(ticket?.caso?.creador)?.unidad}</td>
                                    </tr>
                                    <tr>
                                        <td>Fecha de Creación</td>
                                        <td>${ticket?.caso?.fechaDeCreacion}</td>
                                    </tr>
                                    <tr>
                                        <td>Propietario de Atencion</td>
                                        <td>${ticket?.caso?.propietarioActual}</span></td>
                                    </tr>
                                    <tr>
                                        <td>Problema</td>
                                        <td>${ticket?.categoria}</td>
                                    </tr>
                                    <g:if test="${ticket?.caso?.estado?.id==4}"> 
                                    <tr>
                                        <td>Atendio</td>
                                        <td>${ticket?.caso?.responsable}</td>
                                    </tr>
                                    </g:if>
                                    
                                    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION"> 
                                    <tr>
                                        <td>Prioridad</td>
                                        <g:if test="${ticket?.categoria?.prioridad.id==1}">  
                                            <td><span class="label label-danger">${ticket?.categoria?.prioridad} | ${ticket?.categoria?.prioridad?.tiempoDeResolucion}</span></td>
                                        </g:if>
                                        <g:if test="${ticket?.categoria?.prioridad.id==2}">  
                                            <td><span class="label label-danger">${ticket?.categoria?.prioridad} | ${ticket?.categoria?.prioridad?.tiempoDeResolucion}</span></td>
                                        </g:if>
                                        <g:if test="${ticket?.categoria?.prioridad.id==3}">  
                                            <td><span class="label label-warning">${ticket?.categoria?.prioridad} | ${ticket?.categoria?.prioridad?.tiempoDeResolucion}</span></td>
                                        </g:if>
                                        <g:if test="${ticket?.categoria?.prioridad.id==4}">  
                                            <td><span class="label label-info">${ticket?.categoria?.prioridad} | ${ticket?.categoria?.prioridad?.tiempoDeResolucion}</span></td>
                                        </g:if>
                                        <g:if test="${ticket?.categoria?.prioridad.id==5}">  
                                            <td><span class="label label-success">${ticket?.categoria?.prioridad} | ${ticket?.categoria?.prioridad?.tiempoDeResolucion}</span></td>
                                        </g:if>

                                    </tr>
                                    </sec:ifAnyGranted>
                                    <g:each in="${valoresDatosRequeridos}" var="datoRequerido" name="valoresDatosRequeridos">  
                                        <tr>
                                            <td>${datoRequerido?.campo}</td>
                                            <td><b>${datoRequerido?.valor=='' ? '---' : datoRequerido?.valor}</b></td>
                                        </tr>
                                    </g:each>
                                </tbody>
                            </table>
                        </div>
                      <!-- End .powerwidget --> 
                    </div> 
                    <div class="col-md-6 bootstrap-grid">                 

                        <div class="icon-block"><i class="fa fa-5x fa-bell"></i></div>
                        <p style="text-align: justify;"> <h2>Descripción del Problema</h2> ${ticket?.caso?.descripcionDelProblema} </p>


                    </div> 
                </div>
                <!--/Panel--> 
                        <!--User Chat Panel-->

            </div>          
        </div>   
       
            
            <g:if test="${ticket?.caso?.estado?.id == 1 || ticket?.caso?.estado?.id == 2}">
                 <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION"> 
                 <g:form name="resolverTicket"  url="[controller: 'solicitudDeCaso', action:'resolverTicket']" >
                     <input type="hidden" name="casoId" value="${ticket?.caso?.id}">
                        <div class="row" id="powerwidgets">
                            <div class="col-md-6 bootstrap-grid">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <div class="panel-title pull-left">Diagnóstico del Ticket</div>
                                        <div class="pull-right"> <a href="#" data-toggle="modal" data-target="#panel-question" class="btn-question"><i class="fa fa-question-circle"></i></a> <a href="#" class="btn-minmax"><i class="fa fa-chevron-circle-up"></i></a> <a href="#" class="btn-close"><i class="fa fa-times-circle"></i></a> </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="panel-body">  
                                        <div class="col-md-12">
                                            <textarea placeholder="Escribe el diagnostico del problema presentado ..." class="form-control margin-bottom" rows="4" name="diagnostico" required>${ticket?.caso?.diagnostico}</textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 bootstrap-grid">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <div class="panel-title pull-left">Solución  del Ticket</div>
                                        <div class="pull-right"> <a href="#" data-toggle="modal" data-target="#panel-question" class="btn-question"><i class="fa fa-question-circle"></i></a> <a href="#" class="btn-minmax"><i class="fa fa-chevron-circle-up"></i></a> <a href="#" class="btn-close"><i class="fa fa-times-circle"></i></a> </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="panel-body"> 
                                        <div class="col-md-12">
                                            <textarea placeholder="Escribe la solución del problema presentado..." class="form-control margin-bottom" rows="4" name="solucion" required>${ticket?.caso?.solucion}</textarea>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                            <div class="col-md-12 col-sm-4 col-xs-4">
                                <button class="btn btn-danger pull-right"  type="submit">Resolver Ticket</button>
                            </div>
                        </div>
                     </g:form> 
 </sec:ifAnyGranted>
            </g:if>  
            <g:else>
                                    <div class="row" id="powerwidgets">
                            <div class="col-md-6 bootstrap-grid">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <div class="panel-title pull-left">Diagnóstico del Ticket - ${ticket?.caso?.fechaDeDiagnostico}</div>
                                        <div class="pull-right"> <a href="#" data-toggle="modal" data-target="#panel-question" class="btn-question"><i class="fa fa-question-circle"></i></a> <a href="#" class="btn-minmax"><i class="fa fa-chevron-circle-up"></i></a> <a href="#" class="btn-close"><i class="fa fa-times-circle"></i></a> </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="panel-body">  
                                        <div class="col-md-12">
                                            ${ticket?.caso?.diagnostico}
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 bootstrap-grid">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        <div class="panel-title pull-left">Solución  del Ticket - ${ticket?.caso?.fechaDeSolucion}</div>
                                        <div class="pull-right"> <a href="#" data-toggle="modal" data-target="#panel-question" class="btn-question"><i class="fa fa-question-circle"></i></a> <a href="#" class="btn-minmax"><i class="fa fa-chevron-circle-up"></i></a> <a href="#" class="btn-close"><i class="fa fa-times-circle"></i></a> </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="panel-body"> 
                                        <div class="col-md-12">
                                            ${ticket?.caso?.solucion}
                                        </div>
                                    </div>
                                </div>
                            </div> 
                                    </div>
                                   <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ENLACE"> 
                                       <div class="col-md-12 col-sm-4 col-xs-4">
                                        <g:if test="${ticket?.caso?.estado?.id !=4}">
                                           <a class="btn btn-danger pull-right" href="${createLink(controller:'solicitudDeCaso', action:'cerrarTicket', params:['casoId':ticket?.caso?.id])}" type="submit"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Cerrar Ticket&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                                        </g:if> 
                                        <g:else>
                                            <div class="btn btn-danger pull-right" > Fecha de Cierre ${ticket?.caso?.fechaDeCierre}</div>
                                        </g:else>
                                            
                                       </div><br><br>
                                    </sec:ifAnyGranted>
                                       <sec:ifAnyGranted roles="ROLE_ATENCION">
                                        <g:if test="${ticket?.caso?.estado?.id ==4}">
                                            <div class="btn btn-danger pull-right" > Fecha de Cierre ${ticket?.caso?.fechaDeCierre}</div><br><br>
                                        </g:if>    
                                       </sec:ifAnyGranted>
            </g:else>                 
                    <br>
            <g:if test="${adjuntos}">        
                    <div class="row" id="powerwidgets">
                        <div class="col-md-12 bootstrap-grid">
                            <div class="panel panel-success">
                                <div class="panel-heading">
                                    <div class="panel-title pull-left">Archivos Adjuntos</div>
                                    <div class="pull-right"> <a href="#" data-toggle="modal" data-target="#panel-question" class="btn-question"><i class="fa fa-question-circle"></i></a> <a href="#" class="btn-minmax"><i class="fa fa-chevron-circle-up"></i></a> <a href="#" class="btn-close"><i class="fa fa-times-circle"></i></a> </div>
                                    <div class="clearfix"></div>
                                </div>
                                <div class="panel-body">  
                                    <div class="inner-spacer">
                                        <table class="table table-striped table-hover margin-0px">
                                            <thead>
                                                <tr>
                                                    <th>Nombre del Archivo</th>
                                                    <th>Fecha de Adjunto</th>
                                                    <th style="text-align: center;">Descargar Archivo</th>
                                                </tr>
                                            </thead>
                                            <tbody> 
                                                <g:each in="${adjuntos}" var="archivo">
                                                <tr>
                                                    <td>${archivo?.nombreDelAdjunto}</td>
                                                    <td><b>${archivo?.fecha}</b></td>
                                                    <td  style="text-align: center; font-size: 2em;"><a href="${createLink(controller:'solicitudDeCaso', action:'descargarAdjunto', params:['ruta':archivo?.rutaDelAdjunto, 'nombre':archivo?.nombreDelAdjunto])}"><i class="fa fa-cloud-download"></i></a></td>
                                                </tr> 
                                                </g:each>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div> 
                        </div>       
                    </div>    
           </g:if>         
          
       <div class="row" id="powerwidgets">
          <div class="col-md-12 bootstrap-grid"> 
            
            <!-- New widget -->
            <div class="powerwidget green" data-widget-editbutton="false">
              <header>
                <h2>Comentarios<small>Ticket número ${ticket?.caso?.id} </small></h2>
              </header>
              <div class="inner-spacer">
                <div class="chat-container">
                  <div class="top-buttons clearfix">
                    <h2 class="margin-0px pull-left">Comentarios</h2>
  
                    
                  </div>

                  <div class="chat-container">
                    <div class="chat-pusher">
                      <div class="chat-content"><!-- this is the wrapper for the content -->
                        <div class="nano"><!-- this is the nanoscroller -->
                          <div class="nano-content">
                            <div class="chat-content-inner"><!-- extra div for emulating position:fixed of the menu --> 
                              
                              <!-- Top Navigation -->
                              
                              <div class="clearfix">
                                <div class="chat-messages chat-messages-with-sidebar">
                                  <ul>
                                  <g:each in="${comentarios}" name="comentarios" var="comentario">
                                      <li class="left clearfix">
                                          <div class="user-img pull-left"> <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK1WGffpNLKxiRcqrWr3RKn25qrBhYGbFfpBVLelfOXbpZJ9XK" alt="User Avatar" /> </div>
                                          <div class="chat-body clearfix">
                                              <div class="header"> <span class="name">${comentario?.usuario}</span><span class="name"></span> <span class="badge"><i class="fa fa-clock-o"></i>${comentario?.fechaDeComentario}</span></div>
                                              <p>${comentario?.textoComentario} </p>
                                          </div>
                                      </li>
                                  </g:each>    
                                      
                                    
                                  </ul>
                                </div>
                              </div>
                            </div>
                            
                            <!-- /chat-content-inner --> 
                          </div>
                        </div>
                        
                        <!-- /nano --> 
                        
                      </div>
                      
                      <!-- /chat-content --> 
                    </div>
                    <!-- /chat-pusher --> 
                  </div>
                </div>
                <!-- /chat-container--> 
                <!--Chat-form -->
                    <g:if test="${ticket?.caso?.estado?.id==4}">
                        <br><br>
                            <div class="row" id="powerwidgets">
                                <div class="col-md-12 bootstrap-grid">
                                    <div class="panel panel-success">
                                        <div class="panel-heading">
                                            <div class="panel-title pull-left">Encuesta de Satisfacción</div>
                                            <div class="pull-right"> <a href="#" data-toggle="modal" data-target="#panel-question" class="btn-question"><i class="fa fa-question-circle"></i></a> <a href="#" class="btn-minmax"><i class="fa fa-chevron-circle-up"></i></a> <a href="#" class="btn-close"><i class="fa fa-times-circle"></i></a> </div>
                                            <div class="clearfix"></div>
                                        </div>
                                        <div class="panel-body">  
                                            <div class="inner-spacer">

                                                <div class="col-md-6 ">
                                                    <fieldset> 
                                                        <section>                                                            
                                                            <div class="alert alert-success alert-dismissable">
                                                                <strong>Sistemas (Portal de Pagos, SIREM WEB)</strong> 
                                                            </div>
                                                            <br> 
                                                            <p class="lead" style="margin-left: 5%;"> Facilidad de Uso &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <% for(int a=0; a< encuesta?.facilidadDeUso ; a++) {%>
                                                                <i class="fa fa-star"></i>
                                                                <%}%>
                                                            </p>  
                                                            <p class="lead" style="margin-left: 5%;"> Tiempos de Respuesta &nbsp;&nbsp;
                                                                <% for(int a=0; a< encuesta?.tiemposDeRespuesta ; a++) {%>
                                                                <i class="fa fa-star"></i>
                                                                <%}%>
                                                            </p>
                                                            <p class="lead" style="margin-left: 5%;"> Disponibilidad &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <% for(int a=0; a< encuesta?.disponibilidad ; a++) {%>
                                                                <i class="fa fa-star" ></i>
                                                                <%}%>
                                                            </p>
                                                            <p class="lead" style="margin-left: 5%;"> Satisfaccion General &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <% for(int a=0; a< encuesta?.satisfaccion ; a++) {%>
                                                                <i class="fa fa-star"></i>
                                                                <%}%>
                                                            </p>
                                                            <!--  -------------------------------------------------------------------->
                                                            <div class="alert alert-success alert-dismissable">
                                                                <strong>Infraestructura</strong> 
                                                            </div>
                                                            <p class="lead" style="margin-left: 5%;"> Estado del Equipo de Cómputo &nbsp;&nbsp;
                                                                <% for(int a=0; a< encuesta?.estadoDelEquipo ; a++) {%>
                                                                <i class="fa fa-star"></i>
                                                                <%}%>
                                                            </p>
                                                            <p class="lead" style="margin-left: 5%;"> Estado del cableado de red &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <% for(int a=0; a< encuesta?.estadoDeCableado ; a++) {%>
                                                                <i class="fa fa-star" ></i>
                                                                <%}%>
                                                            </p>
                                                            <p class="lead" style="margin-left: 5%;"> Velocidad de la Red &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <% for(int a=0; a< encuesta?.velocidad ; a++) {%>
                                                                <i class="fa fa-star"></i>
                                                                <%}%>
                                                            </p>
                                                            <!--  -------------------------------------------------------------------->
                                                            <div class="alert alert-success alert-dismissable">
                                                                <strong>Atención</strong> 
                                                            </div>
                                                            <p class="lead" style="margin-left: 5%;"> Rapidez &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <% for(int a=0; a< encuesta?.rapidez ; a++) {%>
                                                                <i class="fa fa-star"></i>
                                                                <%}%>
                                                            </p>
                                                            <p class="lead" style="margin-left: 5%;"> Amabilidad &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <% for(int a=0; a< encuesta?.amabilidad ; a++) {%>
                                                                <i class="fa fa-star" ></i>
                                                                <%}%>
                                                            </p>
                                                            <p class="lead" style="margin-left: 5%;"> Resolución en un tiempo apropiado &nbsp;&nbsp;
                                                                <% for(int a=0; a< encuesta?.resolucion ; a++) {%>
                                                                <i class="fa fa-star"></i>
                                                                <%}%>
                                                            </p> 
                                                            <p class="lead" style="margin-left: 5%;"> Claridad de la respuesta &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                <% for(int a=0; a< encuesta?.claridad ; a++) {%>
                                                                <i class="fa fa-star"></i>
                                                                <%}%>
                                                            </p>

                                                        </section>
                                                    </fieldset>
                                                </div>
                                                <div class="col-md-6 ">
                                                    <fieldset> 
                                                        <section>                                                            
                                                            <div class="alert alert-success alert-dismissable">
                                                                <strong>Observaciones</strong>                                                          
                                                            </div> 
                                                            <p class="lead" style="text-align: justify;">
                                                                    ${encuesta?.observaciones}
                                                                </p>
                                                        </section>  
                                                    </fieldset>  
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                </div>       
                            </div>  
                        </g:if>    
                            
                
                <div class="chat-message-form">
                          <g:if test="${ticket?.caso?.estado?.id !=4}">  
                    <g:form name="comentario"  controller="solicitudDeCaso" >
                        <input type="hidden" name="casoId" value="${ticket?.caso?.id}">
                    <div class="row">
                    <div class="col-md-12">
                      <textarea placeholder="Escribe tu comentario ..." class="form-control margin-bottom" rows="2" name="comentario" required></textarea>
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-3">
                      <div class="btn-group">
                          <a href="#myModal1" role="button" class="btn btn-default" data-toggle="modal"><i class="fa entypo-attach"></i></a>                                                    
                      </div>
                    </div>
                        <div class="col-md-4 col-sm-4 col-xs-4">                
                                    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION,ROLE_TURNAR"> 
                            <div  class="orb-form">       
                                <label class="select">
                                    <g:select from="${areas}" name="areaId" optionKey="id"  optionValue="nombre"/>                                  
                                </label>                                    
                            </div>      
                                </sec:ifAnyGranted>
                        </div>   
                        <div class="col-md-1 col-sm-1 col-xs-1"> 
                                    <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION,ROLE_TURNAR"> 
                            <g:actionSubmit value="Turnar Caso " onclick="return confirm('¿Esta seguro que desea turnar el caso?')" action="turnarCaso" class="btn btn-danger pull-left"/>
                                    </sec:ifAnyGranted> 
                        </div>
                     <div class="col-md-4 col-sm-4 col-xs-4"> 
                         <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ENLACE"> 
                             <input type="hidden" name="usuario" value="${ticket?.caso?.responsable?.id}">
                              <g:actionSubmit value=" Enviar Comentario  ENLACE"  action="saveComentario" class="btn btn-success pull-right" /> 
                         </sec:ifAnyGranted>
                         <sec:ifAnyGranted roles="ROLE_ADMIN,ROLE_ATENCION"> 
                             <input type="hidden" name="usuario" value="${ticket?.caso?.creador?.id}">
                             <g:actionSubmit value=" Enviar Comentario  ATENCION"  action="saveComentario" class="btn btn-success pull-right" />
                         </sec:ifAnyGranted>
                    </div>
                  </div>
                  </g:form>
                   </g:if>
                </div>
                
                <!-- /Chat-form --> 
                
              </div>
            </div>
            <!-- End Widget --> 
            
          </div>
          <!-- /Inner Row Col-md-12 --> 
        </div>
        
        
                
        
<div id="myModal1" class="modal" data-easein="fadeInLeft" data-easeout="fadeOutLeft"  role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title" id="myModalLabel">Adjuntar Archivo al Ticket</h4>
      </div>
      <div class="modal-body">
        <p>En este apartado podra subir cualquier tipo de archivo al ticket.</p>
      </div>
      <div class="modal-footer">          
          <g:uploadForm action="" class="orb-form" url="[controller: 'solicitudDeCaso', action:'adjuntarArchivo']">
              <input type="hidden" value="${ticket?.caso?.id}" name="casoId">
                  <fieldset>
                    <section>
                      <label class="label"></label>
                      <label for="file" class="input input-file">         
                          <input type="file" id="file" required="true" name="file" style="color: gray;">
                      </label>
                    </section>
                      <button class="btn btn-success" type="submit">Adjuntar Archivo</button>
          </fieldset>
          </g:uploadForm>       
      </div>
    </div>
  </div>
</div>
        </sec:ifAnyGranted> 
              
            <sec:ifNotGranted roles="ROLE_CONSULTA">      
        <div class="row" id="powerwidgets">
          <div class="col-md-12 bootstrap-grid"> 
            
            <!--Panel-->
            <div class="panel panel-danger">
              <div class="panel-heading">
                <div class="panel-title pull-left">Consulta de Ticket<small>error</small></div>
                <div class="pull-right"> <a href="#" data-toggle="modal" data-target="#panel-question" class="btn-question"><i class="fa fa-question-circle"></i></a> <a href="#" class="btn-minmax"><i class="fa fa-chevron-circle-up"></i></a> <a href="#" class="btn-close"><i class="fa fa-times-circle"></i></a> </div>
                <div class="clearfix"></div>
              </div>
              <div class="panel-body">
                <div class="callout callout-danger">
                  <h4>Acceso Denegado !!!</h4>
                  <p>El número de ticket ingresado <b>no corresponde a su Unidad Administrativa</b>, favor de verificarlo e intentarlo de nuevo.</p>
                </div>
              </div>
            </div> 
          </div>
        </div>
        </sec:ifNotGranted>
        
      
        
        
        
        
        </g:else>    
        </g:if>
        
        <g:else>
                <!-- Widget Row Start grid -->
        <div class="row" id="powerwidgets">
          <div class="col-md-12 bootstrap-grid"> 
            
            <!--Panel-->
            <div class="panel panel-danger">
              <div class="panel-heading">
                <div class="panel-title pull-left">Consulta de Ticket<small>error</small></div>
                <div class="pull-right"> <a href="#" data-toggle="modal" data-target="#panel-question" class="btn-question"><i class="fa fa-question-circle"></i></a> <a href="#" class="btn-minmax"><i class="fa fa-chevron-circle-up"></i></a> <a href="#" class="btn-close"><i class="fa fa-times-circle"></i></a> </div>
                <div class="clearfix"></div>
              </div>
              <div class="panel-body">
                <div class="callout callout-danger">
                  <h4>Error en la cosnulta de Ticket</h4>
                  <p>El número de ticket ingresao <b>no existe</b>, favor de verificar e intentarlo de nuevo</p>
                </div>
              </div>
            </div> 
          </div>
        </div>
        </g:else>    
        
    </body>
</html>
