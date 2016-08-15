package mx.gob.ifr.rt
 
import mx.gob.ifr.seguridad.SecRole
import mx.gob.ifr.seguridad.SecUsuarioSecRole

class ConfiguracionController {
    static final org.apache.log4j.Logger myLog = org.apache.log4j.Logger.getLogger(ConfiguracionController)
    def springSecurityService
    def calificacionService
    
    def index() { 
        def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        def categorias=CategoriaDelProblema.findAllByUnidadAdministrativaResponsable(unidadDeUsuario?.unidad, [sort:'nombre', order:'asc'])
        [categorias:categorias, unidadDeUsuario:unidadDeUsuario, success:params.success, fail:params.fail]    
    }
    
    def altaDeCampo={
        myLog.info " params-altaDeCampo: " + params
        def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        def categoria=CategoriaDelProblema.get(params.idCategoria)
        [categoria:categoria,unidadDeUsuario:unidadDeUsuario, fail:params.errorSaveDatos]
    }
    
    def saveDatoSolicitado={
        myLog.info "params-saveDatoSolicitado: " + params
        def respuesta=calificacionService.saveDatoSolicitado( (params.activo ? true : false), CategoriaDelProblema.get(params.idCategoria), params.nombre?.toUpperCase(), params.tipo , (params.required ? true : false) )
        
        if(respuesta){
            redirect(action:'index', params:['success':'El campo se agrego correctamente a la categoria del problema: ' + CategoriaDelProblema.get(params.idCategoria) ])
        }else{
            redirect(action:'altaDeCampo', params:['idCategoria':params.idCategoria, 'errorSaveDatos':'Ocurrio un error al querer agregar el campo a la siguiente categoria del problema: ' + CategoriaDelProblema.get(params.idCategoria)+'; Intentelo de nuevo...' ])
        }
    }
    
    def editarCampo={        
        myLog.info "params-editarCampo: " + params  
        def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        def campo=DatosRequeridos.get(params.idDato)
        def categorias=CategoriaDelProblema.findAllByUnidadAdministrativaResponsable(unidadDeUsuario?.unidad)
        [campo:campo, unidadDeUsuario:unidadDeUsuario, categorias:categorias, fail:params.errorUpdateDatos]
    }
    
    def updateDatoSolicitado={
        myLog.info "params-updateDatoSolicitado: " + params        
        def respuesta=calificacionService.updateDatoSolicitado( (params.activo ? true : false), DatosRequeridos.get(params.idDato) , params.nombre?.toUpperCase(), params.tipo , (params.required ? true : false), CategoriaDelProblema.get(params.categoriaId) )
        
        if(respuesta){
            redirect(action:'index', params:['saveDatos':'El campo ---'+DatosRequeridos.get(params.idDato) +'--- se actualizo correctamente correspondiente a la categoria del problema: ' + CategoriaDelProblema.get(params.categoriaId) ])
        }else{
            redirect(action:'editarCampo', params:['idDato':params.idDato, 'errorUpdateDatos':'Ocurrio un error al actualizar el campo ---'+ DatosRequeridos.get(params.idDato)+'--- de la siguiente categoria del problema: ' + CategoriaDelProblema.get(params.idCategoria)+'; Intentelo de nuevo...' ])
        }
    }
    
    def altaDeCategoria={
                def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        def priporidad=PrioridadDelProblema.list()
        [unidadDeUsuario:unidadDeUsuario, priporidad:priporidad, success:params.success, fail:params.fail]
    }
    
    def crearCategoria={
        myLog.info "params-crearCategoria: " +params
        def success=null
        def fail=null
        def nuevaCategoria= new CategoriaDelProblema()
        nuevaCategoria.activo=(params.activo ? true : false)
        nuevaCategoria.descripcion=params.descripcion?.toUpperCase()
        nuevaCategoria.nombre=params.nombre?.toUpperCase()
        nuevaCategoria.prioridad=PrioridadDelProblema.get(params.prioridad)
        nuevaCategoria.unidadAdministrativaResponsable=UnidadAdministrativa.get(params.idUnidad)
        
        if(nuevaCategoria.save(flush:true)){
            success="Se creo correctamente la categoria: " + params.nombre?.toUpperCase()
        }else{
            nuevaCategoria.errors.each{
                fail="Ocurrio un error; Intentelo de nuevo ..."
                myLog.info "ocurrio un error - nuevaCategoria: " +it 
            }
        }
        redirect(action:'index', params:['success':success, 'fail':fail])
    }
    
