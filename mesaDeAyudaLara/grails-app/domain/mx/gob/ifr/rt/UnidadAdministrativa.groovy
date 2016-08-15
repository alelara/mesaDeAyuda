package mx.gob.ifr.rt

class UnidadAdministrativa {

    String nombre
    String tipo
    String clave
    String numero
    String extension
    String correoElectronico
    
    static constraints = {
        nombre(nullable:false)
        tipo(nullable:false)
        clave(nullable:false)
        numero(nullable:true)
        extension(nullable:true)        
    }
    
    static mapping = {
        id generator : 'sequence', column : 'id_unidad_administrativa', params:[sequence:'unidad_administrativa_id_seq']
    }
    
     String toString(){
        return nombre
    }
}
