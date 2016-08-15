package mx.gob.ifr.rt
import grails.converters.JSON
import java.text.SimpleDateFormat
import mx.gob.mx.rt.tareas.TareasAutomatizadasService
import java.util.Random;
class EstadisticaController {
       
    static final org.apache.log4j.Logger myLog = org.apache.log4j.Logger.getLogger(EstadisticaController)
    def springSecurityService
    def tareasAutomatizadasService
    def tareas={
        tareasAutomatizadasService.cierreDeCasosAtendidos()
    }
    
    def index() { }
    
    def generarEstadistica={
        myLog.info "params: " + params
    }
    
    def estadistica={
        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
        def configuracion=ConfiguracionDeMesaDeAyuda.get(1)
        Calendar c = Calendar.getInstance();
        int dia = c.get(Calendar.DATE);
        int mes= c.get(Calendar.MONTH);
        int anio= c.get(Calendar.YEAR);
        def periodo=""
        def fechaInicial=null
        def fechaFinal=null
        GregorianCalendar calendar = new GregorianCalendar(); 
        calendar.setTime(new Date()); 
     
       
        if(dia<configuracion?.diaDeFinEstadistica){
            calendar.add(Calendar.MONTH, -1);
            periodo="Periodo: " + configuracion?.diaDeInicioEstadistica+"/"+(calendar.get(calendar.MONTH)+1)+"/"+anio+" al  "+configuracion?.diaDeFinEstadistica+ "/"+(mes+1)+"/"+anio
            fechaInicial=configuracion?.diaDeInicioEstadistica+"/"+(calendar.get(calendar.MONTH)+1)+"/"+anio+" 00:00:00"
            fechaFinal=configuracion?.diaDeFinEstadistica+ "/"+(mes+1)+"/"+anio+" 23:59:59"
            myLog.info "fechaActual: "+ dia+"/"+(mes+1)+"/"+anio +" pertence al periodo: " + configuracion?.diaDeInicioEstadistica+"/"+(calendar.get(calendar.MONTH)+1)+"/"+anio+" al  "+configuracion?.diaDeFinEstadistica+ "/"+(mes+1)+"/"+anio
        }else{            
            calendar.add(Calendar.MONTH, +1);    
            periodo="Periodo: " +configuracion?.diaDeFinEstadistica+ "/"+(mes+1)+"/"+anio + " al "+ configuracion?.diaDeInicioEstadistica+"/"+(calendar.get(calendar.MONTH)+1)+"/"+anio
            fechaInicial=configuracion?.diaDeFinEstadistica+ "/"+(mes+1)+"/"+anio+" 00:00:00"
            fechaFinal=configuracion?.diaDeInicioEstadistica+"/"+(calendar.get(calendar.MONTH)+1)+"/"+anio+" 23:59:59"
            myLog.info "fechaActual: "+ dia+"/"+(mes+1)+"/"+anio +" pertence al periodo: "+configuracion?.diaDeFinEstadistica+ "/"+(mes+1)+"/"+anio + " al "+ configuracion?.diaDeInicioEstadistica+"/"+(calendar.get(calendar.MONTH)+1)+"/"+anio
        }
        
        def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        def casosDeLaUnidad=getCasosDeLaUnidad(unidadDeUsuario?.unidad, fechaInicial,fechaFinal,formatoDelTexto )//CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario?.unidad, fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        def casosDeLaUnidadSeguimiento=getCasosDeLaUnidadSeguimiento(unidadDeUsuario?.unidad, fechaInicial,fechaFinal,formatoDelTexto )//=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and (ca.caso.estado=:atendido or ca.caso.estado=:seguimiento)  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario?.unidad,atendido:EstadoDelCaso.get(3),seguimiento:EstadoDelCaso.get(2), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        def casosDeLaUnidadResueltos=getCasosDeLaUnidadResueltos(unidadDeUsuario?.unidad, fechaInicial,fechaFinal,formatoDelTexto )//CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.estado=:cerrado  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin  order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario?.unidad, cerrado:EstadoDelCaso.get(4), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        
        def casosDeLaUnidadNuevos=getCasosDeLaUnidadNuevos(unidadDeUsuario?.unidad, fechaInicial,fechaFinal,formatoDelTexto )//CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.estado=:cerrado  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin  order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario?.unidad, cerrado:EstadoDelCaso.get(1), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        def casosDeLaUnidadSeguimientos=getCasosDeLaUnidadSeguimientos(unidadDeUsuario?.unidad, fechaInicial,fechaFinal,formatoDelTexto )//CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.estado=:cerrado  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin  order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario?.unidad, cerrado:EstadoDelCaso.get(2), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        def casosDeLaUnidadCerrados=getCasosDeLaUnidadCerrados(unidadDeUsuario?.unidad, fechaInicial,fechaFinal,formatoDelTexto )//CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.estado=:cerrado  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin  order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario?.unidad, cerrado:EstadoDelCaso.get(4), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        def casosDeLaUnidadAtendidos=getCasosDeLaUnidadAtendidos(unidadDeUsuario?.unidad, fechaInicial,fechaFinal,formatoDelTexto )//CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.estado=:cerrado  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario?.unidad, cerrado:EstadoDelCaso.get(3), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        
        
        myLog.info "total de casos de la unidad de  " + unidadDeUsuario?.unidad + " = " + casosDeLaUnidad?.size()
        myLog.info "total de ABIERTOS casos de la unidad de  " + unidadDeUsuario?.unidad + " = " + casosDeLaUnidadSeguimiento?.size()
        myLog.info "total de casos CERRADOS de la unidad de  " + unidadDeUsuario?.unidad + " = " + casosDeLaUnidadResueltos?.size()
        
        def seguimiento=casosDeLaUnidadSeguimientos?.size()
        def cerrados=casosDeLaUnidadCerrados?.size()
        def atendidos=casosDeLaUnidadAtendidos?.size()
        def nuevos=casosDeLaUnidadNuevos?.size()
        
        def objetivo= getObjetivo(casosDeLaUnidadSeguimiento?.size(),casosDeLaUnidad?.size())//(casosDeLaUnidadSeguimiento?.size()/(casosDeLaUnidad?.size())*100)
        def proceso=getProceso(casosDeLaUnidadResueltos?.size(),casosDeLaUnidad?.size()) //(casosDeLaUnidadResueltos?.size()/(casosDeLaUnidad?.size())*100)
        def servicio=getServicio(casosDeLaUnidad?.size())//(casosDeLaUnidad?.size()/(casosDeLaUnidad?.size())*100)
        def total=casosDeLaUnidad?.size()
        
        def creadosAnual=casosCreadosAnualmente(unidadDeUsuario?.unidad, 1, 1)
        def creadosSeguimiento=casosCreadosAnualmente(unidadDeUsuario?.unidad, 1, 2)
        def creadosAtendido=casosCreadosAnualmente(unidadDeUsuario?.unidad, 1, 3)
        def creadosCerrado=casosCreadosAnualmente(unidadDeUsuario?.unidad, 1, 4)
        
        myLog.info "\nobjetivo: " + objetivo
        myLog.info "proceso: " + proceso
        myLog.info "servicio: " + servicio   
        
        myLog.info " ====================== anulidad ==================================="
        myLog.info "creados: " + creadosAnual
        myLog.info "creadosSeguimiento: " + creadosSeguimiento
        myLog.info "creadosAtendido: " + creadosAtendido
        myLog.info "creadosCerrado: " + creadosCerrado
        
        myLog.info "======================== sgc anual ====================================="
        def listaSGC= estadisticaDeGestionAnual(unidadDeUsuario?.unidad)
        
        myLog.info "======================== sgc anual - unidades  ====================================="
        def listaArea= estadisticaDeGestionAnualUnidad(unidadDeUsuario?.unidad) 
        
        myLog.info "======================== sgc anual - tickets por problema  ====================================="
        def ticketProblema=ticketsPorCategorias(unidadDeUsuario)
        def ticketProblemaDos=ticketsPorCategoriasDos(unidadDeUsuario)
        
        myLog.info "======================== sgc anual - tickets por topico  ====================================="
        def topicoCount=categoriasFrecuencias(unidadDeUsuario?.unidad)
        
        
        [objetivo:objetivo, proceso:proceso, servicio:servicio, total:total, unidadDeUsuario:unidadDeUsuario,seguimiento:seguimiento, cerrados:cerrados,atendidos:atendidos ,nuevos:nuevos, 
            creadosAnual:creadosAnual, creadosSeguimiento:creadosSeguimiento, creadosAtendido:creadosAtendido, creadosCerrado:creadosCerrado,periodo:periodo, listaSGC:listaSGC,
            listaArea:listaArea,ticketProblema:ticketProblema,ticketProblemaDos:ticketProblemaDos, topicoCount:topicoCount.sort{it.numero}
        ]
    }
    
    
    
