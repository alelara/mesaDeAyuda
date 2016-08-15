package mx.gob.ifr.rt

class Comentario {

    Date fechaDeComentario
    Caso caso
    Usuario usuario
    String textoComentario
    
    static constraints = {
        textoComentario(nullable:false, maxSize:1000)
    }    
        
    static mapping = {
        id generator : 'sequence', column : 'id_comentario', params:[sequence:'comentario_id_seq']
    }
    
     String toString(){
         return usuario + " : " + textoComentario
    }
}
