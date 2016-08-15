package mx.gob.ifr.rt

class CasoCategoriaDelProblema implements Serializable{

    Caso caso
    CategoriaDelProblema categoria
    static constraints = {
    }
    
    static mapping = {
    		id composite: ['caso', 'categoria'] 
                version false
    }
    
     String toString(){
        return caso
    }
}
