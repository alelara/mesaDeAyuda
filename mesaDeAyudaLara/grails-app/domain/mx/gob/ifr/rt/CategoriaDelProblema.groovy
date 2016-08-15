package mx.gob.ifr.rt

class CategoriaDelProblema {

    String nombre
    String descripcion
    UnidadAdministrativa unidadAdministrativaResponsable
    PrioridadDelProblema prioridad
    boolean activo=true
    
    static constraints = {
        nombre(nullable:false, unique:true)
        descripcion(nullable:false)
    }
    
    static mapping = {
        id generator : 'sequence', column : 'id_categoria', params:[sequence:'categoria_del_problema_id_seq']
    }
    
     String toString(){
        return nombre
    }
}
