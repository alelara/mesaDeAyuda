package mx.gob.ifr.rt

class ConsultaController {
    static final org.apache.log4j.Logger myLog = org.apache.log4j.Logger.getLogger(ConsultaController)
    def springSecurityService
    
    def index() { redirect:'wiki'}
    
    def wiki={
                myLog.info "initConsultaWiki()..."
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
}
