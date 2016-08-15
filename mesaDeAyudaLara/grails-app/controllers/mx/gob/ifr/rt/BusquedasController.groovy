package mx.gob.ifr.rt

import java.text.SimpleDateFormat

class BusquedasController {
    static final org.apache.log4j.Logger myLog = org.apache.log4j.Logger.getLogger(BusquedasController)
    def springSecurityService
    
    def index() { }
    
       /* METODOS DE BUSQUEDA AVANZADA */
    
    def busquedaAvanzada={
                def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario) 
        [usuario:usuario,unidadDeUsuario:unidadDeUsuario]
    }
    
    def busquedaPorFechas={
        myLog.info  ("busquedaPorFechas init()... " + params)
    }
    
    def generarBusquedaFecha={
        myLog.info  "generarBusquedaFecha-params: " + params
        def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario) 
        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
        def fechaInicial=params.fechaInicio+" 00:00:00"
        def fechaFinal=params.fechaFin+" 23:59:59"
        def rango="Busqueda realizada con el rango de fechas: " +fechaInicial + " al " + fechaFinal
        def casosDeLaUnidad=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario?.unidad, fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        myLog.info  "totalDeResultados: " + casosDeLaUnidad?.size()
        [casos:casosDeLaUnidad, rango:rango]
    }
    
    def busquedaCategoria={
        def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario) 
        def topicos=CategoriaDelProblema.findAllByUnidadAdministrativaResponsable(unidadDeUsuario?.unidad, [sort:'nombre', order:'asc'])
        [unidadDeUsuario:unidadDeUsuario, topicos:topicos]
    }
    
    
    def generarBusquedaTopico={
        myLog.info  "generarBusquedaTopico-params: " + params
        def categoria=CategoriaDelProblema.get(params.topico)
        def casosDeLaUnidad=CasoCategoriaDelProblema.findAllByCategoria(categoria)
        myLog.info  "totalDeResultados: " + casosDeLaUnidad?.size()
        def topico=categoria
        render(view:'generarBusquedaFecha', model:[casos:casosDeLaUnidad, rango:topico])
    }
    
    def busquedaDatoEspecifico={
        myLog.info  "busquedaDatoEspecifico init()... " + params
    }
    
    def generarBusquedaContenido={
        
        def listaDeConcidencias=[]
        def dato="Resultados con base en la busqueda del dato '"+params.dato+"'"
        myLog.info  "generarBusquedaContenido-params: " + params
        def criteria = ValorDatoRequerido.createCriteria()
        def resultados = criteria.list {
            ilike('valor', '%'+params.dato+'%')
        }
        myLog.info  "totalDeConcidencias: " +  resultados?.size()
        resultados.each{
            def mapa=["caso":null, "concidencia":null]
            mapa.caso=it?.caso
            mapa.concidencia=it?.valor
            if(listaDeConcidencias.caso?.contains(it?.caso))
                myLog.info  "yaExisteELCaso: " + it?.caso?.id
             else    
                listaDeConcidencias.add(mapa)
        }
        
        
        def criteriaCaso = Caso.createCriteria()
        def resultadosCaso = criteriaCaso.list {
            ilike('descripcionDelProblema', '%'+params.dato+'%')
        }
          
        resultadosCaso.each{
            def mapa=["caso":null, "concidencia":null]
            mapa.caso=it
            mapa.concidencia=it?.descripcionDelProblema
             if(listaDeConcidencias.caso?.contains(it))
                myLog.info  "yaExisteELCaso: " + it?.id
             else    
                listaDeConcidencias.add(mapa)
        }
        myLog.info  "totalDeConcidenciasCaso: " +  resultadosCaso?.size()
        
        myLog.info  "totalDeConcidencias: " + listaDeConcidencias?.size()
        
        listaDeConcidencias.each{
            myLog.info  "concidencia: " + it?.caso?.id + " concidencia: " + it?.concidencia
        }
        [listaDeConcidencias:listaDeConcidencias, dato:dato]
    }
    
}
