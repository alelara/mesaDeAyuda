package mx.gob.ifr.rt

class PreguntasDeEncuesta {

    EncuestaDelArea encuesta
    String pregunta
    boolean activo=true
    RubrosDeEncuesta rubro
    
    static constraints = {
    }
    
    static mapping = {
        id generator : 'sequence', column : 'id_pregunta_encuesta', params:[sequence:'pregunta_encuesta_id_seq']
    }
    
     String toString(){
        return pregunta
    }
}
