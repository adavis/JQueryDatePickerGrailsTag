package jquerydatepickertag

class DatesTestController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [datesTestInstanceList: DatesTest.list(params), datesTestInstanceTotal: DatesTest.count()]
    }

    def create = {
        def datesTestInstance = new DatesTest()
        datesTestInstance.properties = params
        return [datesTestInstance: datesTestInstance]
    }

    def save = {
        def datesTestInstance = new DatesTest(params)
        if (datesTestInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'datesTest.label', default: 'DatesTest'), datesTestInstance.id])}"
            redirect(action: "show", id: datesTestInstance.id)
        }
        else {
            render(view: "create", model: [datesTestInstance: datesTestInstance])
        }
    }

    def show = {
        def datesTestInstance = DatesTest.get(params.id)
        if (!datesTestInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'datesTest.label', default: 'DatesTest'), params.id])}"
            redirect(action: "list")
        }
        else {
            [datesTestInstance: datesTestInstance]
        }
    }

    def edit = {
        def datesTestInstance = DatesTest.get(params.id)
        if (!datesTestInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'datesTest.label', default: 'DatesTest'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [datesTestInstance: datesTestInstance]
        }
    }

    def update = {
        def datesTestInstance = DatesTest.get(params.id)
        if (datesTestInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (datesTestInstance.version > version) {
                    
                    datesTestInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'datesTest.label', default: 'DatesTest')] as Object[], "Another user has updated this DatesTest while you were editing")
                    render(view: "edit", model: [datesTestInstance: datesTestInstance])
                    return
                }
            }
            datesTestInstance.properties = params
            if (!datesTestInstance.hasErrors() && datesTestInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'datesTest.label', default: 'DatesTest'), datesTestInstance.id])}"
                redirect(action: "show", id: datesTestInstance.id)
            }
            else {
                render(view: "edit", model: [datesTestInstance: datesTestInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'datesTest.label', default: 'DatesTest'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def datesTestInstance = DatesTest.get(params.id)
        if (datesTestInstance) {
            try {
                datesTestInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'datesTest.label', default: 'DatesTest'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'datesTest.label', default: 'DatesTest'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'datesTest.label', default: 'DatesTest'), params.id])}"
            redirect(action: "list")
        }
    }
}
