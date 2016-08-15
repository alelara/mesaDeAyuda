package mx.gob.ifr.rt

class ValorDatoRequerido {

    String valor
    DatosRequeridos datoRequerido
    Caso caso
    
    static constraints = {
       valor(nullable:false) 
    }
    
    static mapping = {
        id generator : 'sequence', column : 'id_valor_dato_requerido', params:[sequence:'valor_dato_requerido_id_seq']
    }
    
     String toString(){
        return valor
    } 
    
}
