package mx.gob.mx.rt.materializacion

import mx.gob.ifr.rt.*
import mx.gob.ifr.rt.BitacoraDeCaso
import mx.gob.ifr.rt.Comentario
import mx.gob.ifr.rt.DatosRequeridos
import mx.gob.ifr.rt.EstadoDelCaso
import mx.gob.ifr.rt.UsuarioUnidadAdministrativa

import grails.transaction.Transactional

@Transactional
class CalificacionService {

    def springSecurityService
    
    def crearTicket(def propietario, def categoria, def valores, def creador , def descripcionDelProblema, def adjunto){
        def resultado=false
        def caso= new Caso()
        def casoCategoria= new CasoCategoriaDelProblema()
        caso.creador=creador
        caso.fechaDeCreacion=new Date()
        caso.estado=EstadoDelCaso.get(1)
        caso.propietarioActual=propietario
        caso.descripcionDelProblema=descripcionDelProblema
        caso.diagnostico=null
        caso.solucion=null
        caso.fechaDeDiagnostico=null
        caso.fechaDeSolucion=null
        caso.fechaDeCierre=null
        caso.responsable=propietario
        caso.tipoDeCaso=TipoDeCaso.get(1)
        
        println "adjunto: " + adjunto.getOriginalFilename()
        
    try{    
        
        if(caso.save(flush:true)){
            casoCategoria.caso=caso
            casoCategoria.categoria=categoria
            bitacoraCaso(caso?.estado?.nombre,caso?.solucion, caso?.diagnostico, caso?.id)
            if(casoCategoria.save(flush:true)){  
                def datosRequeridos=DatosRequeridos.findAllByCategoria(categoria)
                if(datosRequeridos){
                        println "laCategoriaDelProblema seleccioanada : " + categoria + " tiene campos REQUERIDOS: "  + datosRequeridos
                        valores.each{  
                            def valorDelCampo= new ValorDatoRequerido()
                            def split=it?.toString()?.split("=")
                            println "split: " + split + " TamañoDelMapa: "+  split?.size()
                            if(!split[0].equals("0")){
                                valorDelCampo.valor=  split?.size()>1 ? split[1] : ''
                                valorDelCampo.datoRequerido=DatosRequeridos.get(split[0])
                                valorDelCampo.caso=caso  
                                if(valorDelCampo.save(flush:true)){
                                    println "campoValido-save-exitoso: " + split
                                    resultado=true
                                }else{
                                    resultado=false
                                    valorDelCampo.errors.each{
                                        println "errorALGuardarElCasoCategoria-valorDelCampo: " + it
                                    }
                                }   

                            }   
                        }
                }else{
                    println "laCategoriaDelProblema seleccioanada : " + categoria + " --NO-- tiene campos REQUERIDOS: "  + datosRequeridos
                    resultado=true
                }
            }else{
                casoCategoria.errors.each{
                    println "errorALGuardarElCasoCategoria: " + it
                }
            }
            
            if(!adjunto.empty){
                def resultadoAdjunto=adjuntarArchivo(adjunto,caso)
                println "ResultadoAdjunto : " + resultadoAdjunto
            }
                
        }else{ 
            resultado=false
            caso.errors.each{
                println "errorALGuardarElCaso: " + it
            }
        }
       
        }catch(Exception e){ 
            resultado=false
            println "e: " + e 
            println "Error 500: Internal Server Error: " + e.printStackTrace() 
        }    
        
         ['resultado':resultado, 'caso':caso?.id]
    }
    
    
    def crearComentario(def casoId, def comentarioText, def creador, def propietarioActual){
       
        def respuesta=false
        def caso=Caso.get(casoId)
        def comentario= new Comentario()
        
        try{   
            
            comentario.caso=caso
            comentario.textoComentario=comentarioText?.toString()?.toUpperCase()
            comentario.fechaDeComentario=new Date()
            comentario.usuario=creador 
            
            if(comentario.save(flush:true)){
                caso.propietarioActual=propietarioActual
                caso.estado=EstadoDelCaso.get(2)
                    if(caso.save(flush:true)){
                         caso.refresh()
                         bitacoraCaso(caso?.estado?.nombre,caso?.solucion, caso?.diagnostico, caso?.id)
                        respuesta=true
                    }else{
                        caso.errors.each{
                    println "errorGuardarElpropietarioActual : " + it
                    }
                }
                
            }else{
                comentario.errors.each{
                    println "errorGuardarComentario : " + it
                }
            }
        }catch(Exception e){
            respuesta=false
            println "error: " + e
            e.printStackTrace()
        }

        return respuesta
    }
    
    
    def turnarCaso(def caso, def usuario, def comentarioText, def creadorComentario){  
        def respuesta=false
        caso.propietarioActual=usuario
        caso.estado=EstadoDelCaso.get(2)
            if(caso.save(flush:true)){
                 //agregarComentario                     
                    bitacoraCaso("TURNAR",caso?.solucion, caso?.diagnostico, caso?.id) 
                    def comentario= new Comentario()
                    comentario.caso=caso
                    comentario.textoComentario=comentarioText?.toString()?.toUpperCase()
                    comentario.fechaDeComentario=new Date()
                    comentario.usuario=creadorComentario 
                            if(comentario.save(flush:true)){
                                respuesta=true
                            }else{
                                comentario.errors.each{
                                    println "errorGuardarComentario : " + it
                                }
                            }
                }else{
                    caso.errors.each{
                        println "error al turnar caso: " + it
                    }
                }
         return respuesta
    }
    
