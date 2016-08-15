package mx.gob.ifr.rt



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DatosRequeridosController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DatosRequeridos.list(params), model:[datosRequeridosInstanceCount: DatosRequeridos.count()]
    }

    def show(DatosRequeridos datosRequeridosInstance) {
        respond datosRequeridosInstance
    }

    def create() {
        respond new DatosRequeridos(params)
    }

    @Transactional
    def save(DatosRequeridos datosRequeridosInstance) {
        if (datosRequeridosInstance == null) {
            notFound()
            return
        }

        if (datosRequeridosInstance.hasErrors()) {
            respond datosRequeridosInstance.errors, view:'create'
            return
        }

        datosRequeridosInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'datosRequeridos.label', default: 'DatosRequeridos'), datosRequeridosInstance.id])
                redirect datosRequeridosInstance
            }
            '*' { respond datosRequeridosInstance, [status: CREATED] }
        }
    }

    def edit(DatosRequeridos datosRequeridosInstance) {
        respond datosRequeridosInstance
    }

    @Transactional
    def update(DatosRequeridos datosRequeridosInstance) {
        if (datosRequeridosInstance == null) {
            notFound()
            return
        }

        if (datosRequeridosInstance.hasErrors()) {
            respond datosRequeridosInstance.errors, view:'edit'
            return
        }

        datosRequeridosInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DatosRequeridos.label', default: 'DatosRequeridos'), datosRequeridosInstance.id])
                redirect datosRequeridosInstance
            }
            '*'{ respond datosRequeridosInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DatosRequeridos datosRequeridosInstance) {

        if (datosRequeridosInstance == null) {
            notFound()
            return
        }

        datosRequeridosInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DatosRequeridos.label', default: 'DatosRequeridos'), datosRequeridosInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'datosRequeridos.label', default: 'DatosRequeridos'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
