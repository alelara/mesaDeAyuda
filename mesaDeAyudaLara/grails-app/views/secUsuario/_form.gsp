<%@ page import="mx.gob.ifr.seguridad.SecUsuario" %>



<div class="fieldcontain ${hasErrors(bean: secUsuarioInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="secUsuario.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${secUsuarioInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUsuarioInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="secUsuario.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${secUsuarioInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secUsuarioInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="secUsuario.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${secUsuarioInstance?.accountExpired}" />

</div>

<div class="fieldcontain ${hasErrors(bean: secUsuarioInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="secUsuario.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${secUsuarioInstance?.accountLocked}" />

</div>

<div class="fieldcontain ${hasErrors(bean: secUsuarioInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="secUsuario.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${secUsuarioInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: secUsuarioInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="secUsuario.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${secUsuarioInstance?.passwordExpired}" />

</div>

