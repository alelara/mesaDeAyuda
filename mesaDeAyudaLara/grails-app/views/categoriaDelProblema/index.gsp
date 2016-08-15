
<%@ page import="mx.gob.ifr.rt.CategoriaDelProblema" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'categoriaDelProblema.label', default: 'CategoriaDelProblema')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-categoriaDelProblema" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-categoriaDelProblema" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'categoriaDelProblema.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'categoriaDelProblema.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="activo" title="${message(code: 'categoriaDelProblema.activo.label', default: 'Activo')}" />
					
						<th><g:message code="categoriaDelProblema.prioridad.label" default="Prioridad" /></th>
					
						<th><g:message code="categoriaDelProblema.unidadAdministrativaResponsable.label" default="Unidad Administrativa Responsable" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${categoriaDelProblemaInstanceList}" status="i" var="categoriaDelProblemaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${categoriaDelProblemaInstance.id}">${fieldValue(bean: categoriaDelProblemaInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: categoriaDelProblemaInstance, field: "descripcion")}</td>
					
						<td><g:formatBoolean boolean="${categoriaDelProblemaInstance.activo}" /></td>
					
						<td>${fieldValue(bean: categoriaDelProblemaInstance, field: "prioridad")}</td>
					
						<td>${fieldValue(bean: categoriaDelProblemaInstance, field: "unidadAdministrativaResponsable")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${categoriaDelProblemaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