    def resolverTicket(def solucion, def diagnostico, def caso, def responsable){
        
        boolean respuesta=false
        caso.diagnostico=diagnostico
        caso.fechaDeDiagnostico= new Date()
        caso.solucion=solucion
        caso.fechaDeSolucion= new Date()      
        caso.estado=EstadoDelCaso.get(3)
        caso.responsable=responsable
        caso.propietarioActual=caso?.creador
        
        if(caso.save(flush:true)){
            caso.refresh()
            bitacoraCaso(caso?.estado?.nombre,caso?.solucion, caso?.diagnostico, caso?.id)
            respuesta=true
        }else{
                caso.errors.each{
                       println "error al finalizar caso: " + it
                } 
        }
        return respuesta
    }
    
    
    def cerrarTikcet(def caso){
        boolean respuesta=false
        caso.estado=EstadoDelCaso.get(4)
        caso.fechaDeCierre= new Date() 
        
        if(caso.save(flush:true)){
            caso.refresh()
            bitacoraCaso(caso?.estado?.nombre,caso?.solucion, caso?.diagnostico, caso?.id)
            respuesta=true
        }else{
                caso.errors.each{
                       println "error al finalizar caso: " + it
                } 
        }
        return respuesta
    }
    
    
    
    
    
    
    
    
    /*MEDOTO PRIVADO PARA ADJUNTAR ARCHIVOS*/
    
    private adjuntarArchivo(def archivoAdjunto, def casoId){

        def adjuntoDeCaso= new AdjuntosDeCaso()
        def adjunto=false
        def caso=casoId
        def ruta="/var/uploads/mesaDeAyuda"
        def nombreOriginal=archivoAdjunto.getOriginalFilename()
        def carpeta="adjuntosDelTicket_"+casoId?.id
        File carpetaDeCaso= new File(ruta+"/"+carpeta)
        File archivo=new File(ruta+"/"+carpeta+"/"+nombreOriginal)
        if(carpetaDeCaso.exists()){
                println "ya existe la carpeta"
                if(archivo.exists()){
                    archivoAdjunto.transferTo(new File(ruta+"/"+carpeta+"/"+new Date().format("yyyy_MM_dd_mm_ss")+"_"+nombreOriginal))
                }else{
                    archivoAdjunto.transferTo(new File(ruta+"/"+carpeta+"/"+nombreOriginal))
                }
        }else{
            println "creando la carpeta"
            carpetaDeCaso.mkdir()
               if(archivo.exists()){
                    archivoAdjunto.transferTo(new File(ruta+"/"+carpeta+"/"+new Date().format("yyyy_MM_dd_mm_ss")+"_"+nombreOriginal))
                }else{
                    archivoAdjunto.transferTo(new File(ruta+"/"+carpeta+"/"+nombreOriginal))
                }
        }
        
        adjuntoDeCaso.nombreDelAdjunto=nombreOriginal
        adjuntoDeCaso.rutaDelAdjunto=ruta+"/"+carpeta+"/"+nombreOriginal
        adjuntoDeCaso.fecha= new Date() 
        adjuntoDeCaso.caso=caso
                
        println "caso_"+casoId?.id + " uploadFile... "+ruta+"/"+carpeta+"/"+nombreOriginal
        if(adjuntoDeCaso.save(flush:true)){
            println "success"
            adjunto=true
        }else{
            println "fail"
            adjuntoDeCaso.errors.each{
                println "error de AdjuntoDeCaso : " + it
            }
        }
        return adjunto
    }
    
    
    /*METODO PARA SALVAR LOS DATOS DE BITACORA DE LOS CASOS*/
    
    private bitacoraCaso(def estado, def solucion, def diagnostico, def casoId){
        def bitacora= new BitacoraDeCaso()
        bitacora.casoId =casoId
        bitacora.fecha=new Date()
        bitacora.movimiento =estado
        bitacora.diagnostico =diagnostico
        bitacora.solucion =solucion
        bitacora.usuarioId=springSecurityService.currentUser?.id
        if(bitacora.save(flush:true)){
            println "************ SAVE BITACORA SUCCESS ***********"
        }else{
            bitacora.errors.each{
                println "error de AdjuntoDeCaso : " + it
            }
        }
    }
    
    
    /* METODOS PARA LA PARTE DE CONFIGURACION DE LAS CATEGORIAS DEL PROBLEMA */
    
    def saveDatoSolicitado(def activo, def categoria, def nombre, def tipo, def required){
        def respuesta=false
        def datos= new DatosRequeridos()
        datos.activo=activo
        datos.categoria=categoria
        datos.nombreCampo=nombre
        datos.obligatorio=required
        datos.tipoDeDato=tipo
        
            if(datos.save(flush:true)){
                respuesta=true
            }else{
                datos.errors.each{
                    println " error al guardar Datos Reuqridos : " + it
                }
            }
        return respuesta
    }  
    
    def updateDatoSolicitado(def activo, def campo, def nombre, def tipo, def required, def categoria){
        def respuesta=false
        campo.activo=activo
        campo.categoria=categoria
        campo.nombreCampo=nombre
        campo.obligatorio=required
        campo.tipoDeDato=tipo
        
            if(campo.save(flush:true)){
                respuesta=true
            }else{
                campo.errors.each{
                    println " error al guardar Datos Reuqridos : " + it
                }
            }
        return respuesta
    }
    
    
    def cambiaDeUnidadUsuario(def area, def usuario){
        def respuesta=false
        def usuarioUnidad=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        usuarioUnidad=area
            if(usuarioUnidad.save(flush:true)){
                respuesta=true
            }else{
                usuarioUnidad.errors.each{
                    println "error de actualizacion de unidad: " + it
                }
            }
        return respuesta
    }
}
