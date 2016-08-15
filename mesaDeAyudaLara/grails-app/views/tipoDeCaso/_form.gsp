<%@ page import="mx.gob.ifr.rt.TipoDeCaso" %>



<div class="fieldcontain ${hasErrors(bean: tipoDeCasoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="tipoDeCaso.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${tipoDeCasoInstance?.nombre}"/>

</div>

