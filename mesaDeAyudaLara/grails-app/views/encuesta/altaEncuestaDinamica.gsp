


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
                <g:form  url="[controller: 'encuesta', action:'guardarEncuestaDinamica']" class="orb-form">  
                    <input type="hidden" value="${caso?.id}" name="caso">
                    <input type="hidden" value="${encuesta?.id}" name="encuesta">
                  <fieldset>
                    <section>                      
                        <% int x=1;%>
                        <g:each name="rubros" in="${rubros}" var="rubro">                        
                            <div class="alert alert-success alert-dismissable">
                                <strong>${rubro}</strong> 
                            </div>
                            <br>
                             <g:each name="rubros" in="${preguntas}" var="pregunta">  
                                    <g:if test="${pregunta?.rubro==rubro}"> 
                                        <div class="rating">
                                            <input type="radio" value="5" name="question${pregunta?.id}" id="stars-rating-${x}">
                                            <label for="stars-rating-${x}"><i class="fa fa-star"></i></label>
                                            <input type="radio"  value="4" name="question${pregunta?.id}" id="stars-rating-${x+1}">
                                            <label for="stars-rating-${x+1}"><i class="fa fa-star"></i></label>
                                            <input type="radio"  value="3" name="question${pregunta?.id}" id="stars-rating-${x+2}">
                                            <label for="stars-rating-${x+2}"><i class="fa fa-star"></i></label>
                                            <input type="radio" value="2" name="question${pregunta?.id}" id="stars-rating-${x+3}">
                                            <label for="stars-rating-${x+3}"><i class="fa fa-star"></i></label>
                                            <input type="radio" value="5" name="question${pregunta?.id}" id="stars-rating-${x+4}">
                                            <label for="stars-rating-${x+4}"><i class="fa fa-star"></i></label>
                                            ${pregunta} </div> 
                                    </g:if>  
                                 <%x=x+5;%>  
                             </g:each>  
                        </g:each>  
                      

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
