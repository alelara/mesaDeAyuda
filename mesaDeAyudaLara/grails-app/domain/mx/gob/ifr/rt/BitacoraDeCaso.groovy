package mx.gob.ifr.rt

class BitacoraDeCaso {

    int casoId
    Date fecha
    String movimiento
    String diagnostico
    String solucion
    int usuarioId
    
    static constraints = {
        diagnostico(nullable:true, maxSize:1000)
        solucion(nullable:true, maxSize:1000)
        usuarioId(nullable:false)
    }
            
    static mapping = {
        id generator : 'sequence', column : 'id_bitacora_de_caso', params:[sequence:'bitacora_de_caso_id_seq']
    }
    
     String toString(){
         return casoId
    }
    
}
