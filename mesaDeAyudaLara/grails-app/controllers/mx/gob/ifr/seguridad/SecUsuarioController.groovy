package mx.gob.ifr.seguridad



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SecUsuarioController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SecUsuario.list(params), model:[secUsuarioInstanceCount: SecUsuario.count()]
    }

    def show(SecUsuario secUsuarioInstance) {
        respond secUsuarioInstance
    }

    def create() {
        respond new SecUsuario(params)
    }

    @Transactional
    def save(SecUsuario secUsuarioInstance) {
        if (secUsuarioInstance == null) {
            notFound()
            return
        }

        if (secUsuarioInstance.hasErrors()) {
            respond secUsuarioInstance.errors, view:'create'
            return
        }

        secUsuarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'secUsuario.label', default: 'SecUsuario'), secUsuarioInstance.id])
                redirect secUsuarioInstance
            }
            '*' { respond secUsuarioInstance, [status: CREATED] }
        }
    }

    def edit(SecUsuario secUsuarioInstance) {
        respond secUsuarioInstance
    }

    @Transactional
    def update(SecUsuario secUsuarioInstance) {
        if (secUsuarioInstance == null) {
            notFound()
            return
        }

        if (secUsuarioInstance.hasErrors()) {
            respond secUsuarioInstance.errors, view:'edit'
            return
        }

        secUsuarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SecUsuario.label', default: 'SecUsuario'), secUsuarioInstance.id])
                redirect secUsuarioInstance
            }
            '*'{ respond secUsuarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SecUsuario secUsuarioInstance) {

        if (secUsuarioInstance == null) {
            notFound()
            return
        }

        secUsuarioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SecUsuario.label', default: 'SecUsuario'), secUsuarioInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUsuario.label', default: 'SecUsuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
