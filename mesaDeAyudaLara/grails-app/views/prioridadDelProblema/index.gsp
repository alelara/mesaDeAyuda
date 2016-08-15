
<%@ page import="mx.gob.ifr.rt.PrioridadDelProblema" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prioridadDelProblema.label', default: 'PrioridadDelProblema')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-prioridadDelProblema" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-prioridadDelProblema" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'prioridadDelProblema.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'prioridadDelProblema.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="tiempoDeResolucion" title="${message(code: 'prioridadDelProblema.tiempoDeResolucion.label', default: 'Tiempo De Resolucion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${prioridadDelProblemaInstanceList}" status="i" var="prioridadDelProblemaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${prioridadDelProblemaInstance.id}">${fieldValue(bean: prioridadDelProblemaInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: prioridadDelProblemaInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: prioridadDelProblemaInstance, field: "tiempoDeResolucion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${prioridadDelProblemaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
