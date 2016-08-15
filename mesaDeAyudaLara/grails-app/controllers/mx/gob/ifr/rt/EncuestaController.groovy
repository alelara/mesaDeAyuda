package mx.gob.ifr.rt

class EncuestaController {
    static final org.apache.log4j.Logger myLog = org.apache.log4j.Logger.getLogger(EncuestaController)
    def index() { }
    
    def altaEncuesta={
        def caso=Caso.get(params.caso)
        def areaCaso=CasoCategoriaDelProblema.findByCaso(caso)
        def encuesta=EncuestaDelArea.findByUnidad(areaCaso?.categoria?.unidadAdministrativaResponsable)
        myLog.info "initencuesta()... " + encuesta + " ..."
        def rubros=RubrosDeEncuesta.findAllByEncuesta(encuesta)
        def preguntas=PreguntasDeEncuesta.findAllByEncuesta(encuesta)
        //[caso:caso, fail:params.fail]
        render(view:'altaEncuestaDinamica', model:[caso:caso, fail:params.fail, rubros:rubros,preguntas:preguntas, encuesta:encuesta ])
    }
    
     def guardarEncuestaDinamica={
         myLog.info "params-guardarEncuestaDinamica: " + params
         def fail=null
         def success=null
         def contieneDatos=0
         def caso=Caso.get(params.caso)
         def encuesta=EncuestaDelArea.get(params.encuesta)
         def preguntas=PreguntasDeEncuesta.findAllByEncuesta(encuesta)
        preguntas.each{
            def nombre="question"+it?.id
                if(params[nombre]){
                    myLog.info "contieneDatos" + " question"+it?.id + " _"+params[nombre]
                    contieneDatos++
                }else{
                    myLog.info "no-contieneDatos" + " question"+it?.id
                }
        }

        if(preguntas?.size()==contieneDatos){
             myLog.info "todas las preguntas contienen datos: " + contieneDatos+ " de " +   preguntas?.size() 
             preguntas.each{
                def nombre="question"+it?.id
                if(params[nombre]){
                    myLog.info "almacenandoDatos" + " question"+it?.id + " _"+params[nombre] + " _caso: " + caso
                    def valorPregunta= new ValorDePregunta()
                    valorPregunta.caso=caso
                    valorPregunta.fecha= new Date()
                    valorPregunta.pregunta=it
                    valorPregunta.valor=Integer.parseInt(params[nombre])
                        if(valorPregunta.save(flush:true)){
                            myLog.info "_datoPreguntaAsignadoCorrectamente!!!"
                            success="Encuesta contestada satisfactoriamente..."
                        }else{
                            valorPregunta.errors.each{er->
                                myLog.info "errorDeDato_Encuesta: " + er
                            }
                        }
                }else{
                    myLog.info "no-contieneDatos" + " question"+it?.id
                }
            }  
            
            if(params.observaciones!=''){
                def observaciones= new ObservacionesDeEncuesta()
                observaciones.caso=caso
                observaciones.unidad=encuesta
                observaciones.fecha=new Date()
                observaciones.observacion=params.observaciones
                myLog.info "observaciones realizadas"
                observaciones.save(flush:true) 
            }
            caso.encuestaResuelta=true
            caso.save(flush:true)         
           redirect(controller:'solicitudDeCaso', action:'verCaso', params:['idCaso':params.caso, 'fail':fail, 'success':success]) 
        }else{ 
            myLog.info "faltan preguntas que no contienen datos: " + contieneDatos + " de " +   preguntas?.size()       
            fail="Error, debera seleccionar un valor de la escala de 1 a 5 para cada uno de los aspectos."
            redirect(action:'altaEncuesta', params:['caso':params.caso, 'fail':fail, 'success':success])
        }
     }
    
    
    
    def guardarEncuesta={
        myLog.info "params-guardarEncuesta: " + params
        def fail=null
        def success=null
        def caso=Caso.get(params.caso)
        
        if(params.facilidad && params.tiempoRespuesta && params.disponibilidad && params.satisfaccion && params.equipo && params.cableado && params.velocidad && params.rapidez && params.amabilidad && params.resolucion && params.claridad)
        {
            def encuesta= new Encuesta()
                encuesta.fecha=new Date()
                encuesta.facilidadDeUso=Integer.parseInt(params.facilidad)
                encuesta.tiemposDeRespuesta=Integer.parseInt(params.tiempoRespuesta)
                encuesta.disponibilidad=Integer.parseInt(params.disponibilidad)
                encuesta.satisfaccion=Integer.parseInt(params.satisfaccion)
                encuesta.estadoDelEquipo=Integer.parseInt(params.equipo)
                encuesta.estadoDeCableado=Integer.parseInt(params.cableado)
                encuesta.velocidad=Integer.parseInt(params.velocidad)
                encuesta.rapidez=Integer.parseInt(params.rapidez)
                encuesta.amabilidad=Integer.parseInt(params.amabilidad)
                encuesta.resolucion=Integer.parseInt(params.resolucion)
                encuesta.claridad=Integer.parseInt(params.claridad)
                encuesta.caso=caso
                encuesta.contestadaPorSistema=false
                encuesta.observaciones=params.observaciones?.toUpperCase()


                if(encuesta.save(flush:true)){                
                        caso.encuestaResuelta=true
                        caso.save(flush:true)
                        success="Encuesta contestada satisfactoriamente..."
                }else{
                       fail='No se puedo contestar la encuesta, Intentelo de nuevo.'
                }

              redirect(controller:'solicitudDeCaso', action:'verCaso', params:['idCaso':params.caso, 'fail':fail, 'success':success])
        }else{
            fail="Error, debera seleccionar un valor de la escala de 1 a 5 para cada uno de los aspectos."
            redirect(action:'altaEncuesta', params:['caso':params.caso, 'fail':fail, 'success':success])
        }
    }
}
