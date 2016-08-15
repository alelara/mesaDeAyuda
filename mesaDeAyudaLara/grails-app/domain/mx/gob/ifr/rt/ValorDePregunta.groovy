package  mx.gob.ifr.rt

import mx.gob.ifr.rt.Caso
import mx.gob.ifr.rt.PreguntasDeEncuesta

class ValorDePregunta {

    PreguntasDeEncuesta pregunta
    int valor
    Caso caso
    Date fecha
    
    static constraints = {
    }
    
    static mapping = {
        id generator : 'sequence', column : 'id_valor_pregunta', params:[sequence:'valor_de_pregunta_id_seq']
    }
    
     String toString(){
        return pregunta
    }
}
