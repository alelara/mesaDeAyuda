


<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="layout" content="rt"/>
    </head>
    <body>
        <div class="breadcrumb clearfix">
          <ul>
            <li><a ><i class="fa fa-home"></i></a></li>
            <li><a href="${createLink(controller:'solicitudDeCaso', action:'bandejaDeCasos')}">Mesa de Ayuda</a></li>
            <li class="active">Encuesta de Satisfación</li>
          </ul>
        </div>
        <!--/Breadcrumb-->

        
        <div class="col-md-12  bootstrap-grid">
            <div class="powerwidget green" id="most-form-elements" data-widget-editbutton="false">
              <header>
                <h2>Encuesta de Satisfación</h2>
              </header>
              

              
              <div class="inner-spacer">
        <g:if test="${fail}">
            <div class="callout callout-danger">
                <h4>Error</h4>
                <p>${fail}</p>
            </div>                                
        </g:if>   

     <div class="col-md-6 ">
                <g:form  url="[controller: 'encuesta', action:'guardarEncuesta']" class="orb-form">  
                    <input type="hidden" value="${caso?.id}" name="caso">
                  
                  <fieldset>
                    <section>                      
                        <div class="alert alert-success alert-dismissable">
                            <strong>Sistemas (Portal de Pagos, SIREM WEB)</strong> 
                        </div>
                        <br>
                      <div class="rating">
                          <input type="radio" value="5" name="facilidad" id="stars-rating-5">
                        <label for="stars-rating-5"><i class="fa fa-star"></i></label>
                        <input type="radio"  value="4" name="facilidad" id="stars-rating-4">
                        <label for="stars-rating-4"><i class="fa fa-star"></i></label>
                        <input type="radio"  value="3" name="facilidad" id="stars-rating-3">
                        <label for="stars-rating-3"><i class="fa fa-star"></i></label>
                        <input type="radio" value="2" name="facilidad" id="stars-rating-2">
                        <label for="stars-rating-2"><i class="fa fa-star"></i></label>
                        <input type="radio" value="5" name="facilidad" id="stars-rating-1">
                        <label for="stars-rating-1"><i class="fa fa-star"></i></label>
                        Facilidad de Uso </div>         
                                      
                      <div class="rating">
                            <input type="radio" value="5" name="tiempoRespuesta" id="stars-rating-6">
                            <label for="stars-rating-6"><i class="fa fa-star"></i></label>

                            <input type="radio"  value="4" name="tiempoRespuesta" id="stars-rating-7">
                            <label for="stars-rating-7"><i class="fa fa-star"></i></label>
                            
                            <input type="radio"  value="3" name="tiempoRespuesta" id="stars-rating-8">
                            <label for="stars-rating-8"><i class="fa fa-star"></i></label>
                            
                            <input type="radio" value="2" name="tiempoRespuesta" id="stars-rating-9">
                            <label for="stars-rating-9"><i class="fa fa-star"></i></label>
                            
                            <input type="radio" value="1" name="tiempoRespuesta" id="stars-rating-10">
                            <label for="stars-rating-10"><i class="fa fa-star"></i></label>
                        Tiempos de Respuesta 
                      </div>    
                      
                      <div class="rating">
                            <input type="radio" value="5" name="disponibilidad" id="stars-rating-11">
                            <label for="stars-rating-11"><i class="fa fa-star"></i></label>

                            <input type="radio"  value="4" name="disponibilidad" id="stars-rating-12">
                            <label for="stars-rating-12"><i class="fa fa-star"></i></label>
                            
                            <input type="radio"  value="3" name="disponibilidad" id="stars-rating-13">
                            <label for="stars-rating-13"><i class="fa fa-star"></i></label>
                            
                            <input type="radio" value="2" name="disponibilidad" id="stars-rating-14">
                            <label for="stars-rating-14"><i class="fa fa-star"></i></label>
                            
                            <input type="radio" value="1" name="disponibilidad" id="stars-rating-15">
                            <label for="stars-rating-15"><i class="fa fa-star"></i></label>
                        Disponibilidad
                      </div>             
                      
                        <div class="rating">
                            <input type="radio" value="5" name="satisfaccion" id="stars-rating-16">
                            <label for="stars-rating-16"><i class="fa fa-star"></i></label>

                            <input type="radio"  value="4" name="satisfaccion" id="stars-rating-17">
                            <label for="stars-rating-17"><i class="fa fa-star"></i></label>
                            
                            <input type="radio"  value="3" name="satisfaccion" id="stars-rating-18">
                            <label for="stars-rating-18"><i class="fa fa-star"></i></label>
                            
                            <input type="radio" value="2" name="satisfaccion" id="stars-rating-19">
                            <label for="stars-rating-19"><i class="fa fa-star"></i></label>
                            
                            <input type="radio" value="1" name="satisfaccion" id="stars-rating-20">
                            <label for="stars-rating-20"><i class="fa fa-star"></i></label>
                        Satisfacción General
                      </div>
                    </section>

                    <section>
                      <div class="alert alert-success alert-dismissable">
                            <strong>Infraestructura</strong> 
                        </div>
                        <br>
                      <div class="rating">
                          <input type="radio" value="5" name="equipo" id="stars-rating-21">
                        <label for="stars-rating-21"><i class="fa fa-star"></i></label>
                        <input type="radio"  value="4" name="equipo" id="stars-rating-22">
                        <label for="stars-rating-22"><i class="fa fa-star"></i></label>
                        <input type="radio"  value="3" name="equipo" id="stars-rating-23">
                        <label for="stars-rating-23"><i class="fa fa-star"></i></label>
                        <input type="radio" value="2" name="equipo" id="stars-rating-24">
                        <label for="stars-rating-24"><i class="fa fa-star"></i></label>
                        <input type="radio" value="5" name="equipo" id="stars-rating-25">
                        <label for="stars-rating-25"><i class="fa fa-star"></i></label>
                        Estado del Equipo de Cómputo </div>         
                                      
                      <div class="rating">
                            <input type="radio" value="5" name="cableado" id="stars-rating-26">
                            <label for="stars-rating-26"><i class="fa fa-star"></i></label>

                            <input type="radio"  value="4" name="cableado" id="stars-rating-27">
                            <label for="stars-rating-27"><i class="fa fa-star"></i></label>
                            
                            <input type="radio"  value="3" name="cableado" id="stars-rating-28">
                            <label for="stars-rating-28"><i class="fa fa-star"></i></label>
                            
                            <input type="radio" value="2" name="cableado" id="stars-rating-29">
                            <label for="stars-rating-29"><i class="fa fa-star"></i></label>
                            
                            <input type="radio" value="1" name="cableado" id="stars-rating-30">
                            <label for="stars-rating-30"><i class="fa fa-star"></i></label>
                        Estado del Cableado de Red
                      </div>    
                      
                      <div class="rating">
                            <input type="radio" value="5" name="velocidad" id="stars-rating-31">
                            <label for="stars-rating-31"><i class="fa fa-star"></i></label>

                            <input type="radio"  value="4" name="velocidad" id="stars-rating-32">
                            <label for="stars-rating-32"><i class="fa fa-star"></i></label>
                            
                            <input type="radio"  value="3" name="velocidad" id="stars-rating-33">
                            <label for="stars-rating-33"><i class="fa fa-star"></i></label>
                            
                            <input type="radio" value="2" name="velocidad" id="stars-rating-34">
                            <label for="stars-rating-34"><i class="fa fa-star"></i></label>
                            
                            <input type="radio" value="1" name="velocidad" id="stars-rating-35">
                            <label for="stars-rating-35"><i class="fa fa-star"></i></label>
                        Velocidad de Red
                      </div>             

                    </section>

                    <section>     
                        <div class="alert alert-success alert-dismissable">
                            <strong>Atención</strong> 
                        </div>
                        <br>      
                      <div class="rating">
                            <input type="radio" value="5" name="rapidez" id="stars-rating-36">
                            <label for="stars-rating-36"><i class="fa fa-star"></i></label>

                            <input type="radio"  value="4" name="rapidez" id="stars-rating-37">
                            <label for="stars-rating-37"><i class="fa fa-star"></i></label>
                            
                            <input type="radio"  value="3" name="rapidez" id="stars-rating-38">
                            <label for="stars-rating-38"><i class="fa fa-star"></i></label>
                            
                            <input type="radio" value="2" name="rapidez" id="stars-rating-39">
                            <label for="stars-rating-39"><i class="fa fa-star"></i></label>
                            
                            <input type="radio" value="1" name="rapidez" id="stars-rating-40">
                            <label for="stars-rating-40"><i class="fa fa-star"></i></label>
                        Rapidez
                      </div>    
                      
                      <div class="rating">
                            <input type="radio" value="5" name="amabilidad" id="stars-rating-41">
                            <label for="stars-rating-41"><i class="fa fa-star"></i></label>

                            <input type="radio"  value="4" name="amabilidad" id="stars-rating-42">
                            <label for="stars-rating-42"><i class="fa fa-star"></i></label>
                            
                            <input type="radio"  value="3" name="amabilidad" id="stars-rating-43">
                            <label for="stars-rating-43"><i class="fa fa-star"></i></label>
                            
                            <input type="radio" value="2" name="amabilidad" id="stars-rating-44">
                            <label for="stars-rating-44"><i class="fa fa-star"></i></label>
                            
                            <input type="radio" value="1" name="amabilidad" id="stars-rating-45">
                            <label for="stars-rating-45"><i class="fa fa-star"></i></label>
                        Amabilidad
                      </div>             
                      <div class="rating">
                            <input type="radio" value="5" name="resolucion" id="stars-rating-46">
                            <label for="stars-rating-46"><i class="fa fa-star"></i></label>

                            <input type="radio"  value="4" name="resolucion" id="stars-rating-47">
                            <label for="stars-rating-47"><i class="fa fa-star"></i></label>
                            
                            <input type="radio"  value="3" name="resolucion" id="stars-rating-48">
                            <label for="stars-rating-48"><i class="fa fa-star"></i></label>
                            
                            <input type="radio" value="2" name="resolucion" id="stars-rating-49">
                            <label for="stars-rating-49"><i class="fa fa-star"></i></label>
                            
                            <input type="radio" value="1" name="resolucion" id="stars-rating-50">
                            <label for="stars-rating-50"><i class="fa fa-star"></i></label>
                        Resolución en un tiempo apropiado
                      </div> 
                      <div class="rating">
                            <input type="radio" value="5" name="claridad" id="stars-rating-51">
                            <label for="stars-rating-51"><i class="fa fa-star"></i></label>

                            <input type="radio"  value="4" name="claridad" id="stars-rating-52">
                            <label for="stars-rating-52"><i class="fa fa-star"></i></label>
                            
                            <input type="radio"  value="3" name="claridad" id="stars-rating-53">
                            <label for="stars-rating-53"><i class="fa fa-star"></i></label>
                            
                            <input type="radio" value="2" name="claridad" id="stars-rating-54">
                            <label for="stars-rating-54"><i class="fa fa-star"></i></label>
                            
                            <input type="radio" value="1" name="claridad" id="stars-rating-55">
                            <label for="stars-rating-55"><i class="fa fa-star"></i></label>
                        Claridad de Respuesta
                      </div> 
                    </section> 
                      
                    <section>     
                        <div class="alert alert-success alert-dismissable">
                            <strong>Observaciones</strong> 
                        </div>
                        <br>
                      <label class="textarea"> <i class="icon-append fa fa-question"></i>
                        <textarea rows="3" placeholder="le pedimos que nos haga saber sus observaciones y comentarios que nos permitan mejorar nuestro servicio" maxlength="255" name="observaciones" ></textarea>
                        <b class="tooltip tooltip-top-right">En este apartado podras describir todas sus observaciones y comentarios.</b> </label>
                    </section> 
                  </fieldset> 
                  <footer>
                    <button type="submit" class="btn btn-danger
                    ">Finalizar Encuesta</button>
                  </footer>
                </g:form>
                </div>
                
                <div class="col-md-6 ">
                    <p class="lead" style="text-align: justify;"><br>
              Con el Objetivo de lograr una mejora en nuestros servicios, le solicitamos muy atentamente conteste el siguiente cuestionario, calificando con un escala de 1 a 5 cada una de los siguientes aspectos, de manera tal que:
              <br> <br> 
              <span >
                            <i class="fa fa-star" style="margin-left: 5%;"></i> Pésimo <br>
                            <i class="fa fa-star" style="margin-left: 5%;"></i><i class="fa fa-star"></i> Malo <br>
                              <i class="fa fa-star" style="margin-left: 5%;"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> Regular<br>
                                <i class="fa fa-star" style="margin-left: 5%;"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> Bueno<br>
                                  <i class="fa fa-star" style="margin-left: 5%;"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i> Excelente<br>
                    </span>
                    
              <span><br><br><i>Estimado usuario, 
              
              Le recuerdo lo importante que es para nosotros su opinión. Si usted no ha contestado aún a la misma le pido que por favor le dedique dos minutos de su tiempo. 
              <b>Si en un lapso de 30 dias no ha contestado la encuesta, se dara por hecho que esta completamente satisfecho con los servicios proporcionados.</b>
              <br><br>

Atentamente<br>
Administrador del Proceso
</i></span>
                     </p>                  
                </div>
              </div>
            </div>
          </div>
        
    </body>
</html>