    def estadisticaConfigurable={
              def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        [unidadDeUsuario:unidadDeUsuario]
    }
    
    
    def generarEstadisticaConfigurable={
        myLog.info "params-generarEstadistica: " + params
        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
        def fechaInicial=params.fechaInicio+" 00:00:00"
        def fechaFinal=params.fechaFin+" 23:59:59"
        def periodo= "Periodo: " + fechaInicial + " al " + fechaFinal 
        def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        def casosDeLaUnidad=getCasosDeLaUnidad(unidadDeUsuario?.unidad, fechaInicial,fechaFinal,formatoDelTexto )//CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario?.unidad, fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        def casosDeLaUnidadSeguimiento=getCasosDeLaUnidadSeguimiento(unidadDeUsuario?.unidad, fechaInicial,fechaFinal,formatoDelTexto )//=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and (ca.caso.estado=:atendido or ca.caso.estado=:seguimiento)  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario?.unidad,atendido:EstadoDelCaso.get(3),seguimiento:EstadoDelCaso.get(2), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        def casosDeLaUnidadResueltos=getCasosDeLaUnidadResueltos(unidadDeUsuario?.unidad, fechaInicial,fechaFinal,formatoDelTexto )//CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.estado=:cerrado  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin  order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario?.unidad, cerrado:EstadoDelCaso.get(4), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        
        def casosDeLaUnidadNuevos=getCasosDeLaUnidadNuevos(unidadDeUsuario?.unidad, fechaInicial,fechaFinal,formatoDelTexto )//CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.estado=:cerrado  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin  order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario?.unidad, cerrado:EstadoDelCaso.get(1), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        def casosDeLaUnidadSeguimientos=getCasosDeLaUnidadSeguimientos(unidadDeUsuario?.unidad, fechaInicial,fechaFinal,formatoDelTexto )//CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.estado=:cerrado  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin  order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario?.unidad, cerrado:EstadoDelCaso.get(2), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        def casosDeLaUnidadCerrados=getCasosDeLaUnidadCerrados(unidadDeUsuario?.unidad, fechaInicial,fechaFinal,formatoDelTexto )//CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.estado=:cerrado  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin  order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario?.unidad, cerrado:EstadoDelCaso.get(4), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        def casosDeLaUnidadAtendidos=getCasosDeLaUnidadAtendidos(unidadDeUsuario?.unidad, fechaInicial,fechaFinal,formatoDelTexto )//CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.estado=:cerrado  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario?.unidad, cerrado:EstadoDelCaso.get(3), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        
        
        myLog.info "total de casos de la unidad de  " + unidadDeUsuario?.unidad + " = " + casosDeLaUnidad?.size()
        myLog.info "total de ABIERTOS casos de la unidad de  " + unidadDeUsuario?.unidad + " = " + casosDeLaUnidadSeguimiento?.size()
        myLog.info "total de casos CERRADOS de la unidad de  " + unidadDeUsuario?.unidad + " = " + casosDeLaUnidadResueltos?.size()
        
        def seguimiento=casosDeLaUnidadSeguimientos?.size()
        def cerrados=casosDeLaUnidadCerrados?.size()
        def atendidos=casosDeLaUnidadAtendidos?.size()
        def nuevos=casosDeLaUnidadNuevos?.size()
        
        myLog.info "=================================================================================================="
        myLog.info "nuevos: " + nuevos
        myLog.info "seguimiento: " + seguimiento
        myLog.info "atendidos: " + atendidos 
        myLog.info "cerrados: " + cerrados
        
        myLog.info "formulaObjetivo: " + casosDeLaUnidadSeguimiento?.size() + "/" + casosDeLaUnidad?.size()
        def objetivo= getObjetivo(casosDeLaUnidadSeguimiento?.size(),casosDeLaUnidad?.size())//(casosDeLaUnidadSeguimiento?.size()/(casosDeLaUnidad?.size())*100)
        def proceso=getProceso(casosDeLaUnidadResueltos?.size(),casosDeLaUnidad?.size()) //(casosDeLaUnidadResueltos?.size()/(casosDeLaUnidad?.size())*100)
        def servicio=getServicio(casosDeLaUnidad?.size())//(casosDeLaUnidad?.size()/(casosDeLaUnidad?.size())*100)
        def total=casosDeLaUnidad?.size()
         
        myLog.info "=================================================================================================="
        myLog.info "\nobjetivo: " + objetivo
        myLog.info "proceso: " + proceso
        myLog.info "servicio: " + servicio   
        
        [fechaFin:params.fechaFin,fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario, objetivo:objetivo, proceso:proceso,servicio:servicio, seguimiento:seguimiento, cerrados:cerrados, atendidos:atendidos, nuevos:nuevos, total:casosDeLaUnidad?.size(),periodo:periodo]
    }
    
    
    
