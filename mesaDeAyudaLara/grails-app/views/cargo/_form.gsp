<%@ page import="mx.gob.ifr.rt.Cargo" %>



<div class="fieldcontain ${hasErrors(bean: cargoInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="cargo.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${cargoInstance?.nombre}"/>

</div>

