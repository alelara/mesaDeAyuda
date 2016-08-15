
<%@ page import="mx.gob.ifr.seguridad.SecUsuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'secUsuario.label', default: 'SecUsuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-secUsuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-secUsuario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'secUsuario.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'secUsuario.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="accountExpired" title="${message(code: 'secUsuario.accountExpired.label', default: 'Account Expired')}" />
					
						<g:sortableColumn property="accountLocked" title="${message(code: 'secUsuario.accountLocked.label', default: 'Account Locked')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'secUsuario.enabled.label', default: 'Enabled')}" />
					
						<g:sortableColumn property="passwordExpired" title="${message(code: 'secUsuario.passwordExpired.label', default: 'Password Expired')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${secUsuarioInstanceList}" status="i" var="secUsuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${secUsuarioInstance.id}">${fieldValue(bean: secUsuarioInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: secUsuarioInstance, field: "password")}</td>
					
						<td><g:formatBoolean boolean="${secUsuarioInstance.accountExpired}" /></td>
					
						<td><g:formatBoolean boolean="${secUsuarioInstance.accountLocked}" /></td>
					
						<td><g:formatBoolean boolean="${secUsuarioInstance.enabled}" /></td>
					
						<td><g:formatBoolean boolean="${secUsuarioInstance.passwordExpired}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${secUsuarioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
