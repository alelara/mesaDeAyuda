<%@ page import="mx.gob.ifr.rt.UsuarioUnidadAdministrativa" %>



<div class="fieldcontain ${hasErrors(bean: usuarioUnidadAdministrativaInstance, field: 'unidad', 'error')} required">
	<label for="unidad">
		<g:message code="usuarioUnidadAdministrativa.unidad.label" default="Unidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="unidad" name="unidad.id" from="${mx.gob.ifr.rt.UnidadAdministrativa.list()}" optionKey="id" required="" value="${usuarioUnidadAdministrativaInstance?.unidad?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: usuarioUnidadAdministrativaInstance, field: 'usuario', 'error')} required">
	<label for="usuario">
		<g:message code="usuarioUnidadAdministrativa.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${mx.gob.ifr.rt.Usuario.list()}" optionKey="id" required="" value="${usuarioUnidadAdministrativaInstance?.usuario?.id}" class="many-to-one"/>

</div>