    def updateCategoria={
        myLog.info "params-updateCategoria: " + params   
        def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        def categoria=CategoriaDelProblema.get(params.idCategoria)
        [categoria:categoria,unidadDeUsuario:unidadDeUsuario ]
    }
    
    def actualizarCategoria={
        myLog.info "params-actualizarCategoria: " + params 
        def success=null
        def fail=null
        def categoria=CategoriaDelProblema.get(params.idCategoria)
        categoria.activo=(params.activo ? true : false)
        categoria.descripcion=params.descripcion?.toUpperCase()
        categoria.nombre=params.nombre?.toUpperCase()
        categoria.prioridad=PrioridadDelProblema.get(params.prioridad)   
        
        if(categoria.save(flush:true)){
            success="Se actualizo correctamente la categoria: " + params.nombre?.toUpperCase()
        }else{
            nuevaCategoria.errors.each{
                fail="Ocurrio un error; Intentelo de nuevo ..."
                myLog.info "ocurrio un error - nuevaCategoria: " +it 
            }
        }
        redirect(action:'index', params:['success':success, 'fail':fail])
    }
    
    
    def editarWiki={
        myLog.info "params-wiki: " + params
        def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        def categoria=CategoriaDelProblema.get(params.idCategoria)
        [unidadDeUsuario:unidadDeUsuario, categoria:categoria]
    }
    
    def updateWiki={
        myLog.info "params-updateWiki: " + params
        def success=null
        def fail=null
        def wiki=WikiCategoriaDelProbema.findByCategoria(CategoriaDelProblema.get(params.idCategoria))
        if(wiki){
            myLog.info "--- ya tiene wiki ---"
            wiki.texto=params.wiki 
            if(wiki.save(flush:true)){
                success="Se actualizo correctmante la wiki de la categoria : " + CategoriaDelProblema.get(params.idCategoria)
                myLog.info " actualizando wiki de la categoria: " + CategoriaDelProblema.get(params.idCategoria)
            }else{
                fail="No se pudo actualizar la wiki de la categoria: " + CategoriaDelProblema.get(params.idCategoria)
                wiki.errors.each{
                    myLog.info "errorDeWiki-Update: " + it
                }
            }
        }else{
            myLog.info "--- crear wiki ---"
            def nuevaWiki= new WikiCategoriaDelProbema()
            nuevaWiki.categoria=CategoriaDelProblema.get(params.idCategoria)
            nuevaWiki.texto=params.wiki
            if(nuevaWiki.save(flush:true)){
                success="Se actualizo correctmante la wiki de la categoria : " + CategoriaDelProblema.get(params.idCategoria)
                myLog.info " creando nueva wiki a la categoria: " + CategoriaDelProblema.get(params.idCategoria)
            }else{
                fail="No se pudo actualizar la wiki de la categoria: " + CategoriaDelProblema.get(params.idCategoria)
                nuevaWiki.errors.each{
                    myLog.info "errorDeWiki: " + it
                }
            }
        } 
        redirect(action:'index', params:['success':success, 'fail':fail])
    }
    
    def listaUsuarios={ 
        def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        def users=Usuario.list()
        def unidadDeUsuarios=UsuarioUnidadAdministrativa.executeQuery("from UsuarioUnidadAdministrativa ua where ua.usuario in (:users) order by ua.usuario.enabled, ua.unidad.nombre,ua.usuario.nombre ", [users:users])
        myLog.info " totalDeUsuarios: " + unidadDeUsuarios?.size()
        [usuarios:unidadDeUsuarios, success:params.success, fail:params.fail,unidadDeUsuario:unidadDeUsuario]
    }
    
