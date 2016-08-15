package mx.gob.ifr.rt

import mx.gob.ifr.seguridad.SecUsuario

class Usuario extends SecUsuario{

    Cargo cargo
    String nombre
    String email
    
    static constraints = {
        nombre(nullable:false)
    }
    
    static mapping = {
        id generator : 'sequence', column : 'id_usuario', params:[sequence:'usuario_id_seq']
    }
    
     String toString(){
        return nombre
    }
}
