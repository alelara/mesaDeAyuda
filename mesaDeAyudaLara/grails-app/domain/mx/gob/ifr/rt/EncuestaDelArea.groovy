package mx.gob.ifr.rt

class EncuestaDelArea {

    UnidadAdministrativa unidad
    String nombre
    static constraints = {
    }  
    
    static mapping = {
        id generator : 'sequence', column : 'id_encuesta_unidad', params:[sequence:'encuesta_de_area_id_seq']
    }
    
     String toString(){
        return nombre
    }
}
