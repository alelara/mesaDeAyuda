<%@ page import="mx.gob.ifr.rt.PrioridadDelProblema" %>



<div class="fieldcontain ${hasErrors(bean: prioridadDelProblemaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="prioridadDelProblema.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${prioridadDelProblemaInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: prioridadDelProblemaInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="prioridadDelProblema.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${prioridadDelProblemaInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: prioridadDelProblemaInstance, field: 'tiempoDeResolucion', 'error')} required">
	<label for="tiempoDeResolucion">
		<g:message code="prioridadDelProblema.tiempoDeResolucion.label" default="Tiempo De Resolucion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tiempoDeResolucion" required="" value="${prioridadDelProblemaInstance?.tiempoDeResolucion}"/>

</div>

