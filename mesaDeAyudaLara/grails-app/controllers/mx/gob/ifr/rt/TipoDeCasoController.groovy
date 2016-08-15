package mx.gob.ifr.rt



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TipoDeCasoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TipoDeCaso.list(params), model:[tipoDeCasoInstanceCount: TipoDeCaso.count()]
    }

    def show(TipoDeCaso tipoDeCasoInstance) {
        respond tipoDeCasoInstance
    }

    def create() {
        respond new TipoDeCaso(params)
    }

    @Transactional
    def save(TipoDeCaso tipoDeCasoInstance) {
        if (tipoDeCasoInstance == null) {
            notFound()
            return
        }

        if (tipoDeCasoInstance.hasErrors()) {
            respond tipoDeCasoInstance.errors, view:'create'
            return
        }

        tipoDeCasoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoDeCaso.label', default: 'TipoDeCaso'), tipoDeCasoInstance.id])
                redirect tipoDeCasoInstance
            }
            '*' { respond tipoDeCasoInstance, [status: CREATED] }
        }
    }

    def edit(TipoDeCaso tipoDeCasoInstance) {
        respond tipoDeCasoInstance
    }

    @Transactional
    def update(TipoDeCaso tipoDeCasoInstance) {
        if (tipoDeCasoInstance == null) {
            notFound()
            return
        }

        if (tipoDeCasoInstance.hasErrors()) {
            respond tipoDeCasoInstance.errors, view:'edit'
            return
        }

        tipoDeCasoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoDeCaso.label', default: 'TipoDeCaso'), tipoDeCasoInstance.id])
                redirect tipoDeCasoInstance
            }
            '*'{ respond tipoDeCasoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoDeCaso tipoDeCasoInstance) {

        if (tipoDeCasoInstance == null) {
            notFound()
            return
        }

        tipoDeCasoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoDeCaso.label', default: 'TipoDeCaso'), tipoDeCasoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoDeCaso.label', default: 'TipoDeCaso'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
