package mx.gob.ifr.rt



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CategoriaDelProblemaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond CategoriaDelProblema.list(params), model:[categoriaDelProblemaInstanceCount: CategoriaDelProblema.count()]
    }

    def show(CategoriaDelProblema categoriaDelProblemaInstance) {
        respond categoriaDelProblemaInstance
    }

    def create() {
        respond new CategoriaDelProblema(params)
    }

    @Transactional
    def save(CategoriaDelProblema categoriaDelProblemaInstance) {
        if (categoriaDelProblemaInstance == null) {
            notFound()
            return
        }

        if (categoriaDelProblemaInstance.hasErrors()) {
            respond categoriaDelProblemaInstance.errors, view:'create'
            return
        }

        categoriaDelProblemaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'categoriaDelProblema.label', default: 'CategoriaDelProblema'), categoriaDelProblemaInstance.id])
                redirect categoriaDelProblemaInstance
            }
            '*' { respond categoriaDelProblemaInstance, [status: CREATED] }
        }
    }

    def edit(CategoriaDelProblema categoriaDelProblemaInstance) {
        respond categoriaDelProblemaInstance
    }

    @Transactional
    def update(CategoriaDelProblema categoriaDelProblemaInstance) {
        if (categoriaDelProblemaInstance == null) {
            notFound()
            return
        }

        if (categoriaDelProblemaInstance.hasErrors()) {
            respond categoriaDelProblemaInstance.errors, view:'edit'
            return
        }

        categoriaDelProblemaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'CategoriaDelProblema.label', default: 'CategoriaDelProblema'), categoriaDelProblemaInstance.id])
                redirect categoriaDelProblemaInstance
            }
            '*'{ respond categoriaDelProblemaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(CategoriaDelProblema categoriaDelProblemaInstance) {

        if (categoriaDelProblemaInstance == null) {
            notFound()
            return
        }

        categoriaDelProblemaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'CategoriaDelProblema.label', default: 'CategoriaDelProblema'), categoriaDelProblemaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'categoriaDelProblema.label', default: 'CategoriaDelProblema'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
