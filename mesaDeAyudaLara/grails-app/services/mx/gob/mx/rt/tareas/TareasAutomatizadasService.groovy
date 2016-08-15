package mx.gob.mx.rt.tareas

import mx.gob.ifr.rt.*
import mx.gob.ifr.rt.ConfiguracionDeMesaDeAyuda
import mx.gob.ifr.rt.EncuestaDelArea
import mx.gob.ifr.rt.BitacoraDeCaso
import mx.gob.ifr.rt.CasoCategoriaDelProblema
import mx.gob.ifr.rt.Comentario
import grails.transaction.Transactional
import mx.gob.ifr.rt.EstadoDelCaso
import mx.gob.ifr.rt.PreguntasDeEncuesta
import mx.gob.ifr.rt.ValorDePregunta

@Transactional
class TareasAutomatizadasService {

    def springSecurityService
    
    def cierreDeCasosAtendidos(){
        println "init()....close Cases "
        def usuario=Usuario.get(1)
        def diaActual= new Date()
        def configuracion=ConfiguracionDeMesaDeAyuda.get(1)
        def atendido=EstadoDelCaso.get(3)
        println "---> " + atendido?.nombre?.toString()
        def casosAtendidos=Caso.findAllByEstado(atendido)
        casosAtendidos.each{
            def diferencia=null
            def diferenciaNeg=null
            def ultimoRegistro=BitacoraDeCaso.executeQuery(" from BitacoraDeCaso bc where bc.casoId=:idCaso and bc.movimiento=:mov order by bc.fecha desc", [idCaso:it?.id?.toInteger() , mov:atendido?.nombre?.toString(), max:1])
            diferencia=(diaActual.getTime() - ultimoRegistro[0]?.fecha.getTime() )/  (1000 * 60 * 60 * 24);
            if(diferencia>configuracion?.diasParaCierreDeCasos){
                println "[CRON] El Caso  se concluira por falta de retroalimentacion " + "--- Diferencia de Dias: " + diferencia  + " ( " + diaActual.format("yyyy-MM-dd mm:ss") + " - " + ultimoRegistro[0]?.fecha +" )"
                def comentario=new Comentario();
                comentario.fechaDeComentario=new Date()
                comentario.caso=it 
                comentario.usuario=usuario
                comentario.textoComentario=configuracion?.fundamentoDeCierre
                
                if(comentario.save(flush:true)){
                    it.estado=EstadoDelCaso.get(4)
                    it.fechaDeCierre= new Date()
                        if(it.save(flush:true)){
                            def bitacora= new BitacoraDeCaso()
                            bitacora.casoId=it?.id
                            bitacora.fecha=new Date()
                            bitacora.movimiento=EstadoDelCaso.get(4)?.nombre?.toString()
                            bitacora.usuarioId=usuario?.id
                        
                                    if(bitacora.save(flush:true)){
                                            println "[CRON] caso cerraso exitosamente... " +it?.id
                                    }else{
                                        bitacora.errors.each{er->
                                            println "[CRON] Error de bitacora de caso: " + er
                                        }
                                    }                               
                        }else{
                            it.errors.each{er->
                                println "[CRON] Error de cambio de estado: " + er
                            }
                        }
                }else{
                    comentario.errors.each{
                        println "[CRON] error al momneto del cambio: " + it
                    }
                }
            }  
            println "-----------------------------------------------------------------------------------------------------------------------"
            }
        
        println "casos pendientes por cerrar : " + casosAtendidos?.size()
        println "id: " + casosAtendidos?.id
    }    
    
    def cierreDeEncuestas(){
        println "init()....cerrando encuestas "
        def diaActual= new Date()
        def configuracion=ConfiguracionDeMesaDeAyuda.get(1)
        def cerrado=EstadoDelCaso.get(4)
        def casos=Caso.findAllByEncuestaResueltaAndEstado(false, cerrado)
        int o=1;
        casos.each{
            def diferencia=(diaActual.getTime() - it?.fechaDeCierre.getTime() )/  (1000 * 60 * 60 * 24);
                if(diferencia>configuracion?.diasParaCierreDeEncuestas){
                    def areaDeCaso=CasoCategoriaDelProblema.findByCaso(it)
                    def encuesta=EncuestaDelArea.findByUnidad(areaDeCaso?.categoria?.unidadAdministrativaResponsable)
                    println "Incidencia: " + o + " -- casoId: " + it?.id +" -- fechaDeCierre: " +  it?.fechaDeCierre + " --- fechaActual: " +  diaActual +" ---- diferencia: " + diferencia + " dias ------ "+ encuesta + " -------"
                    def preguntas=PreguntasDeEncuesta.findAllByEncuesta(encuesta)
                            
                        preguntas.each{pregunta->
                            def valor= new ValorDePregunta()
                            valor.caso=it
                            valor.fecha= new Date()
                            valor.pregunta=pregunta
                            valor.valor=5
                            valor.save(flush:true)
                        }

                        it.encuestaResuelta=true
                        it.save(flush:true)
                        println "       --- Encuesta contestada satisfactoriamente for system ---"

                    o++
                }           
        }
    }
   
}
