package mx.gob.ifr.rt



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EstadoDelCasoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond EstadoDelCaso.list(params), model:[estadoDelCasoInstanceCount: EstadoDelCaso.count()]
    }

    def show(EstadoDelCaso estadoDelCasoInstance) {
        respond estadoDelCasoInstance
    }

    def create() {
        respond new EstadoDelCaso(params)
    }

    @Transactional
    def save(EstadoDelCaso estadoDelCasoInstance) {
        if (estadoDelCasoInstance == null) {
            notFound()
            return
        }

        if (estadoDelCasoInstance.hasErrors()) {
            respond estadoDelCasoInstance.errors, view:'create'
            return
        }

        estadoDelCasoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'estadoDelCaso.label', default: 'EstadoDelCaso'), estadoDelCasoInstance.id])
                redirect estadoDelCasoInstance
            }
            '*' { respond estadoDelCasoInstance, [status: CREATED] }
        }
    }

    def edit(EstadoDelCaso estadoDelCasoInstance) {
        respond estadoDelCasoInstance
    }

    @Transactional
    def update(EstadoDelCaso estadoDelCasoInstance) {
        if (estadoDelCasoInstance == null) {
            notFound()
            return
        }

        if (estadoDelCasoInstance.hasErrors()) {
            respond estadoDelCasoInstance.errors, view:'edit'
            return
        }

        estadoDelCasoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'EstadoDelCaso.label', default: 'EstadoDelCaso'), estadoDelCasoInstance.id])
                redirect estadoDelCasoInstance
            }
            '*'{ respond estadoDelCasoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(EstadoDelCaso estadoDelCasoInstance) {

        if (estadoDelCasoInstance == null) {
            notFound()
            return
        }

        estadoDelCasoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'EstadoDelCaso.label', default: 'EstadoDelCaso'), estadoDelCasoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'estadoDelCaso.label', default: 'EstadoDelCaso'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
