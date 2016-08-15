package mx.gob.ifr.rt



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UsuarioUnidadAdministrativaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UsuarioUnidadAdministrativa.list(params), model:[usuarioUnidadAdministrativaInstanceCount: UsuarioUnidadAdministrativa.count()]
    }

    def show(UsuarioUnidadAdministrativa usuarioUnidadAdministrativaInstance) {
        respond usuarioUnidadAdministrativaInstance
    }

    def create() {
        respond new UsuarioUnidadAdministrativa(params)
    }

    @Transactional
    def save(UsuarioUnidadAdministrativa usuarioUnidadAdministrativaInstance) {
        if (usuarioUnidadAdministrativaInstance == null) {
            notFound()
            return
        }

        if (usuarioUnidadAdministrativaInstance.hasErrors()) {
            respond usuarioUnidadAdministrativaInstance.errors, view:'create'
            return
        }

        usuarioUnidadAdministrativaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'usuarioUnidadAdministrativa.label', default: 'UsuarioUnidadAdministrativa'), usuarioUnidadAdministrativaInstance.id])
                redirect usuarioUnidadAdministrativaInstance
            }
            '*' { respond usuarioUnidadAdministrativaInstance, [status: CREATED] }
        }
    }

    def edit(UsuarioUnidadAdministrativa usuarioUnidadAdministrativaInstance) {
        respond usuarioUnidadAdministrativaInstance
    }

    @Transactional
    def update(UsuarioUnidadAdministrativa usuarioUnidadAdministrativaInstance) {
        if (usuarioUnidadAdministrativaInstance == null) {
            notFound()
            return
        }

        if (usuarioUnidadAdministrativaInstance.hasErrors()) {
            respond usuarioUnidadAdministrativaInstance.errors, view:'edit'
            return
        }

        usuarioUnidadAdministrativaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UsuarioUnidadAdministrativa.label', default: 'UsuarioUnidadAdministrativa'), usuarioUnidadAdministrativaInstance.id])
                redirect usuarioUnidadAdministrativaInstance
            }
            '*'{ respond usuarioUnidadAdministrativaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UsuarioUnidadAdministrativa usuarioUnidadAdministrativaInstance) {

        if (usuarioUnidadAdministrativaInstance == null) {
            notFound()
            return
        }

        usuarioUnidadAdministrativaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UsuarioUnidadAdministrativa.label', default: 'UsuarioUnidadAdministrativa'), usuarioUnidadAdministrativaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuarioUnidadAdministrativa.label', default: 'UsuarioUnidadAdministrativa'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
