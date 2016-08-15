package mx.gob.ifr.rt

class Caso {

    Usuario creador
    Date fechaDeCreacion
    EstadoDelCaso estado
    Usuario propietarioActual
    String descripcionDelProblema        
    String diagnostico
    String solucion
    Date fechaDeDiagnostico
    Date fechaDeSolucion
    //CategoriaDelProblema categoria
    Date fechaDeCierre
    Usuario responsable
    TipoDeCaso tipoDeCaso
    boolean encuestaResuelta=false
    
    static constraints = {
        descripcionDelProblema(nullable:false, maxSize:256)
        diagnostico(nullable:true)
        solucion(nullable:true)
        fechaDeDiagnostico(nullable:true)
        fechaDeSolucion(nullable:true)
        fechaDeCierre(nullable:true)
        responsable(nullable:true)
    }
    
    
    static mapping = {
        id generator : 'sequence', column : 'id_caso', params:[sequence:'caso_id_seq']
    }
    
     String toString(){
        return descripcionDelProblema
    }
    
}
