package mx.gob.ifr.rt



import grails.test.mixin.*
import spock.lang.*

@TestFor(DatosRequeridosController)
@Mock(DatosRequeridos)
class DatosRequeridosControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.datosRequeridosInstanceList
            model.datosRequeridosInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.datosRequeridosInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def datosRequeridos = new DatosRequeridos()
            datosRequeridos.validate()
            controller.save(datosRequeridos)

        then:"The create view is rendered again with the correct model"
            model.datosRequeridosInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            datosRequeridos = new DatosRequeridos(params)

            controller.save(datosRequeridos)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/datosRequeridos/show/1'
            controller.flash.message != null
            DatosRequeridos.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def datosRequeridos = new DatosRequeridos(params)
            controller.show(datosRequeridos)

        then:"A model is populated containing the domain instance"
            model.datosRequeridosInstance == datosRequeridos
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def datosRequeridos = new DatosRequeridos(params)
            controller.edit(datosRequeridos)

        then:"A model is populated containing the domain instance"
            model.datosRequeridosInstance == datosRequeridos
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/datosRequeridos/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def datosRequeridos = new DatosRequeridos()
            datosRequeridos.validate()
            controller.update(datosRequeridos)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.datosRequeridosInstance == datosRequeridos

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            datosRequeridos = new DatosRequeridos(params).save(flush: true)
            controller.update(datosRequeridos)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/datosRequeridos/show/$datosRequeridos.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/datosRequeridos/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def datosRequeridos = new DatosRequeridos(params).save(flush: true)

        then:"It exists"
            DatosRequeridos.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(datosRequeridos)

        then:"The instance is deleted"
            DatosRequeridos.count() == 0
            response.redirectedUrl == '/datosRequeridos/index'
            flash.message != null
    }
}
