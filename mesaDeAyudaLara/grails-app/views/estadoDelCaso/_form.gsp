<%@ page import="mx.gob.ifr.rt.EstadoDelCaso" %>



<div class="fieldcontain ${hasErrors(bean: estadoDelCasoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="estadoDelCaso.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${estadoDelCasoInstance?.nombre}"/>

</div>

