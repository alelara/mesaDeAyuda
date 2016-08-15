package mx.gob.ifr.rt

class DatosRequeridos {

    String nombreCampo
    String tipoDeDato
    boolean obligatorio
    boolean activo=true
    CategoriaDelProblema categoria
        
    static constraints = {
        nombreCampo(nullable:false)
        tipoDeDato(nullable:false, inList:['int', 'varchar', 'linea', 'correo', 'impresora'])
    }
    
        static mapping = {
        id generator : 'sequence', column : 'id_dato_requerido', params:[sequence:'dato_requerido_id_seq']
    }
    
     String toString(){
         return nombreCampo
    }
}
