package mx.gob.ifr.rt



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PrioridadDelProblemaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PrioridadDelProblema.list(params), model:[prioridadDelProblemaInstanceCount: PrioridadDelProblema.count()]
    }

    def show(PrioridadDelProblema prioridadDelProblemaInstance) {
        respond prioridadDelProblemaInstance
    }

    def create() {
        respond new PrioridadDelProblema(params)
    }

    @Transactional
    def save(PrioridadDelProblema prioridadDelProblemaInstance) {
        if (prioridadDelProblemaInstance == null) {
            notFound()
            return
        }

        if (prioridadDelProblemaInstance.hasErrors()) {
            respond prioridadDelProblemaInstance.errors, view:'create'
            return
        }

        prioridadDelProblemaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'prioridadDelProblema.label', default: 'PrioridadDelProblema'), prioridadDelProblemaInstance.id])
                redirect prioridadDelProblemaInstance
            }
            '*' { respond prioridadDelProblemaInstance, [status: CREATED] }
        }
    }

    def edit(PrioridadDelProblema prioridadDelProblemaInstance) {
        respond prioridadDelProblemaInstance
    }

    @Transactional
    def update(PrioridadDelProblema prioridadDelProblemaInstance) {
        if (prioridadDelProblemaInstance == null) {
            notFound()
            return
        }

        if (prioridadDelProblemaInstance.hasErrors()) {
            respond prioridadDelProblemaInstance.errors, view:'edit'
            return
        }

        prioridadDelProblemaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PrioridadDelProblema.label', default: 'PrioridadDelProblema'), prioridadDelProblemaInstance.id])
                redirect prioridadDelProblemaInstance
            }
            '*'{ respond prioridadDelProblemaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PrioridadDelProblema prioridadDelProblemaInstance) {

        if (prioridadDelProblemaInstance == null) {
            notFound()
            return
        }

        prioridadDelProblemaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PrioridadDelProblema.label', default: 'PrioridadDelProblema'), prioridadDelProblemaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'prioridadDelProblema.label', default: 'PrioridadDelProblema'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
