package mx.gob.ifr.rt

class EstadoDelCaso {
    
    String nombre

    static constraints = {
        nombre(nullable:false, unique:true)
    }
    
        
    static mapping = {
        id generator : 'sequence', column : 'id_estado_del_caso', params:[sequence:'estado_del_caso_id_seq']
    }
    
     String toString(){
        return nombre
    }
    
}
