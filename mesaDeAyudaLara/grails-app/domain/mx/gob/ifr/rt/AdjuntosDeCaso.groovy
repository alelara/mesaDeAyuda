package mx.gob.ifr.rt

class AdjuntosDeCaso {

    String nombreDelAdjunto
    String rutaDelAdjunto
    Caso caso 
    Date fecha
    
    static constraints = {
        nombreDelAdjunto(nullable:false, maxSize:520)
        rutaDelAdjunto(nullable:false, maxSize:520)
    }
        
    static mapping = {
        id generator : 'sequence', column : 'id_adjunto', params:[sequence:'adjunto_de_caso_id_seq']
    }
    
     String toString(){
         return nombreDelAdjunto
    }
    
}
