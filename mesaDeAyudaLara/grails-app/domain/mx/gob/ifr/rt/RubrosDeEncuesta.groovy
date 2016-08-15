package mx.gob.ifr.rt

class RubrosDeEncuesta {

    EncuestaDelArea encuesta
    String rubro
    
    static constraints = {
    }
    
    static mapping = {
        id generator : 'sequence', column : 'id_rubro', params:[sequence:'rubro_encuesta_id_seq']
    }
    
     String toString(){
        return rubro
    }
}
