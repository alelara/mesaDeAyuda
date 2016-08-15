package mx.gob.ifr.seguridad



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SecUsuarioSecRoleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SecUsuarioSecRole.list(params), model:[secUsuarioSecRoleInstanceCount: SecUsuarioSecRole.count()]
    }

    def show(SecUsuarioSecRole secUsuarioSecRoleInstance) {
        respond secUsuarioSecRoleInstance
    }

    def create() {
        respond new SecUsuarioSecRole(params)
    }

    @Transactional
    def save(SecUsuarioSecRole secUsuarioSecRoleInstance) {
        if (secUsuarioSecRoleInstance == null) {
            notFound()
            return
        }

        if (secUsuarioSecRoleInstance.hasErrors()) {
            respond secUsuarioSecRoleInstance.errors, view:'create'
            return
        }

        secUsuarioSecRoleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'secUsuarioSecRole.label', default: 'SecUsuarioSecRole'), secUsuarioSecRoleInstance.id])
                redirect secUsuarioSecRoleInstance
            }
            '*' { respond secUsuarioSecRoleInstance, [status: CREATED] }
        }
    }

    def edit(SecUsuarioSecRole secUsuarioSecRoleInstance) {
        respond secUsuarioSecRoleInstance
    }

    @Transactional
    def update(SecUsuarioSecRole secUsuarioSecRoleInstance) {
        if (secUsuarioSecRoleInstance == null) {
            notFound()
            return
        }

        if (secUsuarioSecRoleInstance.hasErrors()) {
            respond secUsuarioSecRoleInstance.errors, view:'edit'
            return
        }

        secUsuarioSecRoleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SecUsuarioSecRole.label', default: 'SecUsuarioSecRole'), secUsuarioSecRoleInstance.id])
                redirect secUsuarioSecRoleInstance
            }
            '*'{ respond secUsuarioSecRoleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SecUsuarioSecRole secUsuarioSecRoleInstance) {

        if (secUsuarioSecRoleInstance == null) {
            notFound()
            return
        }

        secUsuarioSecRoleInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SecUsuarioSecRole.label', default: 'SecUsuarioSecRole'), secUsuarioSecRoleInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'secUsuarioSecRole.label', default: 'SecUsuarioSecRole'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