    /*MEDODOS AUXLIARES */
    
    
    private casosCreadosAnualmente(def unidadDeUsuario, def dia , def estado){
    Calendar c = Calendar.getInstance();
    int anio = c.get(Calendar.YEAR);
    SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
    Date fechaInicio=null
    Date fechaFin=null
    def casosDeLaUnidad=null
    def valores="["
    for(int x=1; x<=12; x++){
        def mes=null           
            if(x<=9)
                mes="0"+x
            else
                mes=x
                
        fechaInicio=formatoDelTexto.parse(dia +"/"+mes+"/"+anio+" 00:00:00")
        fechaFin=formatoDelTexto.parse(UltimoDia(anio, x, dia)+"/"+mes+"/"+anio+" 23:59:59")
        
            switch(estado){
            case 1: casosDeLaUnidad=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario, fechaInicio:fechaInicio, fechaFin:fechaFin])
                break;
            case 2: casosDeLaUnidad=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin and ca.caso.estado=:estado order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario, fechaInicio:fechaInicio, fechaFin:fechaFin, estado:EstadoDelCaso.get(2)])
                break;                
            case 3: casosDeLaUnidad=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin and ca.caso.estado=:estado  order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario, fechaInicio:fechaInicio, fechaFin:fechaFin, estado: EstadoDelCaso.get(3)])
                break;                
            case 4: casosDeLaUnidad=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin and ca.caso.estado=:estado  order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario, fechaInicio:fechaInicio, fechaFin:fechaFin, estado: EstadoDelCaso.get(4)])
                break;
            }
            myLog.info "estado: "+ estado +" --- fechaInicio:  " +dia +"/"+mes+"/"+anio+" 00:00:00"  + " fechaFinal: " + UltimoDia(anio, x, dia)+"/"+mes+"/"+anio+" 23:59:59" + "----- TotalDeEseMes: " + casosDeLaUnidad?.size()
           
            if(x<12)
                valores+="["+x+","+casosDeLaUnidad?.size()+"],"
            else    
                valores+="["+x+","+casosDeLaUnidad?.size()+"]"
        }
        valores+="]"
        myLog.info "valores: " + valores
        return valores
    }
    
    
    private UltimoDia(def anio, def mes, def dia){
        Calendar cal = Calendar.getInstance();
        cal.set(anio,(mes-1),dia)       
        //cal.set(cal.get(Calendar.YEAR),cal.get(Calendar.MONTH),cal.getActualMaximum(Calendar.DAY_OF_MONTH),cal.getMaximum(Calendar.HOUR_OF_DAY),cal.getMaximum(Calendar.MINUTE),cal.getMaximum(Calendar.SECOND))
        return cal.getActualMaximum(Calendar.DAY_OF_MONTH)
    }
    
    
    private estadisticaDeGestionAnual(def unidadDeUsuario){
        Calendar c = Calendar.getInstance();
        int anio = c.get(Calendar.YEAR)
        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy")
        def configuracion= ConfiguracionDeMesaDeAyuda.get(1)
        GregorianCalendar calendar = new GregorianCalendar(); 
        def fechaInicial=null
        def fechaFinal=null
        def listaSGC=[]
        int totalAnual=0
        int totalNuevos=0
        int totalSeguimiento=0
        int totalAtendido=0
        int totalCerrados=0
        
        for(int x=1; x<=12; x++){
            calendar.setTime(formatoDelTexto.parse(configuracion?.diaDeInicioEstadistica +"/"+x+"/"+anio)); 
            calendar.add(Calendar.MONTH, +1);
            //myLog.info "ObteniendoDatosDelMes: " + configuracion?.diaDeFinEstadistica +"/"+x+"/"+anio + " al " +  configuracion?.diaDeInicioEstadistica +"/"+(calendar.get(calendar.MONTH)+1)+"/"+anio
            def mapa=["totalNuevos":null,"totalSeguimiento":null,"totalAtendido":null,"totalCerrados":null,"totalAnual":null,"periodoGrafica":null, "periodo":null,"objetivo":null, "proceso":null, "servicio":null, "total":null, "nuevos":null, "atendidos":null, "seguimiento":null, "cerrados":null]
            if(x<12)
            {
                fechaInicial= configuracion?.diaDeFinEstadistica +"/"+x+"/"+anio
                fechaFinal= configuracion?.diaDeInicioEstadistica +"/"+(calendar.get(calendar.MONTH)+1)+"/"+anio                 
            }else{   
                fechaInicial= configuracion?.diaDeFinEstadistica +"/"+x+"/"+anio
                fechaFinal= configuracion?.diaDeInicioEstadistica +"/"+(calendar.get(calendar.MONTH)+1)+"/"+ calendar.get(calendar.YEAR)  
            }
            
            
            myLog.info "ObteniendoDatosDelMes: " + fechaInicial + " ---- " + fechaFinal
            
            def casosDeLaUnidad=getCasosDeLaUnidad(unidadDeUsuario, fechaInicial,fechaFinal,formatoDelTexto )
            def casosDeLaUnidadSeguimiento=getCasosDeLaUnidadSeguimiento(unidadDeUsuario, fechaInicial,fechaFinal,formatoDelTexto )
            def casosDeLaUnidadResueltos=getCasosDeLaUnidadResueltos(unidadDeUsuario, fechaInicial,fechaFinal,formatoDelTexto )
            
            def casosDeLaUnidadNuevos=getCasosDeLaUnidadNuevos(unidadDeUsuario, fechaInicial,fechaFinal,formatoDelTexto )
            def casosDeLaUnidadSeguimientos=getCasosDeLaUnidadSeguimientos(unidadDeUsuario, fechaInicial,fechaFinal,formatoDelTexto )
            def casosDeLaUnidadCerrados=getCasosDeLaUnidadCerrados(unidadDeUsuario, fechaInicial,fechaFinal,formatoDelTexto )
            def casosDeLaUnidadAtendidos=getCasosDeLaUnidadAtendidos(unidadDeUsuario, fechaInicial,fechaFinal,formatoDelTexto )
            
            myLog.info "total de casos de la unidad de  " + unidadDeUsuario + " = " + casosDeLaUnidad?.size()
            myLog.info "total de ABIERTOS casos de la unidad de  " + unidadDeUsuario + " = " + casosDeLaUnidadSeguimiento?.size()
            myLog.info "total de casos CERRADOS de la unidad de  " + unidadDeUsuario + " = " + casosDeLaUnidadResueltos?.size()
            
            def objetivo= getObjetivo(casosDeLaUnidadSeguimiento?.size(),casosDeLaUnidad?.size())
            def proceso=getProceso(casosDeLaUnidadResueltos?.size(),casosDeLaUnidad?.size())
            def servicio=getServicio(casosDeLaUnidad?.size())
            def total=casosDeLaUnidad?.size()
            
            totalAnual+=total
            totalNuevos+=casosDeLaUnidadNuevos?.size()
            totalSeguimiento+=casosDeLaUnidadSeguimientos?.size()
            totalAtendido+=casosDeLaUnidadAtendidos?.size()
            totalCerrados+=casosDeLaUnidadCerrados?.size()
            
            myLog.info "\nobjetivo: " + objetivo
            myLog.info "proceso: " + proceso
            myLog.info "servicio: " + servicio  
            myLog.info "totalAnual: " + totalAnual
            mapa.periodoGrafica=fechaFinal
            mapa.periodo="Periodo: " + fechaInicial+" al "+fechaFinal
            mapa.objetivo=objetivo
            mapa.proceso=proceso
            mapa.servicio=servicio
            mapa.total=total
            mapa.nuevos=casosDeLaUnidadNuevos?.size()
            mapa.atendidos=casosDeLaUnidadAtendidos?.size()
            mapa.seguimiento=casosDeLaUnidadSeguimientos?.size()
            mapa.cerrados=casosDeLaUnidadCerrados?.size()
            mapa.totalAnual=totalAnual
            mapa.totalNuevos=totalNuevos
            mapa.totalSeguimiento=totalSeguimiento
            mapa.totalAtendido=totalAtendido
            mapa.totalCerrados=totalCerrados
            listaSGC.add(mapa)            
            myLog.info "-----------------------------------------------------------------------------------------------------------------------------"
        }
        
        return listaSGC
        
    }
    
    
    
    
    private estadisticaDeGestionAnualUnidad(def unidadDeUsuario){
        Calendar c = Calendar.getInstance();
        int anio = c.get(Calendar.YEAR)
        def unidades=UnidadAdministrativa.list()
        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy");;
        def fechaInicial="01/01/"+anio+" 00:00:00"
        def fechaFinal="31/12/"+anio+" 23:59:59"
        def listaPorUnidad=[]
        unidades.each{
            myLog.info "unidad: " + it   
            def mapa=["unidad":null, "total":null, "creados":null, "seguimiento":null, "atendidos":null, "cerrados":null]
            def usuarios=UsuarioUnidadAdministrativa.findAllByUnidad(it)
            def casosDeLaUnidad=getCasosDeLaUnidadAnual(unidadDeUsuario, fechaInicial,fechaFinal,formatoDelTexto ,usuarios)  
            def casosDeLaUnidadNuevos=getCasosDeLaUnidadNuevosAnual(unidadDeUsuario, fechaInicial,fechaFinal,formatoDelTexto,usuarios )
            def casosDeLaUnidadSeguimientos=getCasosDeLaUnidadSeguimientosAnual(unidadDeUsuario, fechaInicial,fechaFinal,formatoDelTexto,usuarios )
            def casosDeLaUnidadCerrados=getCasosDeLaUnidadCerradosAnual(unidadDeUsuario, fechaInicial,fechaFinal,formatoDelTexto,usuarios )
            def casosDeLaUnidadAtendidos=getCasosDeLaUnidadAtendidosAnual(unidadDeUsuario, fechaInicial,fechaFinal,formatoDelTexto,usuarios )
            
            myLog.info "casosDeLaUnidad: "+ casosDeLaUnidad?.size()
            myLog.info "casosDeLaUnidadNuevos: "+ casosDeLaUnidadNuevos?.size()
            myLog.info "casosDeLaUnidadSeguimientos: "+ casosDeLaUnidadSeguimientos?.size()
            myLog.info "casosDeLaUnidadCerrados: "+ casosDeLaUnidadCerrados?.size()
            myLog.info "casosDeLaUnidadAtendidos: "+ casosDeLaUnidadAtendidos?.size()
            
            mapa.unidad=it
            mapa.total= casosDeLaUnidad?.size()
            mapa.creados=casosDeLaUnidadNuevos?.size()
            mapa.seguimiento=casosDeLaUnidadSeguimientos?.size()
            mapa.atendidos=casosDeLaUnidadAtendidos?.size()
            mapa.cerrados=casosDeLaUnidadCerrados?.size()
            mapa.detalleAnual=detalleAnual(unidadDeUsuario, 1, usuarios)
            listaPorUnidad.add(mapa)            
            myLog.info "----------------------------------------------------------------------------------------"
        }
        
        return listaPorUnidad
    } 
    
    
    private getCasosDeLaUnidad(def unidadDeUsuario, def fechaInicial, def fechaFinal,def formatoDelTexto ){
        def casosDeLaUnidad=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario, fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        return casosDeLaUnidad
    }
    
    private getCasosDeLaUnidadSeguimiento(def unidadDeUsuario, def fechaInicial, def fechaFinal,def formatoDelTexto ){
        def casosDeLaUnidadSeguimiento=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and (ca.caso.estado=:atendido or ca.caso.estado=:seguimiento)  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario,atendido:EstadoDelCaso.get(3),seguimiento:EstadoDelCaso.get(2), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        return casosDeLaUnidadSeguimiento
    }    
     
    private getCasosDeLaUnidadResueltos(def unidadDeUsuario, def fechaInicial, def fechaFinal,def formatoDelTexto ){
        def casosDeLaUnidadResueltos=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.estado=:cerrado  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin  order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario, cerrado:EstadoDelCaso.get(4), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        return casosDeLaUnidadResueltos
    }
    
    private getCasosDeLaUnidadNuevos(def unidadDeUsuario, def fechaInicial, def fechaFinal,def formatoDelTexto ){
        def casosDeLaUnidadNuevos=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.estado=:cerrado  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin  order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario, cerrado:EstadoDelCaso.get(1), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        return casosDeLaUnidadNuevos
    }
    
    private getCasosDeLaUnidadSeguimientos(def unidadDeUsuario, def fechaInicial, def fechaFinal,def formatoDelTexto ){
        def casosDeLaUnidadSeguimientos=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.estado=:cerrado  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin  order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario, cerrado:EstadoDelCaso.get(2), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        return casosDeLaUnidadSeguimientos
    }
    
    private getCasosDeLaUnidadCerrados(def unidadDeUsuario, def fechaInicial, def fechaFinal,def formatoDelTexto ){
        def casosDeLaUnidadCerrados=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.estado=:cerrado  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin  order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario, cerrado:EstadoDelCaso.get(4), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        return casosDeLaUnidadCerrados
    }
    
    private getCasosDeLaUnidadAtendidos(def unidadDeUsuario, def fechaInicial, def fechaFinal,def formatoDelTexto ){
        def casosDeLaUnidadAtendidos=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.estado=:cerrado  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario, cerrado:EstadoDelCaso.get(3), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal)])
        return casosDeLaUnidadAtendidos
    }    

       
    
    /*metodos auxiliares para la grafica aual*/
    
    private getCasosDeLaUnidadAnual(def unidadDeUsuario, def fechaInicial, def fechaFinal,def formatoDelTexto , def users){
        myLog.info "----> " + unidadDeUsuario + " " + fechaInicial + " " + fechaFinal + " " + formatoDelTexto + " " + users
        def casosDeLaUnidad=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin and ca.caso.creador in(:users) order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario, fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal), users:users?.usuario])
        return casosDeLaUnidad
    }    
    
    private getCasosDeLaUnidadNuevosAnual(def unidadDeUsuario, def fechaInicial, def fechaFinal,def formatoDelTexto , def users){
        def casosDeLaUnidadNuevos=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.estado=:cerrado  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin  and ca.caso.creador in(:users)  order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario, cerrado:EstadoDelCaso.get(1), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal), users:users?.usuario])
        return casosDeLaUnidadNuevos
    }
    
    private getCasosDeLaUnidadSeguimientosAnual(def unidadDeUsuario, def fechaInicial, def fechaFinal,def formatoDelTexto, def users ){
        def casosDeLaUnidadSeguimientos=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.estado=:cerrado  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin  and ca.caso.creador in(:users)  order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario, cerrado:EstadoDelCaso.get(2), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal), users:users?.usuario])
        return casosDeLaUnidadSeguimientos
    }
    
    private getCasosDeLaUnidadCerradosAnual(def unidadDeUsuario, def fechaInicial, def fechaFinal,def formatoDelTexto, def users ){
        def casosDeLaUnidadCerrados=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.estado=:cerrado  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin  and ca.caso.creador in(:users)  order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario, cerrado:EstadoDelCaso.get(4), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal), users:users?.usuario])
        return casosDeLaUnidadCerrados
    }
    
    private getCasosDeLaUnidadAtendidosAnual(def unidadDeUsuario, def fechaInicial, def fechaFinal,def formatoDelTexto , def users){
        def casosDeLaUnidadAtendidos=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.estado=:cerrado  and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin  and ca.caso.creador in(:users) order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario, cerrado:EstadoDelCaso.get(3), fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal), users:users?.usuario])
        return casosDeLaUnidadAtendidos
    }   
    
    
    private detalleAnual(def unidadDeUsuario, def dia, usuarios){ //        //5,6,7,9,9,5,3,2,2,4,6,7
    Calendar c = Calendar.getInstance();
    int anio = c.get(Calendar.YEAR);
    SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
    Date fechaInicio=null
    Date fechaFin=null
    def casosDeLaUnidad=null
    def valores=""
    for(int x=1; x<=12; x++){
        def mes=null           
            if(x<=9)
                mes="0"+x
            else
                mes=x
                
        fechaInicio=formatoDelTexto.parse(dia +"/"+mes+"/"+anio+" 00:00:00")
        fechaFin=formatoDelTexto.parse(UltimoDia(anio, x, dia)+"/"+mes+"/"+anio+" 23:59:59")       
        casosDeLaUnidad=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema ca where ca.categoria.unidadAdministrativaResponsable=:area and ca.caso.fechaDeCreacion>=:fechaInicio and ca.caso.fechaDeCreacion<=:fechaFin and ca.caso.creador in(:users) order by ca.caso.fechaDeCreacion", [area: unidadDeUsuario, fechaInicio:fechaInicio, fechaFin:fechaFin, users:usuarios?.usuario])

            if(x<12)
                valores+=casosDeLaUnidad?.size()+","
            else    
                valores+=casosDeLaUnidad?.size()
        }       
        myLog.info "valores: " + valores
        return valores
    }
    
    
    private getObjetivo(def casosDeLaUnidadSeguimiento, def casosDeLaUnidad){
        def objetivo=0   
        def castObj=null
        if(casosDeLaUnidad>0) 
             objetivo= (casosDeLaUnidadSeguimiento/(casosDeLaUnidad)*100)
               
        castObj=objetivo-100
        return (castObj * - 1)
    }
     
    private getProceso(def casosDeLaUnidadResueltos, def casosDeLaUnidad){
        def proceso=0
        if(casosDeLaUnidad>0)
            proceso=(casosDeLaUnidadResueltos/(casosDeLaUnidad)*100)
            
        return proceso
    }
    
    private getServicio(def casosDeLaUnidad){
        def servicio=0
        if(casosDeLaUnidad>0)
            servicio=(casosDeLaUnidad/(casosDeLaUnidad)*100)
            
        return servicio
    }
  
    
    /* metodos para obtener el total de tickets por categoria */
    private ticketsPorCategorias(def usuario){
        
//        {
//                value: 30,
//                color: "#82b964"
//            },
            
        def categorias=CategoriaDelProblema.findAllByUnidadAdministrativaResponsable(usuario?.unidad)
        int cont=categorias?.size()
        int x=0
        myLog.info "tamaño: " + categorias?.size()
        def valores="["
        def lista=[]
        categorias.each{
            def mapa=["valor":null,"categoria":null, "color":null] 
            def casos=CasoCategoriaDelProblema.findAllByCategoria(it)
            mapa.valor=casos?.size()
            mapa.categoria=it
            mapa.color=paletaDeColores()
            lista.add(mapa)
            myLog.info "total de Casos: " + casos?.size() + " (" + it + " )" 
            if(x< (cont-1))
                valores+="{ value:"+ casos?.size()+", color: "+ paletaDeColores() +"},"
            else    
              valores+="{ value:"+ casos?.size()+", color:"+ paletaDeColores() +"}]"
              
           x++ 
        }
        
        myLog.info "data: " + valores + " ----- lista: " + lista
        return lista
    }
    
     private ticketsPorCategoriasDos(def usuario){
        
//        {
//                value: 30,
//                color: "#82b964"
//            },
            
        def categorias=CategoriaDelProblema.findAllByUnidadAdministrativaResponsable(usuario?.unidad)
        int cont=categorias?.size()
        int x=0
        myLog.info "tamaño: " + categorias?.size()
        def valores="["
        def lista=[]
        categorias.each{
            def mapa=["valor":null,"categoria":null, "color":null] 
            def casos=CasoCategoriaDelProblema.findAllByCategoria(it)
            mapa.valor=casos?.size()
            mapa.categoria=it
            mapa.color=paletaDeColores()
            lista.add(mapa)
            myLog.info "total de Casos: " + casos?.size() + " (" + it + " )" 
            if(x< (cont-1))
                valores+="{ value:"+ casos?.size()+", color: \""+ paletaDeColores() +"\"},"
            else    
              valores+="{ value:"+ casos?.size()+", color:\""+ paletaDeColores() +"\"}]"
              
           x++ 
        }
        
        myLog.info "data: " + valores + " ----- lista: " + lista
        return valores
    }
    
    private paletaDeColores(){
        Random random = new Random();
        def colores=[]
        colores.add("#00FF00")
        colores.add("#0000FF")
        colores.add("#FF00FF")
        colores.add("#00FFFF")
        colores.add("#FFFF00")
        colores.add("#000000")
        colores.add("#70DB93")
        colores.add("#5C3317")
        colores.add("#9F5F9F")
        colores.add("#B5A642")
        colores.add("#D9D919")
        colores.add("#A62A2A")
        colores.add("#8C7853")
        colores.add("#A67D3D")
        colores.add("#5F9F9F")
        colores.add("#D98719")
        colores.add("#B87333")
        colores.add("#FF7F00")
        colores.add("#42426F")
        colores.add("#5C4033")
        colores.add("#2F4F2F")
        colores.add("#4A766E")
        colores.add("#4F4F2F")
        colores.add("#9932CD")
        colores.add("#871F78")
        colores.add("#6B238E")
        colores.add("#2F4F4F")
        colores.add("#97694F")
        colores.add("#7093DB")
        colores.add("#855E42")
        colores.add("#545454")
        colores.add("#856363")
        colores.add("#D19275")
        colores.add("#8E2323")
        colores.add("#238E23")
        colores.add("#CD7F32")
        colores.add("#DBDB70")
        colores.add("#C0C0C0")
        colores.add("#527F76")
        colores.add("#93DB70")
        colores.add("#215E21")
        colores.add("#4E2F2F")
        colores.add("#9F9F5F")
        colores.add("#C0D9D9")
        colores.add("#A8A8A8")
        colores.add("#8F8FBD")
        colores.add("#E9C2A6")
        colores.add("#32CD32")
        colores.add("#E47833")
        colores.add("#8E236B")
        colores.add("#32CD99")
        colores.add("#3232CD")
        colores.add("#6B8E23")
        colores.add("#EAEAAE")
        colores.add("#9370DB")
        colores.add("#426F42")
        colores.add("#7F00FF")
        colores.add("#7FFF00")
        colores.add("#70DBDB")
        colores.add("#DB7093")
        colores.add("#A68064")
        colores.add("#2F2F4F")
        colores.add("#23238E")
        colores.add("#4D4DFF")
        colores.add("#FF6EC7")
        colores.add("#00009C")
        colores.add("#EBC79E")
        colores.add("#CFB53B")
        colores.add("#FF7F00")
        colores.add("#FF2400")
        colores.add("#DB70DB")
        colores.add("#8FBC8F")
        colores.add("#BC8F8F")
        colores.add("#EAADEA")
        colores.add("#D9D9F3")
        colores.add("#5959AB")
        colores.add("#6F4242")
        colores.add("#8C1717")
        colores.add("#238E68")
        colores.add("#6B4226")
        colores.add("#8E6B23")
        colores.add("#E6E8FA")
        colores.add("#3299CC")
        colores.add("#007FFF")
        colores.add("#FF1CAE")
        colores.add("#00FF7F")
        colores.add("#236B8E")
        colores.add("#38B0DE")
        colores.add("#DB9370")
        colores.add("#D8BFD8")
        colores.add("#ADEAEA")
        colores.add("#5C4033")
        colores.add("#CDCDCD")
        colores.add("#4F2F4F")
        colores.add("#CC3299")
        colores.add("#D8D8BF")
        colores.add("#99CC32")

        int index = random.nextInt(colores.size());
        myLog.info("\nIndex :" + index );        
        myLog.info("color: " +  colores.get(index));        
        return colores.get(index)
        
    }

    
    private categoriasFrecuencias(def unidad){
        def lista=[]
        def categorias=CategoriaDelProblema.findAllByUnidadAdministrativaResponsable(unidad)
        def total=CasoCategoriaDelProblema.executeQuery("from CasoCategoriaDelProblema cc where cc.categoria in(:categorias)", [categorias:categorias])
        myLog.info "totalDeCasosExistenteS: " + total?.size() 
        categorias.each{
            def mapa=["topico":null, "numero":null, "porcentaje":null, "total":null]
            def numero=categoriasFrecuentes(it)
            myLog.info "topico: " + it + " --- " + numero
            mapa.topico=it
            mapa.numero=numero
            mapa.total=total?.size()
            mapa.porcentaje= ((numero*100)/total?.size())
            lista.add(mapa)
        }        
        return lista
    }  
    
    
    private  categoriasFrecuentes(def categoria){
        def caso=CasoCategoriaDelProblema.countByCategoria(categoria)
        return caso
    }
    
    
    /* METODOS PARA EL MODULO DE ENCUESTAS */
    
    def encuestas={
        myLog.info "initEncuestas()..."
    }
    
    def generarEstadisticaDeEncuestaDinamica={
        myLog.info "initEncuestaDinamica()..."         
        def listaDePromedios=[]
        SimpleDateFormat formatoDelTexto = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
        def fechaInicial=params.fechaInicio+" 00:00:00"
        def fechaFinal=params.fechaFin+" 23:59:59"
        def usuario=Usuario.get( springSecurityService.currentUser?.id)
        def unidadDeUsuario=UsuarioUnidadAdministrativa.findByUsuario(usuario)
        def encuesta=EncuestaDelArea.findByUnidad(unidadDeUsuario?.unidad)
        def preguntas=PreguntasDeEncuesta.executeQuery("from PreguntasDeEncuesta p where p.encuesta=:encuesta order by p.rubro, p.id", [encuesta:encuesta])//findAllByEncuesta(encuesta, [sort:'rubro', order:'asc'])
        myLog.info "encuestaDelArea: " + encuesta
        def encuestas=ValorDePregunta.executeQuery("from ValorDePregunta v where v.fecha>=:fechaInicio and v.fecha<=:fechaFin and v.pregunta.encuesta=:encuesta order by v.caso",[fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal), encuesta:encuesta] )
        def numeroDeEncuestas=ValorDePregunta.executeQuery("select distinct(v.caso) from ValorDePregunta v where v.fecha>=:fechaInicio and v.fecha<=:fechaFin and v.pregunta.encuesta=:encuesta",[fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal), encuesta:encuesta] )
        def observaciones=ObservacionesDeEncuesta.executeQuery(" from ObservacionesDeEncuesta o where o.fecha>=:fechaInicio  and o.fecha<=:fechaFin and o.unidad=:encuesta",[fechaInicio:formatoDelTexto.parse(fechaInicial), fechaFin:formatoDelTexto.parse(fechaFinal), encuesta:encuesta] )
        myLog.info "encuestasConstestadas: " + encuestas?.size()
        myLog.info "observaciones: " +  observaciones
        preguntas.each{pregunta->
                def mapa=[:]
                def promedio=0
                encuestas.each{encuestaResuelta->
                            if(encuestaResuelta?.pregunta==pregunta){
                                    myLog.info " pregunta: " +  pregunta + " : " + encuestaResuelta?.valor + " [ caso : " + encuestaResuelta?.caso?.id +" ]"
                                    promedio+=encuestaResuelta?.valor
                                }                            
                        }
                    myLog.info "promedioPregunta: " + pregunta + " _ " + promedio
                    mapa.pregunta=pregunta
                    mapa.suma=promedio
                    mapa.promedio=(promedio / numeroDeEncuestas?.size())
                    listaDePromedios.add(mapa)
                }
        [encuestas:encuestas, preguntas:preguntas, numeroDeEncuestas:numeroDeEncuestas.sort{it?.id}, listaDePromedios:listaDePromedios, fechaFin:params.fechaFin, fechaInicial:params.fechaInicio, unidadDeUsuario:unidadDeUsuario, observaciones:observaciones]
    }
    
    
}

