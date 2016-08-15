package mx.gob.ifr.rt



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UnidadAdministrativaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UnidadAdministrativa.list(params), model:[unidadAdministrativaInstanceCount: UnidadAdministrativa.count()]
    }

    def show(UnidadAdministrativa unidadAdministrativaInstance) {
        respond unidadAdministrativaInstance
    }

    def create() {
        respond new UnidadAdministrativa(params)
    }

    @Transactional
    def save(UnidadAdministrativa unidadAdministrativaInstance) {
        if (unidadAdministrativaInstance == null) {
            notFound()
            return
        }

        if (unidadAdministrativaInstance.hasErrors()) {
            respond unidadAdministrativaInstance.errors, view:'create'
            return
        }

        unidadAdministrativaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'unidadAdministrativa.label', default: 'UnidadAdministrativa'), unidadAdministrativaInstance.id])
                redirect unidadAdministrativaInstance
            }
            '*' { respond unidadAdministrativaInstance, [status: CREATED] }
        }
    }

    def edit(UnidadAdministrativa unidadAdministrativaInstance) {
        respond unidadAdministrativaInstance
    }

    @Transactional
    def update(UnidadAdministrativa unidadAdministrativaInstance) {
        if (unidadAdministrativaInstance == null) {
            notFound()
            return
        }

        if (unidadAdministrativaInstance.hasErrors()) {
            respond unidadAdministrativaInstance.errors, view:'edit'
            return
        }

        unidadAdministrativaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UnidadAdministrativa.label', default: 'UnidadAdministrativa'), unidadAdministrativaInstance.id])
                redirect unidadAdministrativaInstance
            }
            '*'{ respond unidadAdministrativaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UnidadAdministrativa unidadAdministrativaInstance) {

        if (unidadAdministrativaInstance == null) {
            notFound()
            return
        }

        unidadAdministrativaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UnidadAdministrativa.label', default: 'UnidadAdministrativa'), unidadAdministrativaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'unidadAdministrativa.label', default: 'UnidadAdministrativa'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
