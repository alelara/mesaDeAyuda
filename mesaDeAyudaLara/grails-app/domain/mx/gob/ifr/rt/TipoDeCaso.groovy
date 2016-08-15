package mx.gob.ifr.rt

class TipoDeCaso {

    String nombre

    static constraints = {
        nombre(nullable:false, unique:true)
    }
    
        
    static mapping = {
        id generator : 'sequence', column : 'id_tipo_de_caso', params:[sequence:'tipo_de_caso_id_seq']
    }
    
     String toString(){
        return nombre
    }
}
