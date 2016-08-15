package mx.gob.ifr.rt

class WikiCategoriaDelProbema {

    CategoriaDelProblema categoria
    String texto
    
    static constraints = {
        categoria(unique:true)
        texto(nullable:false, mazSize:5000)
    }
    
    String toString(){
        return categoria
    }
}
