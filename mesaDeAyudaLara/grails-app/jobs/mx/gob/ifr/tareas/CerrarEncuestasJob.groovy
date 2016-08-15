package mx.gob.ifr.tareas
import mx.gob.mx.rt.tareas.TareasAutomatizadasService
class CerrarEncuestasJob {

    def tareasAutomatizadasService
    
    static triggers = {
        cron name:'cronCerrarEncuestasJob', startDelay:10000, cronExpression: '0 59 13 ? * MON-FRI'
    }

    def execute() {
        println "---------------------------------------------------------------------------------------------------"
        println "[JOB]Iniciando el cierre de encuestas posterior a 30 dias sin movimiento alguno"
        tareasAutomatizadasService.cierreDeEncuestas()
        println "---------------------------------------------------------------------------------------------------"
    }
}

