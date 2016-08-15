package mx.gob.ifr.rt

class TopicoDeImpresoras {

    String marca
    String modelo
    String tipo
    
    static constraints = {
        marca(nullable:false)
        modelo(nullable:false)
    }
    
        static mapping = {
        id generator : 'sequence', column : 'id_impresora', params:[sequence:'topico_impresora_id_seq']
    }
    
     String toString(){
        return tipo + "-" + marca+"-"+modelo
    }
}
