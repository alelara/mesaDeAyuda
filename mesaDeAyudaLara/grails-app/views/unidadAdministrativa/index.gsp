
<%@ page import="mx.gob.ifr.rt.UnidadAdministrativa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'unidadAdministrativa.label', default: 'UnidadAdministrativa')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-unidadAdministrativa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-unidadAdministrativa" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'unidadAdministrativa.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="tipo" title="${message(code: 'unidadAdministrativa.tipo.label', default: 'Tipo')}" />
					
						<g:sortableColumn property="clave" title="${message(code: 'unidadAdministrativa.clave.label', default: 'Clave')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${unidadAdministrativaInstanceList}" status="i" var="unidadAdministrativaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${unidadAdministrativaInstance.id}">${fieldValue(bean: unidadAdministrativaInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: unidadAdministrativaInstance, field: "tipo")}</td>
					
						<td>${fieldValue(bean: unidadAdministrativaInstance, field: "clave")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${unidadAdministrativaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
