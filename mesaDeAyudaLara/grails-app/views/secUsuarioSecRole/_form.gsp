<%@ page import="mx.gob.ifr.seguridad.SecUsuarioSecRole" %>



<div class="fieldcontain ${hasErrors(bean: secUsuarioSecRoleInstance, field: 'secRole', 'error')} required">
	<label for="secRole">
		<g:message code="secUsuarioSecRole.secRole.label" default="Sec Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="secRole" name="secRole.id" from="${mx.gob.ifr.seguridad.SecRole.list()}" optionKey="id" required="" value="${secUsuarioSecRoleInstance?.secRole?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUsuarioSecRoleInstance, field: 'secUsuario', 'error')} required">
	<label for="secUsuario">
		<g:message code="secUsuarioSecRole.secUsuario.label" default="Sec Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="secUsuario" name="secUsuario.id" from="${mx.gob.ifr.seguridad.SecUsuario.list()}" optionKey="id" required="" value="${secUsuarioSecRoleInstance?.secUsuario?.id}" class="many-to-one"/>

</div>

