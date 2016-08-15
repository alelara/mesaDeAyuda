package mx.gob.ifr.rt

class Cargo {

    String nombre
    
    static constraints = {
        nombre(nullable:false, unique:true)
    }
    
      static mapping = {
        id generator : 'sequence', column : 'id_cargo', params:[sequence:'cargo_id_seq']
    }
    
     String toString(){
        return nombre
    }
    
}
