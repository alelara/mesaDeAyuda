package  mx.gob.ifr.rt

class PrioridadDelProblema {

    String nombre
    String descripcion
    String tiempoDeResolucion
    
    static constraints = {
        nombre(nullable:false, unique:true)
        descripcion(nullable:false)
        tiempoDeResolucion(nullable:false)
    }
    
    static mapping = {
        id generator : 'sequence', column : 'id_prioridad', params:[sequence:'prioridad_del_caso_id_seq']
    }
    
     String toString(){
        return nombre
    }
    
}