    def editarUsuario={
        myLog.info "params-editarUsuario: " + params
        def user=Usuario.get(params.idUser)
        def usuarioUnidadAdministrativaInstance=UsuarioUnidadAdministrativa.findByUsuario(user)
        def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        
        [user:user,usuarioUnidadAdministrativaInstance:usuarioUnidadAdministrativaInstance,unidadDeUsuario:unidadDeUsuario]
    }
    
 
    def updateUsuario={
        myLog.info "params-updateUsuario: " + params
        def usuario=Usuario.get(params.idUser)
        def unidad=null
        def nuevaUnidad=null
        def unidadDeForm=UnidadAdministrativa.get(params.unidadId)
        def success=null
        def fail=null
        usuario.nombre=params.nombre
        usuario.username=params.username
        usuario.password=params.password
        usuario.enabled= params.activo ? true : false
        usuario.passwordExpired= params.passwordExpired ? true : false
        usuario.accountExpired=params.accountExpired ? true : false
        usuario.accountLocked=params.accountLocked ? true : false
        usuario.cargo=Cargo.get(params.cargoId)
        usuario.email=params.email

            if(usuario.save(flush:true)){
                myLog.info "update del usurio success"
                unidad= UsuarioUnidadAdministrativa.findByUsuario(usuario) 
                
                    if(unidad.unidad==unidadDeForm){
                            myLog.info "---- son la misma unidad ----"
                             success="Se actualizo correctamente el usuario: " + params.nombre
                    }else{
                            unidad.delete(flush:true)
                                def unidadUpdate= new UsuarioUnidadAdministrativa()
                                unidadUpdate.usuario=usuario
                                unidadUpdate.unidad=unidadDeForm
                                    if(unidadUpdate.save(flush:true)){
                                           myLog.info "update del area del usurio success"                        
                                           success="Se actualizo correctamente el usuario: " + params.nombre
                                    }else{
                                            unidadUpdate.errors.each{
                                            myLog.info " Error en el updateDelAreaDelUsuario: " + it
                                        }                    
                                    }                   
                        }
            }else{
                fail="no se pudo actualizar el usuario; Intentelo de nuevo ..."
                usuario.errors.each{
                    myLog.info " Error en el updateDelUsuario: " + it
                }
            }
        redirect(action:'listaUsuarios', params:['success':success, 'fail':fail])
    }
    
    
    def nuevoUsuario={ 
        def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario)       
        [unidadDeUsuario:unidadDeUsuario]
    }
    
    
    def saveUsuario={
        myLog.info "params-saveUsuario: " + params
        def success=null
        def fail=null
        def usuario= new Usuario()
        usuario.nombre=params.nombre?.toString()?.toUpperCase()
        usuario.username=params.username
        usuario.password=params.password
        usuario.enabled= params.activo ? true : false
        usuario.passwordExpired= params.passwordExpired ? true : false
        usuario.accountExpired=params.accountExpired ? true : false
        usuario.accountLocked=params.accountLocked ? true : false
        usuario.cargo=Cargo.get(params.cargoId)
        usuario.email=params.email
        
        if(usuario.save(flush:true)){
            myLog.info "usuarioCreado-success"
            def unidadUsurio= new UsuarioUnidadAdministrativa()
            unidadUsurio.unidad=UnidadAdministrativa.get(params.unidadId)
            unidadUsurio.usuario=usuario
            if(unidadUsurio.save(flush:true)){
                myLog.info "asignacion de Area-success"
                success="Se creo correctamnete el usuario..."
            }else{
                fail="ocurrio un error; Intentelo mas tarde..."
                unidadUsurio.errors.each{
                    myLog.info "error de asignacion de usuario: "+it
                }
            }
        }else{  fail="ocurrio un error; Intentelo mas tarde..."
            usuario.errors.each{
                fail+=" --- " + it
                myLog.info "error de creacion de usuario: " + it
            }
        }
        redirect(action:'listaUsuarios', params:['success':success, 'fail':fail])
    }
    
    
    def altaDeUnidad={
        def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario)       
        [unidadDeUsuario:unidadDeUsuario]
    }
    
    
    def saveUnidad={
        myLog.info "params-saveUnidad: " + params 
        def success=null
        def fail=null
        def nuevaUnidad= new UnidadAdministrativa()
        nuevaUnidad.nombre=params.nombre?.toUpperCase()
        nuevaUnidad.tipo=params.tipo?.toUpperCase()
        nuevaUnidad.clave=params.clave?.toUpperCase()
        nuevaUnidad.numero=params.numero
        nuevaUnidad.extension=params.extension?.toUpperCase()
        nuevaUnidad.correoElectronico=params.correo
        
        if(nuevaUnidad.save(flush:true)){
            success=" Se creo correctamente la Unidad Administrativa"
        }else{
            fail="ocurrio un error; Intentelo mas tarde..."
            nuevaUnidad.errors.each{
                myLog.info "error al crear Unidad: " + it
            }
        } 
        redirect(action:'listaUsuarios', params:['success':success, 'fail':fail])
    }
    
    def listaUnidades={
                def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario)   
        def unidades=UnidadAdministrativa.list([sort:'nombre', order:'asc'])
        [unidadDeUsuario:unidadDeUsuario,unidades:unidades, success:params.success, fail:params.fail]
    }
    
    def editarUnidad={               
        myLog.info "params-editarUnidad: " + params
        def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario) 
        def unidad=UnidadAdministrativa.get(params.idUnidad)
        [unidad:unidad,unidadDeUsuario:unidadDeUsuario ]
    }
    
    
    def updateUnidad={
        myLog.info "params-updateUnidad: " + params   
        def success=null
        def fail=null
        def unidad=UnidadAdministrativa.get(params.idUnidad)
        unidad.nombre=params.nombre?.toUpperCase()
        unidad.tipo=params.tipo?.toUpperCase()
        unidad.clave=params.clave?.toUpperCase()
        unidad.numero=params.numero
        unidad.extension=params.extension?.toUpperCase()
        unidad.correoElectronico=params.correo
        if(unidad.save(flush:true)){
            success=" Se actualizo correctamente la Unidad Administrativa"
        }else{
            fail="ocurrio un error; Intentelo mas tarde..."
            unidad.errors.each{
                myLog.info "error al crear Unidad: " + it
            }
        } 
        redirect(action:'listaUnidades', params:['success':success, 'fail':fail])
    }
    
    
    /* METODOS DE ATENCION DIRECTA -- LLAMADAS -- TEAMVIEWER --- SITIO */
    
    def altaTeamViewer={      
        myLog.info "initTeamViewer()..." 
        def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario) 
        def topicos=CategoriaDelProblema.findAllByUnidadAdministrativaResponsable(unidadDeUsuario?.unidad, [sort:'nombre', order:'asc'])
        def areas=UnidadAdministrativa.list([sort:'nombre', order:'asc'])
        def tipo="TeamViewer"
        render(view:'atencionDirecta', model:[teamViewer:true, unidadDeUsuario:unidadDeUsuario, tipo:tipo,topicos:topicos, areas:areas])
    }
    
    def altaLlamada={
        myLog.info "initLlamada()..." 
        def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario) 
        def topicos=CategoriaDelProblema.findAllByUnidadAdministrativaResponsable(unidadDeUsuario?.unidad, [sort:'nombre', order:'asc'])
        def areas=UnidadAdministrativa.list([sort:'nombre', order:'asc'])
        def tipo="llamada"
        render(view:'atencionDirecta', model:[llamada:true, unidadDeUsuario:unidadDeUsuario, tipo:tipo,topicos:topicos, areas:areas])
    } 
    
    def altaSitio={
        myLog.info "initLlamada()..." 
        def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario) 
        def topicos=CategoriaDelProblema.findAllByUnidadAdministrativaResponsable(unidadDeUsuario?.unidad, [sort:'nombre', order:'asc'])
        def areas=UnidadAdministrativa.list([sort:'nombre', order:'asc'])
        def tipo="sitio"
        render(view:'atencionDirecta', model:[sitio:true, unidadDeUsuario:unidadDeUsuario, tipo:tipo,topicos:topicos, areas:areas])
    }
    
    def saveAtencionDirecta={
        myLog.info "params-saveAtencionDirecta: " + params
        def error=null
        def success=null
        def directa= new AtencionDirecta()
        def usuario=Usuario.get( springSecurityService.currentUser?.id) 
        def unidad=UnidadAdministrativa.get(params.unidad)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario) 
        directa.categoria=CategoriaDelProblema.get(params.categoria)
        directa.descrpcionDelProblema=params.descripcionDelProblema
        directa.fechaDeAtencion=new Date()
        directa.idTeamViewer=params.teamviewer
        directa.sitio=params.sitio
        directa.telefono=params.llamada
        directa.tipoDeAtencion=params.tipo
        directa.usuarioDeAtencion=usuario
        directa.usuarioQueSeAtiende=params.usuarioQueSeAtiende
        directa.unidad=unidad
        
        if(directa.save(flush:true)){ 
                myLog.info "succcess-atencionDirecta"
                success="Se creo correctamente el registro de la atencion brindada mediante: " + params.tipo +" y se envio la boleta de servicios a los correos correspondientes."
                enviarCorreo(directa, unidadDeUsuario?.unidad?.correoElectronico, unidad?.correoElectronico)//objetoAtencion, areaPrestoAtencion, areaQueRecibioAtencion
        }else{
            error=" Ocurrio un error; Intentelo de nuevo..."
            directa.errors.each{
                error+=it
                myLog.info "error-atencionDirecta: "+ it
            }
        } 
        
        redirect(controller:'solicitudDeCaso' , action:'bandejaDeCasos', params:['error': error, 'botelaExitosa':success])              
    }
    
    
    def agregarRole={
                def usuario=Usuario.get( springSecurityService.currentUser?.id) 
        def unidad=UnidadAdministrativa.get(params.unidad)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario) 
        def usuarios=Usuario.findAllByEnabled(true, [sort:'nombre', order:'asc'])
        def roles=SecRole.list([sort:'authority', order:'asc'])
        [unidadDeUsuario:unidadDeUsuario, usuarios: usuarios, roles:roles]
    }
    
    def guardarRoleUsuario={
        myLog.info "params-guardarRoleUsuario: " + params
        def usuario=Usuario.get(params.usuario)
        def success=null
        def fail=null
        def usuarioRole=SecUsuarioSecRole.findBySecUsuario(usuario)
        if(usuarioRole){
            myLog.info "ya tiene role: " + usuarioRole?.secRole + " - " + usuario
            usuarioRole.delete(flush:true)
                def rolUser= new SecUsuarioSecRole()
                rolUser.secRole=SecRole.get(params.rol)
                rolUser.secUsuario=usuario            
                rolUser.save(flush:true) 
                success="Se agrego correctamente el rol " + rolUser?.secRole + " al usuario: " +rolUser?.secUsuario    
        }else{
            myLog.info "no tiene role... AsignandoRole()..."
            def rolUser= new SecUsuarioSecRole()
            rolUser.secRole=SecRole.get(params.rol)
            rolUser.secUsuario=usuario            
            rolUser.save(flush:true) 
            success="Se agrego correctamente el rol " + rolUser?.secRole + " al usuario: " +rolUser?.secUsuario

        }
       redirect(action:'listaUsuarios', params:['success':success, 'fail':fail]) 
    }
    

    def topicoImpresoraScanner={  
        def usuario=Usuario.get( springSecurityService.currentUser?.id) 
        def unidad=UnidadAdministrativa.get(params.unidad)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario) 
        def impresoras=TopicoDeImpresoras.list([sort:'marca', order:'modelo'])
        [impresoras:impresoras, unidadDeUsuario:unidadDeUsuario]
    }
    
    def nuevaImpresoraScanner={  
        def usuario=Usuario.get( springSecurityService.currentUser?.id) 
        def unidad=UnidadAdministrativa.get(params.unidad)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario) 
        myLog.info "init()...nuevaImpresoraScanner..."
        [unidadDeUsuario:unidadDeUsuario]
    }
    
    def saveImpresoraScanner={
        myLog.info "params-saveImpresoraScanner: " + params
        def success=null
        def fail=null
        def dispositivo= new TopicoDeImpresoras()
        dispositivo.marca=params.marca?.toUpperCase()
        dispositivo.modelo=params.modelo?.toUpperCase()
        dispositivo.tipo=params.tipo?.toUpperCase()  
        
        if(dispositivo.save(flush:true)){
            success="Se Agrego correctamente el dispositivo Impresora/Scanner"
        }else{
            fail="No se pudo agregar el  dispositivo Impresora/Scanner : "
            dispositivo.errors.each{
                fail+=it
                myLog.info "error-saveImpresoraScanner: " + it 
            }
        }
        redirect(action:'listaUsuarios', params:['success':success, 'fail':fail])
    }
    
    
    def editarDispositivo={
        myLog.info "params-editarDispositivo: " + params 
        def usuario=Usuario.get( springSecurityService.currentUser?.id) 
        def unidad=UnidadAdministrativa.get(params.unidad)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario) 
        def dispositivo=TopicoDeImpresoras.get(params.idDispositivo)
        [dispositivo:dispositivo,unidadDeUsuario:unidadDeUsuario ]
    }
    
    def updateImpresoraScanner={
        myLog.info "params-updateImpresoraScanner: " + params 
        def success=null
        def fail=null
        def dispositivo= TopicoDeImpresoras.get(params.idDispositivo)
        dispositivo.marca=params.marca?.toUpperCase()
        dispositivo.modelo=params.modelo?.toUpperCase()
        dispositivo.tipo=params.tipo?.toUpperCase()  
        
        if(dispositivo.save(flush:true)){
            success="Se Agrego correctamente el dispositivo Impresora/Scanner"
        }else{
            fail="No se pudo agregar el  dispositivo Impresora/Scanner : "
            dispositivo.errors.each{
                fail+=it
                myLog.info "error-saveImpresoraScanner: " + it 
            }
        }
        redirect(action:'listaUsuarios', params:['success':success, 'fail':fail])
    }
    
    def boletaDeAtencion={
        def directa=AtencionDirecta.get(1)
        render(template:'boletaDeAtencion', model:[directa:directa])
    } 
    
    def boletaDeMovimientos={
        def caso=Caso.get(72)
        render(template:'boletaDeMovimientos', model:[caso:caso])
    }
    
    
    /* METODOS PARA EL PROCESOS DE ENCUESTA */
    
    def encuesta={
        def usuario=Usuario.get( springSecurityService.currentUser?.id) 
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario) 
        def encuesta=EncuestaDelArea.findByUnidad(unidadDeUsuario?.unidad)
        myLog.info " initEncuesta()... " + encuesta + " ..." 
        def preguntas=PreguntasDeEncuesta.findAllByEncuesta(encuesta, [sort:'rubro', order:'asc'])
        [encuesta:encuesta, preguntas:preguntas, unidadDeUsuario:unidadDeUsuario, fail:params.fail, success:params.success]
    }
    
    def altaDeRubroEncuesta={
        def usuario=Usuario.get( springSecurityService.currentUser?.id) 
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario) 
        def encuesta=EncuestaDelArea.findByUnidad(unidadDeUsuario?.unidad)
        [encuesta:encuesta, unidadDeUsuario:unidadDeUsuario]
    }
    
    def altaDePreguntaEncuesta={
        def usuario=Usuario.get( springSecurityService.currentUser?.id) 
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario) 
        def encuesta=EncuestaDelArea.findByUnidad(unidadDeUsuario?.unidad)
        def rubros=RubrosDeEncuesta.findAllByEncuesta(encuesta)
        [encuesta:encuesta, unidadDeUsuario:unidadDeUsuario, rubros:rubros]
    }
    
    def guardarPreguntaEncuesta={
        myLog.info "params-guardarPreguntaEncuesta: " + params
        def fail=null
        def success=null
        def pregunta=new PreguntasDeEncuesta()        
        pregunta.encuesta=EncuestaDelArea.get(params.idEncuesta)
        pregunta.pregunta=params.pregunta?.toString()?.toUpperCase()
        pregunta.rubro=RubrosDeEncuesta.get(params.rubro)
        if(pregunta.save(flush:true)){
            myLog.info " pregunta agregada correctamente: " + pregunta?.pregunta
            success= "Pregunta Agregada Correctamente: " + pregunta?.pregunta
        }else{
            fail="Ocurrio un error, Intentelo mas tarde..."
            pregunta.errors.each{
                myLog.info "error-guardarPreguntaEncuesta, " + it
            }
        }
        redirect(action:'encuesta' , params:[fail:fail, success:success])
    }
    
    def editarPreguntaEncuesta={
        myLog.info "params-editarPreguntaEncuesta: " + params
        def pregunta=PreguntasDeEncuesta.get(params.idPregunta) 
        def usuario=Usuario.get( springSecurityService.currentUser?.id) 
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario) 
        def encuesta=EncuestaDelArea.findByUnidad(unidadDeUsuario?.unidad)
        [pregunta:pregunta,unidadDeUsuario:unidadDeUsuario,encuesta:encuesta]
    }
    
    
    def guardarRubroEncuesta={
        myLog.info "params-guardarRubroEncuesta: " + params
        def fail=null
        def success=null
        def rubro=new RubrosDeEncuesta()        
        rubro.encuesta=EncuestaDelArea.get(params.idEncuesta)
        rubro.rubro=params.rubro?.toString()?.toUpperCase()
        
        if(rubro.save(flush:true)){
            myLog.info " rubro agregada correctamente: " + rubro?.rubro
            success= "Rubro Agregada Correctamente: " + rubro?.rubro
        }else{
            fail="Ocurrio un error (alta rubro), Intentelo mas tarde..."
            rubro.errors.each{
                myLog.info "error-guardarPreguntaEncuesta, " + it
            }
        }
        redirect(action:'encuesta' , params:[fail:fail, success:success])
    }
    
    def actualizarPreguntaEncuesta={
        myLog.info "params-actualizarPreguntaEncuesta: " + params    
        def fail=null
        def success=null
        def pregunta=PreguntasDeEncuesta.get(params.idPregunta)
        pregunta.pregunta=params.pregunta?.toString()?.toUpperCase()
        pregunta.activo= (params.activo ? true : false)    
        pregunta.rubro=RubrosDeEncuesta.get(params.rubro)
        
        if(pregunta.save(flush:true)){
            myLog.info " pregunta Actualizada correctamente: " + pregunta?.pregunta
            success= "Pregunta Actualizada Correctamente: " + pregunta?.pregunta
        }else{
            fail="Ocurrio un error (ActualizarPregunta), Intentelo mas tarde..."
            pregunta.errors.each{
                myLog.info "error-guardarPreguntaEncuesta, " + it
            }
        }
        
        redirect(action:'encuesta' , params:[fail:fail, success:success])
    }
    
    /* METODOS PRIVADOS PARA EL ENVIO DEL CORREO */
    
        private enviarCorreo(def boletaDeAtencion, def areaPrestoServicio, def areaQueRecicioServicio){
            myLog.info "initEnvioCorreo()..." + areaPrestoServicio + " - " + areaQueRecicioServicio
                sendMail {
                    async true
                    to areaPrestoServicio, areaQueRecicioServicio
                    subject "Boleta de Atencion Directa - "+ boletaDeAtencion?.id +" - IFREM"
                    //body "Hello Watcher!"
                    html g.render(template:"boletaDeAtencion", model:[directa:boletaDeAtencion])
                }
            myLog.info "finEnvioCorreo()..."
        }
        
    
    
    
}
