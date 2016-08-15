package mx.gob.ifr.tareas
import mx.gob.mx.rt.tareas.TareasAutomatizadasService
class CerrarCasosJob {

    def tareasAutomatizadasService
    
    static triggers = {
        cron name:'cronCerrarCasosJob', startDelay:10000, cronExpression: '0 50 10 ? * MON-FRI'
    }

    def execute() {
        println "---------------------------------------------------------------------------------------------------"
        println "[JOB]Iniciando el cierre de casos posterior a 5 dias sin movimiento alguno"
        tareasAutomatizadasService.cierreDeCasosAtendidos()
        println "---------------------------------------------------------------------------------------------------"
    }
}

