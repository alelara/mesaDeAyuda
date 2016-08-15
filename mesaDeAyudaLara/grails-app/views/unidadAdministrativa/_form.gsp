<%@ page import="mx.gob.ifr.rt.UnidadAdministrativa" %>



<div class="fieldcontain ${hasErrors(bean: unidadAdministrativaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="unidadAdministrativa.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${unidadAdministrativaInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: unidadAdministrativaInstance, field: 'tipo', 'error')} ">
	<label for="tipo">
		<g:message code="unidadAdministrativa.tipo.label" default="Tipo" />
		
	</label>
	<g:textField name="tipo" value="${unidadAdministrativaInstance?.tipo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: unidadAdministrativaInstance, field: 'clave', 'error')} ">
	<label for="clave">
		<g:message code="unidadAdministrativa.clave.label" default="Clave" />
		
	</label>
	<g:textField name="clave" value="${unidadAdministrativaInstance?.clave}"/>

</div>

