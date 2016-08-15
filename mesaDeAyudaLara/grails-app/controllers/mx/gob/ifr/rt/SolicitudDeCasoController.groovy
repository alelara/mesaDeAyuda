package mx.gob.ifr.rt

import mx.gob.ifr.seguridad.SecUsuarioSecRole

class SolicitudDeCasoController {
 static final org.apache.log4j.Logger myLog = org.apache.log4j.Logger.getLogger(SolicitudDeCasoController)
    def springSecurityService
    def calificacionService
    def index() { }
    
    
    def bandejaDeCasos={ 
        myLog.info "init() .... bandeja" 
        if (params.paginate.equals("SI")) {
           def offsetPaginacion = [max: (params.max as int), offset: (params.offset as int)]
            session.offsetPaginacion = offsetPaginacion
        } else {   
            session.offsetPaginacion?.offset = null
        }
        def usuario=Usuario.get( springSecurityService.currentUser?.id) 
        def unidad=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        myLog.info "Bandeja de " +unidad?.unidad + " - " + unidad  + " usuario: " + usuario
        def usuarios=UsuarioUnidadAdministrativa.findAllByUnidad(unidad?.unidad)     
        //def casos=Caso.executeQuery("from Caso c where c.propietarioActual in(:usu)", [usu:usuarios?.usuario])
        def casos=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema cc where cc.caso.propietarioActual in(:users) and cc.caso.estado!=:resuelto order by cc.categoria.prioridad, cc.caso.fechaDeCreacion asc ", [users:usuarios?.usuario, resuelto: EstadoDelCaso.get(4), max: (session.offsetPaginacion?.max ?: 10), offset: (session.offsetPaginacion?.offset ?: 0)])
               def casoInstanceCount=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema cc where cc.caso.propietarioActual in(:users) and cc.caso.estado!=:resuelto order by cc.categoria.prioridad, cc.caso.fechaDeCreacion asc ", [users:usuarios?.usuario, resuelto: EstadoDelCaso.get(4)]) //def casos=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema cc where cc.categoria.unidadAdministrativaResponsable=:unidadResponsable and cc.caso.estado!=:resuelto order by cc.categoria.prioridad, cc.caso.fechaDeCreacion asc ", [unidadResponsable:unidad?.unidad, resuelto: EstadoDelCaso.get(3)])
        myLog.info "casos: " + casos
        myLog.info "casosSize:  " + casos?.size()
        [casos:casos, usuario:unidad, success:params.success, error:params.error, turnarCaso:params.turnarCaso, casoInstanceCount:casoInstanceCount?.size(), botelaExitosa:params.botelaExitosa]
    }
    
    def altaDeTicket={
        def areas=UnidadAdministrativa.list()
        def usuario=Usuario.get( springSecurityService.currentUser?.id)//Usuario.get(springSecurityService.principal.id)
        myLog.info "user: " + usuario + " id: " + usuario?.id
        def unidad=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        
        myLog.info "unidad" + unidad
        [areas:areas, usuario:unidad, error:params.error, success:params.success]
    }
    
    def categoriasDeArea={
        myLog.info "params - categoriasDeArea : " + params
        def categorias=null
        if(!params.id.equals("null")){
            def unidad=UnidadAdministrativa.get(params.id)
            categorias=CategoriaDelProblema.findAllByUnidadAdministrativaResponsableAndActivo(unidad, true, [sort:'nombre', order:'asc'])
        }
        myLog.info "render: " + categorias
        render( template:'categoriasDeArea', model:[categorias:categorias])
    }
    
    def buscarReposotorioAyuda={
        myLog.info "params-buscarReposotorioAyuda: "+params
        def categoriaDelProblema=null
        def wiki=null
        def wikipedia=""
        if(params.categoriaId){
            categoriaDelProblema=CategoriaDelProblema.get(params.categoriaId)
            wiki=WikiCategoriaDelProbema.findByCategoria(categoriaDelProblema)
            wikipedia=wiki?.texto?.toString()
            if(wiki)
                wikipedia=wikipedia.replaceAll("\"", "'")
            myLog.info "wiki: " + wikipedia
        }
        
        render( template:'repositorioAyuda', model:[categoriaDelProblema:categoriaDelProblema,wiki:wikipedia])
    }
    
    def crearTicket={
        myLog.info " params- crearTicket: " + params
        def categoria=CategoriaDelProblema.get(params.idCategoria)
        def datosRequeridos=DatosRequeridos.findAllByCategoria(categoria)
        myLog.info "datosRequeridos: " + datosRequeridos  
        def usuario=Usuario.get( springSecurityService.currentUser?.id)//Usuario.get(springSecurityService.principal.id)
        myLog.info "user: " + usuario + " id: " + usuario?.id
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        def impresoras=TopicoDeImpresoras.list([sort:'marca', order:'asc'])
        render (template:"crearTicket", model:[datosRequeridos:datosRequeridos, categoria:categoria, unidadDeUsuario:unidadDeUsuario, impresoras:impresoras ])
    }
    
    def saveTicket={
        myLog.info "params-saveTicket: " + params     
        def file = request.getFile('file')
        if(file.empty){
            myLog.info "sin Archivo"
        }else{
            myLog.info "con adjunto =)"
        }
        def categoria=CategoriaDelProblema.get(params.idCategoria)            
        def usuarioDelAreaResponsable=UsuarioUnidadAdministrativa.executeQuery("from UsuarioUnidadAdministrativa u where u.unidad=:unidad order by rand()", [unidad:categoria?.unidadAdministrativaResponsable, max: 1])//UsuarioUnidadAdministrativa.findByUnidad(categoria?.unidadAdministrativaResponsable)
        myLog.info "usuarioResponsable: " + usuarioDelAreaResponsable[0] + " id: " + usuarioDelAreaResponsable[0]?.usuario?.id
        def creador=Usuario.get( springSecurityService.currentUser?.id)
        def resultado=calificacionService.crearTicket(usuarioDelAreaResponsable[0]?.usuario, categoria, params.valores,creador, params.descripcionDelProblema, file)
        myLog.info "resultado: " + resultado
        if(resultado?.resultado){
            myLog.info "redirect...bandejaDeCasos : success"
            def caso=Caso.get(resultado?.caso)
             def conf=ConfiguracionDeMesaDeAyuda.get(1)
             def url=conf?.urlServidor+"solicitudDeCaso/verCasoUnidad?idCaso="+resultado?.caso
             def casoCategoria=CasoCategoriaDelProblema.findByCaso(caso)
             myLog.info "correoCreador: " +  caso?.creador?.email + "  ---correoDeAtencionResponsable: " + caso?.responsable?.email + " ---correoUnidad: " + UsuarioUnidadAdministrativa.findByUsuario(caso?.creador)?.unidad?.correoElectronico
             enviarCorreo(casoCategoria, 'CREACION DE TICKET', new Date(), url, caso?.creador?.email,caso?.responsable?.email, UsuarioUnidadAdministrativa.findByUsuario(caso?.creador)?.unidad?.correoElectronico )
            redirect(action:'bandejaDeCasos', params:['success': 'TICKET CON NUMERO ' + resultado?.caso])
        }else{
            myLog.info "redirect...bandejaDeCasos : fail"
            redirect(action:'bandejaDeCasos', params:['error': 'Error, ha ocurrido un problema al intentar crear el ticket; Intentelo de nuevo.'])
        }
        
    }
    
    
    
    def verCaso={
        myLog.info "params-verCaso: " + params   
        def caso=Caso.get(params.idCaso)
        def existeCaso=null
        if(caso){
        existeCaso=caso    
        def valoresDeLosCampos=[]
        def areas=UnidadAdministrativa.list()
        def categoriaDelCaso=CasoCategoriaDelProblema.findByCaso(caso)
        def usuario=Usuario.get( springSecurityService.currentUser?.id) 
        def unidad=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        def valoresDatosRequeridos=DatosRequeridos.findAllByCategoria(categoriaDelCaso?.categoria)
        def adjuntos=AdjuntosDeCaso.findAllByCaso(caso)
        def comentarios=Comentario.findAllByCaso(caso)
        def encuesta=Encuesta.findByCaso(caso)
        def encuestaContestada=ValorDePregunta.findAllByCaso(caso)
        def observaciones=ObservacionesDeEncuesta.findByCaso(caso)
//        encuestaContestada.each{
//            myLog.info " encuesta: " + it?.pregunta?.encuesta + " pregunta: " + it?.pregunta + " valor: " + it?.valor
//        }   
        def areaCaso=CasoCategoriaDelProblema.findByCaso(caso)
        def encuestaDelArea=EncuestaDelArea.findByUnidad(areaCaso?.categoria?.unidadAdministrativaResponsable)
        def rubros=RubrosDeEncuesta.findAllByEncuesta(encuestaDelArea)    
        myLog.info "categoriaDelCaso: " + categoriaDelCaso
        myLog.info "valoresDeDatosRequeridos: " + valoresDatosRequeridos
        valoresDatosRequeridos.each{
            def mapa=["campo":null, "valor":null]
            def datoValor=ValorDatoRequerido.findByDatoRequeridoAndCaso(it, caso)            
            mapa.campo=datoValor?.datoRequerido
            mapa.valor=datoValor?.valor
            valoresDeLosCampos.add(mapa)
            myLog.info "datoValor: " + datoValor?.valor + " cat: " +datoValor?.datoRequerido + " case: " +datoValor?.caso
        }        
        render(view:'detalleCaso', model:[existeCaso:existeCaso, areas:areas, usuario:unidad, ticket:categoriaDelCaso, valoresDatosRequeridos:valoresDeLosCampos, respuesta:params.respuesta,comentarios:comentarios, resuelto:params.resuelto, adjunto:params.adjunto, adjuntos:adjuntos, visible:true, success:params.success, fail:params.fail, encuesta:encuesta, rubros:rubros,encuestaContestada:encuestaContestada, observaciones:observaciones ])
        }else{
            render(view:'detalleCaso', model:[existeCaso:existeCaso])
        }
        
        }   
        
    
        def verCasoUnidad={
            myLog.info "params-verCaso: " + params   
            def caso=Caso.get(params.idCaso)
            def existeCaso=null
            boolean visible=false
            boolean consulta=false
            if(caso){
                existeCaso=caso    
                def valoresDeLosCampos=[]
                def areas=UnidadAdministrativa.list()
                def categoriaDelCaso=CasoCategoriaDelProblema.findByCaso(caso)
                def usuario=Usuario.get( springSecurityService.currentUser?.id) 
                def unidad=UsuarioUnidadAdministrativa.findByUsuario(usuario)
                def unidadCreadoraDelCaso=UsuarioUnidadAdministrativa.findByUsuario(caso?.creador)
                def roles=SecUsuarioSecRole.findAllBySecUsuario(usuario)
                roles.each{
                    myLog.info "roles_ " + it?.secRole
                    if(it?.secRole?.toString()?.equals("ROLE_CONSULTA")){
                        consulta=true
                    }
                }
                        myLog.info "unudadCreadora: " + unidadCreadoraDelCaso?.unidad + " unidadSolicitante: "+unidad?.unidad + " --- consulta: " + consulta
                        if(unidadCreadoraDelCaso?.unidad==unidad?.unidad || consulta==true){
                                myLog.info "son del mismo area, puede ver el caso" 
                                visible=true    
                                def valoresDatosRequeridos=DatosRequeridos.findAllByCategoria(categoriaDelCaso?.categoria)
                                def adjuntos=AdjuntosDeCaso.findAllByCaso(caso)
                                def comentarios=Comentario.findAllByCaso(caso)
                                myLog.info "categoriaDelCaso: " + categoriaDelCaso
                                myLog.info "valoresDeDatosRequeridos: " + valoresDatosRequeridos
                                def encuesta=Encuesta.findByCaso(caso)
                                def encuestaContestada=ValorDePregunta.findAllByCaso(caso)
                                def observaciones=ObservacionesDeEncuesta.findByCaso(caso)
                                //        encuestaContestada.each{
                                //            myLog.info " encuesta: " + it?.pregunta?.encuesta + " pregunta: " + it?.pregunta + " valor: " + it?.valor
                                //        }   
                                def areaCaso=CasoCategoriaDelProblema.findByCaso(caso)
                                def encuestaDelArea=EncuestaDelArea.findByUnidad(areaCaso?.categoria?.unidadAdministrativaResponsable)
                                def rubros=RubrosDeEncuesta.findAllByEncuesta(encuestaDelArea)    
                                myLog.info "categoriaDelCaso: " + categoriaDelCaso
                                myLog.info "valoresDeDatosRequeridos: " + valoresDatosRequeridos
                
                
                                valoresDatosRequeridos.each{
                                    def mapa=["campo":null, "valor":null]
                                    def datoValor=ValorDatoRequerido.findByDatoRequeridoAndCaso(it, caso)            
                                    mapa.campo=datoValor?.datoRequerido
                                    mapa.valor=datoValor?.valor
                                    valoresDeLosCampos.add(mapa)
                                    myLog.info "datoValor: " + datoValor?.valor + " cat: " +datoValor?.datoRequerido + " case: " +datoValor?.caso
                                }        
                            render(view:'detalleCaso', model:[existeCaso:existeCaso, areas:areas, usuario:unidad, ticket:categoriaDelCaso, valoresDatosRequeridos:valoresDeLosCampos, respuesta:params.respuesta,comentarios:comentarios, resuelto:params.resuelto, adjunto:params.adjunto, adjuntos:adjuntos, visible:visible, encuesta:encuesta, rubros:rubros,encuestaContestada:encuestaContestada, observaciones:observaciones ])

                        }else{
                            myLog.info "no son de la misma area, no puede ver el caso"
                            render(view:'detalleCaso', model:[existeCaso:existeCaso, visible:visible])
                        }


                        }else{
                            render(view:'detalleCaso', model:[existeCaso:existeCaso])
                    }
            
        }
    
    
    def saveComentario={
         myLog.info "params-saveComentario: " + params
         def creador=Usuario.get( springSecurityService.currentUser?.id)
         def propietarioActual=Usuario.get(params.usuario)
         def resultado=calificacionService.crearComentario(params.casoId, params.comentario,creador, propietarioActual)   
         def caso=Caso.get(params.casoId)
         if(resultado){    
             def conf=ConfiguracionDeMesaDeAyuda.get(1)
             def url=conf?.urlServidor+"solicitudDeCaso/verCasoUnidad?idCaso="+params.casoId
             def casoCategoria=CasoCategoriaDelProblema.findByCaso(caso)
             myLog.info "correoCreador: " +  caso?.creador?.email + "  ---correoDeAtencionResponsable: " + caso?.responsable?.email + " ---correoUnidad: " + UsuarioUnidadAdministrativa.findByUsuario(caso?.creador)?.unidad?.correoElectronico
             enviarCorreo(casoCategoria, 'SE AGREGO UN COMENTARIO AL TICKET', new Date(), url, caso?.creador?.email,caso?.responsable?.email, UsuarioUnidadAdministrativa.findByUsuario(caso?.creador)?.unidad?.correoElectronico )
         }
         redirect(action:'verCaso', params:['respuesta':resultado, 'idCaso':params.casoId])
    }
    
    
    def turnarCaso={
        myLog.info "params-turnarCaso: " + params 
        def creador=Usuario.get( springSecurityService.currentUser?.id)
        def unidad=UnidadAdministrativa.get(params.areaId)
        def caso=Caso.get(params.casoId)
        def usuarioDelAreaResponsable=UsuarioUnidadAdministrativa.executeQuery("from UsuarioUnidadAdministrativa u where u.unidad=:unidad order by rand()", [unidad:unidad, max: 1])//UsuarioUnidadAdministrativa.findByUnidad(categoria?.unidadAdministrativaResponsable)
        myLog.info "Turnar caso: "+caso +"(id="+caso?.id +") usuarioResponsable: " + usuarioDelAreaResponsable + " user: "+usuarioDelAreaResponsable?.usuario
        //cambiar de propietario y estado del ticket a seguimiento
                def resultado=calificacionService.turnarCaso(caso,usuarioDelAreaResponsable[0]?.usuario, params.comentario, creador)
        myLog.info "respuesta-turnarCaso: " + resultado        
        redirect(action:'bandejaDeCasos', params:['turnarCaso':(resultado==true ? 'El ticket número '+caso?.id+' se asigno correctamente a la Unidad de '+unidad : 'Ocurrio un error, no se pudo reasignar el ticket número '+caso?.id+', intentelo mas tarde.')])
    }
    
    
    def resolverTicket={
        myLog.info "params-resolverTicket: " + params
        def caso=Caso.get(params.casoId)
        def creador=Usuario.get( springSecurityService.currentUser?.id)
        def resultado=calificacionService.resolverTicket(params.solucion, params.diagnostico, caso, creador)
        if(resultado){
            def conf=ConfiguracionDeMesaDeAyuda.get(1)
            def url=conf?.urlServidor+"solicitudDeCaso/verCasoUnidad?idCaso="+params.casoId
            def casoCategoria=CasoCategoriaDelProblema.findByCaso(caso)
            myLog.info "correoCreador: " +  caso?.creador?.email + "  ---correoDeAtencionResponsable: " + caso?.responsable?.email + " ---correoUnidad: " + UsuarioUnidadAdministrativa.findByUsuario(caso?.creador)?.unidad?.correoElectronico
            enviarCorreo(casoCategoria, 'TICKET ATENDIDO', new Date(), url,  caso?.creador?.email,caso?.responsable?.email,UsuarioUnidadAdministrativa.findByUsuario(caso?.creador)?.unidad?.correoElectronico )
        }
        redirect(action:'verCaso', params:['resuelto':resultado, 'idCaso':params.casoId])
    }
    
    def cerrarTicket={
        myLog.info "params-cerrarTicket: " + params
        def caso=Caso.get(params.casoId)
        def resultado=calificacionService.cerrarTikcet(caso)
        if(resultado){
            def conf=ConfiguracionDeMesaDeAyuda.get(1)
            def url=conf?.urlServidor+"solicitudDeCaso/verCasoUnidad?idCaso="+params.casoId
            def casoCategoria=CasoCategoriaDelProblema.findByCaso(Caso.get(params.casoId))
            myLog.info "correoCreador: " +  caso?.creador?.email + "  ---correoDeAtencionResponsable: " + caso?.responsable?.email + " ---correoUnidad: " + UsuarioUnidadAdministrativa.findByUsuario(caso?.creador)?.unidad?.correoElectronico
            enviarCorreo(casoCategoria, 'TICKET CERRADO', new Date(), url,  caso?.creador?.email,caso?.responsable?.email,UsuarioUnidadAdministrativa.findByUsuario(caso?.creador)?.unidad?.correoElectronico )
        }
        //redirect(action:'verCaso', params:['cerrado':resultado, 'idCaso':params.casoId]) //encuesta //altaEncuesta?caso=69
        redirect(controller:'encuesta', action:'altaEncuesta', params:['cerrado':resultado, 'idCaso':params.casoId, 'caso':params.casoId])
        
    }
    
    def adjuntarArchivo={
        myLog.info "params-adjuntarArchivo: " + params
        def adjuntoDeCaso= new AdjuntosDeCaso()
        def adjunto=false
        def caso=Caso.get(params.casoId)
        def file = request.getFile('file')
        def ruta="/var/uploads/mesaDeAyuda"
        def nombreOriginal=file.getOriginalFilename()
        def carpeta="adjuntosDelTicket_"+params.casoId
        File carpetaDeCaso= new File(ruta+"/"+carpeta)
        File archivo=new File(ruta+"/"+carpeta+"/"+nombreOriginal)
        if(carpetaDeCaso.exists()){
                myLog.info "ya existe la carpeta"
                if(archivo.exists()){
                    file.transferTo(new File(ruta+"/"+carpeta+"/"+new Date().format("yyyy_MM_dd_mm_ss")+"_"+nombreOriginal))
                }else{
                file.transferTo(new File(ruta+"/"+carpeta+"/"+nombreOriginal))
                }
        }else{
            myLog.info "creando la carpeta"
            carpetaDeCaso.mkdir()
               if(archivo.exists()){
                    file.transferTo(new File(ruta+"/"+carpeta+"/"+new Date().format("yyyy_MM_dd_mm_ss")+"_"+nombreOriginal))
                }else{
                file.transferTo(new File(ruta+"/"+carpeta+"/"+nombreOriginal))
                }
        }
        
        adjuntoDeCaso.nombreDelAdjunto=nombreOriginal
        adjuntoDeCaso.rutaDelAdjunto=ruta+"/"+carpeta+"/"+nombreOriginal
        adjuntoDeCaso.fecha= new Date() 
        adjuntoDeCaso.caso=caso
                
        myLog.info "caso_"+params.casoId + " uploadFile... "+ruta+"/"+carpeta+"/"+nombreOriginal
        if(adjuntoDeCaso.save(flush:true)){
            myLog.info "success"            
            adjunto=true
   
                def conf=ConfiguracionDeMesaDeAyuda.get(1)
                def url=conf?.urlServidor+"solicitudDeCaso/verCasoUnidad?idCaso="+params.casoId
                def casoCategoria=CasoCategoriaDelProblema.findByCaso(Caso.get(params.casoId))
                enviarCorreo(casoCategoria, 'ARCHIVO ADJUNTADO', new Date(), url, caso?.creador?.email,caso?.responsable?.email, UsuarioUnidadAdministrativa.findByUsuario(caso?.creador)?.unidad?.correoElectronico )

        
        }else{
            myLog.info "fail"
        }
        redirect(action:'verCaso', params:['adjunto':adjunto, 'idCaso':params.casoId])
    }
    
    def descargarAdjunto={
        myLog.info "params-descargarAdjunto: " + params
        File adjunto=new File(params.ruta)
        if(adjunto.exists()){
            myLog.info "success adjunto"
            def img = adjunto.bytes
            response.setHeader("Content-disposition", "attachment; filename="+ params.nombre);
            response.outputStream << img
            response.outputStream.flush()
        }else{
            myLog.info "fail adjunto"
        }
    }
 
    /* bandeja de turnos conlcuidos */
    
    def bandejaCasosConcluidos={
        myLog.info "init() .... bandejaCasosConcluidos"  
        if (params.paginate.equals("SI")) {
           def offsetPaginacion = [max: (params.max as int), offset: (params.offset as int)]
            session.offsetPaginacion = offsetPaginacion
        } else {   
            session.offsetPaginacion?.offset = null
        }
           
        def usuario=Usuario.get( springSecurityService.currentUser?.id) 
        def unidad=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        def usuarios=UsuarioUnidadAdministrativa.findAllByUnidad(unidad?.unidad)             
        def casos=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema cc where cc.caso.creador in(:users) and cc.caso.estado=:resuelto order by cc.categoria.prioridad, cc.caso.fechaDeCreacion asc ", [users:usuarios?.usuario, resuelto: EstadoDelCaso.get(4), max: (session.offsetPaginacion?.max ?: 10), offset: (session.offsetPaginacion?.offset ?: 0)])
        def count=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema cc where cc.caso.creador in(:users) and cc.caso.estado=:resuelto order by cc.categoria.prioridad, cc.caso.fechaDeCreacion asc ", [users:usuarios?.usuario, resuelto: EstadoDelCaso.get(4)])
        myLog.info "casosResueltos: " + casos
        myLog.info "casosSize:  " + casos?.size()
        [casos:casos, usuario:unidad, success:params.success, error:params.error, turnarCaso:params.turnarCaso, casoInstanceCount:count?.size()]
    }  
    
    /* bandeja de turnos resueltos */
    
    def bandejaCasosAtendidos={
        myLog.info "init() .... bandejaCasosConcluidos"  
        if (params.paginate.equals("SI")) {
           def offsetPaginacion = [max: (params.max as int), offset: (params.offset as int)]
            session.offsetPaginacion = offsetPaginacion
        } else {   
            session.offsetPaginacion?.offset = null
        }
           
        def usuario=Usuario.get( springSecurityService.currentUser?.id) 
        def unidad=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        def usuarios=UsuarioUnidadAdministrativa.findAllByUnidad(unidad?.unidad)    
        def casos=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema cc where cc.caso.responsable in(:users) and (cc.caso.estado=:resuelto or cc.caso.estado=:atendido) order by  cc.caso.fechaDeCreacion desc ", [users:usuarios?.usuario, resuelto: EstadoDelCaso.get(4), atendido:EstadoDelCaso.get(3),  max: (session.offsetPaginacion?.max ?: 10), offset: (session.offsetPaginacion?.offset ?: 0)])
        def count=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema cc where cc.caso.responsable in(:users) and (cc.caso.estado=:resuelto or  cc.caso.estado=:atendido) order by cc.caso.fechaDeCreacion desc ", [users:usuarios?.usuario, resuelto: EstadoDelCaso.get(4), atendido: EstadoDelCaso.get(3)]) //def casos=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema cc where cc.categoria.unidadAdministrativaResponsable=:unidadResponsable and cc.caso.estado!=:resuelto order by cc.categoria.prioridad, cc.caso.fechaDeCreacion asc ", [unidadResponsable:unidad?.unidad, resuelto: EstadoDelCaso.get(3)])
        myLog.info "casosSize:  " + casos?.size()
        [casos:casos, usuario:unidad, success:params.success, error:params.error, turnarCaso:params.turnarCaso, casoInstanceCount:count?.size()]
    }
    
    
    /* bandeja de turnos en Proceso */
    
    def bandejaCasosProceso={
        myLog.info "init() .... bandejaCasosConcluidos"  
        if (params.paginate.equals("SI")) {
           def offsetPaginacion = [max: (params.max as int), offset: (params.offset as int)]
            session.offsetPaginacion = offsetPaginacion
        } else {   
            session.offsetPaginacion?.offset = null
        }
           
        def usuario=Usuario.get( springSecurityService.currentUser?.id) 
        def unidad=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        def usuarios=UsuarioUnidadAdministrativa.findAllByUnidad(unidad?.unidad)    
        def casos=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema cc where cc.caso.creador in(:users) and (cc.caso.estado=:nuevo or cc.caso.estado=:segui) order by  cc.caso.fechaDeCreacion desc ", [users:usuarios?.usuario, segui: EstadoDelCaso.get(2), nuevo:EstadoDelCaso.get(1),  max: (session.offsetPaginacion?.max ?: 10), offset: (session.offsetPaginacion?.offset ?: 0)])
        def count=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema cc where cc.caso.creador in(:users) and (cc.caso.estado=:nuevo or  cc.caso.estado=:segui) order by cc.caso.fechaDeCreacion desc ", [users:usuarios?.usuario, segui: EstadoDelCaso.get(2), nuevo: EstadoDelCaso.get(1)]) //def casos=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema cc where cc.categoria.unidadAdministrativaResponsable=:unidadResponsable and cc.caso.estado!=:resuelto order by cc.categoria.prioridad, cc.caso.fechaDeCreacion asc ", [unidadResponsable:unidad?.unidad, resuelto: EstadoDelCaso.get(3)])
        myLog.info "casosSize:  " + casos?.size()
        [casos:casos, usuario:unidad, success:params.success, error:params.error, turnarCaso:params.turnarCaso, casoInstanceCount:count?.size()]
    }
    
    
    def contarCasos={  
        def usuario=Usuario.get( springSecurityService.currentUser?.id) 
        def unidad=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        def usuarios=UsuarioUnidadAdministrativa.findAllByUnidad(unidad?.unidad)
        if(usuarios){
            def casoInstanceCount=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema cc where cc.caso.propietarioActual in(:users) and cc.caso.estado!=:resuelto order by cc.categoria.prioridad, cc.caso.fechaDeCreacion asc ", [users:usuarios?.usuario, resuelto: EstadoDelCaso.get(4)])         
            render casoInstanceCount?.size()
        }else{
            render "0"
        }
    }
    
    
    
    def contarCasosPrioridad={
        def usuario=Usuario.get( springSecurityService.currentUser?.id) 
        def unidad=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        def usuarios=UsuarioUnidadAdministrativa.findAllByUnidad(unidad?.unidad)             
        def casoInstanceCount=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema cc where cc.caso.propietarioActual in(:users) and cc.caso.estado!=:resuelto and cc.categoria.prioridad=:prioridad order by cc.categoria.prioridad, cc.caso.fechaDeCreacion asc ", [users:usuarios?.usuario, resuelto: EstadoDelCaso.get(4), prioridad:PrioridadDelProblema.get(params.id)]) 
        render casoInstanceCount?.size()
    }

    def casosRecientes={    
        def usuario=Usuario.get( springSecurityService.currentUser?.id) 
        def unidad=UsuarioUnidadAdministrativa.findByUsuario(usuario)        
        def usuarios=UsuarioUnidadAdministrativa.findAllByUnidad(unidad?.unidad)     
        def casoInstanceCount=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema cc where cc.caso.propietarioActual in(:users) and cc.caso.estado!=:resuelto order by cc.caso.fechaDeCreacion desc ", [users:usuarios?.usuario, resuelto: EstadoDelCaso.get(4), max:10])
        //myLog.info "casosRecientes: " + casoInstanceCount?.size()
        [casosRecientes:casoInstanceCount]
    }
    
    def nombreUsuario={
        def usuario=Usuario.get( springSecurityService.currentUser?.id) 
        myLog.info "usuario: " + usuario
        render usuario
    }
    
    def nombreAreaUsuario={
        def usuario=Usuario.get( springSecurityService.currentUser?.id) 
        def unidad=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        render unidad?.unidad
    }
    
    def listaDeUsuarios={
         def areas=UnidadAdministrativa.list([sort:'nombre', order:'asc'])
        [areas:areas]
    }
    
    def casosRecientesAtendidos={
        def usuario=Usuario.get( springSecurityService.currentUser?.id) 
        def unidad=UsuarioUnidadAdministrativa.findByUsuario(usuario)        
        def usuarios=UsuarioUnidadAdministrativa.findAllByUnidad(unidad?.unidad)     
        def casoInstanceCount=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema cc where cc.caso.propietarioActual in(:users) and cc.caso.estado=:resuelto order by cc.caso.fechaDeCreacion desc ", [users:usuarios?.usuario, resuelto: EstadoDelCaso.get(3), max:10])
        myLog.info "casosRecientesAtendidos: " + casoInstanceCount?.size()
        render(view:'casosRecientes', model:[casosRecientes:casoInstanceCount])
    }
    
            /* METODO PARA CAMBIAR CONTRASEÑA */
    def utilidades={
        def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario) 
        [usuario:usuario,unidadDeUsuario:unidadDeUsuario]
    }
    

    def cambiarPassword={
        myLog.info "params-cambiarPassword: " + params
        def user=Usuario.get(params.idUser)
        if(params.passwdNueva?.equals(params.passwdNuevaConf))
        {
          user.password=params.passwdNueva
                if(user.save(flush:true)){
                        render "Contraseña actualizada correctamente..."
                }else{
                    render "Error, no se pudo actualizar la contraseña; Intentelo mas tarde..."
                }
            
        }else{
                    render "Error, las contraseñas no conciden..."
        }       

    }
    
    
        /* METODOS PRIVADOS PARA EL ENVIO DEL CORREO */
    
        private enviarCorreo(def caso,def movimiento, def fecha, def url, def correoDeCreadorTicket, def correoDeAtencionTicket, def correoDeAreaDelCreadorTicket){
            // correoDeCreadorTicket
            // correoDeAtencionTicket
            // correoDeAreaDelCreadorTicket
            myLog.info "initEnvioCorreo()..." + caso?.caso?.id + " --- " + movimiento + " --- " + url +"---" + correoDeCreadorTicket + " -- " + correoDeAtencionTicket + " -- " + correoDeAreaDelCreadorTicket
                sendMail {
                    async true
                    to correoDeCreadorTicket , correoDeAtencionTicket , correoDeAreaDelCreadorTicket
                    subject "Mesa de Ayuda IFREM - TICKET "+ caso?.caso?.id +" - " + movimiento + " -" 
                    html g.render(template:"boletaDeMovimientos", model:[caso:caso,movimiento:movimiento, fecha:fecha, url:url])
                }
            myLog.info "finEnvioCorreo()..."
        }
 
    
}
