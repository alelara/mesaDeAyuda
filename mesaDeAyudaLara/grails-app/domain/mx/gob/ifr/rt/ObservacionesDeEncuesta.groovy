package mx.gob.ifr.rt

class ObservacionesDeEncuesta {

    EncuestaDelArea unidad
    Caso caso
    Date fecha
    String observacion
    
    static constraints = {
        observacion(nullable:true)
    }    
    static mapping = {
        id generator : 'sequence', column : 'id_observacion', params:[sequence:'observaciones_encuesta_id_seq']
    }
    
     String toString(){
        return observacion
    }
}
