package mx.gob.ifr.rt

class Encuesta {

    Date fecha
    int facilidadDeUso
    int tiemposDeRespuesta
    int disponibilidad
    int satisfaccion
    int estadoDelEquipo
    int estadoDeCableado
    int velocidad
    int rapidez
    int amabilidad
    int resolucion
    int claridad
    Caso caso
    boolean contestadaPorSistema
    String observaciones
    static constraints = {
        observaciones(nullable:true)
    }
     
    static mapping = {
        id generator : 'sequence', column : 'id_encuesta', params:[sequence:'encuesta_id_seq']
    }
    
     String toString(){
        return caso
    }
    
}
