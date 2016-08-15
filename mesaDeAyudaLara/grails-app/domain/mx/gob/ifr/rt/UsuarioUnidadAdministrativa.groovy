package mx.gob.ifr.rt

class UsuarioUnidadAdministrativa implements Serializable{

    Usuario usuario
    UnidadAdministrativa unidad
    
    static constraints = {
    }
    
    static mapping = {
    		id composite: ['usuario', 'unidad'] 
                version false
    }
    
     String toString(){
        return usuario
    }
}
