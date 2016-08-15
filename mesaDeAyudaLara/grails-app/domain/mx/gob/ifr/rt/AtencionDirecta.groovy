package mx.gob.ifr.rt

class AtencionDirecta {

    
    String tipoDeAtencion
    String telefono
    String idTeamViewer
    String sitio
    Date fechaDeAtencion
    String descrpcionDelProblema
    CategoriaDelProblema categoria
    Usuario usuarioDeAtencion
    String usuarioQueSeAtiende
    UnidadAdministrativa unidad
    
    static constraints = {
        telefono(nullable:true)
        idTeamViewer(nullable:true)
        sitio(nullable:true)
        descrpcionDelProblema(nullable:true, maxSize:1200)        
    }
    
    static mapping = {
        id generator : 'sequence', column : 'id_atencion_directa', params:[sequence:'atencion_directa_id_seq']
    }
    
     String toString(){
         return tipoDeAtencion
    }
}
