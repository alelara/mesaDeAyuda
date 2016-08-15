package mx.gob.ifr.rt

class ConfiguracionDeMesaDeAyuda {

    int diaDeInicioEstadistica
    int diaDeFinEstadistica
    int diasParaCierreDeCasos
    String fundamentoDeCierre
    int diasParaCierreDeEncuestas
    String urlServidor
    
    static constraints = {
        diaDeInicioEstadistica(nullable:false)
        diaDeFinEstadistica(nullable:false)
        diaDeInicioEstadistica(nullable:false)
        fundamentoDeCierre(nullable:false, maxSize:1200)
    }   
    
    static mapping = {
        id generator : 'sequence', column : 'id_configuracion', params:[sequence:'configuracion_mesa_ayuda_id_seq']
    }
    
     String toString(){
        return diasParaCierreDeCasos
    }
    
}
