
<%@ page import="mx.gob.ifr.rt.CategoriaDelProblema" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'categoriaDelProblema.label', default: 'CategoriaDelProblema')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-categoriaDelProblema" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-categoriaDelProblema" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list categoriaDelProblema">
			
				<g:if test="${categoriaDelProblemaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="categoriaDelProblema.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${categoriaDelProblemaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${categoriaDelProblemaInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="categoriaDelProblema.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${categoriaDelProblemaInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${categoriaDelProblemaInstance?.activo}">
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="categoriaDelProblema.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label"><g:formatBoolean boolean="${categoriaDelProblemaInstance?.activo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${categoriaDelProblemaInstance?.prioridad}">
				<li class="fieldcontain">
					<span id="prioridad-label" class="property-label"><g:message code="categoriaDelProblema.prioridad.label" default="Prioridad" /></span>
					
						<span class="property-value" aria-labelledby="prioridad-label"><g:link controller="prioridadDelProblema" action="show" id="${categoriaDelProblemaInstance?.prioridad?.id}">${categoriaDelProblemaInstance?.prioridad?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${categoriaDelProblemaInstance?.unidadAdministrativaResponsable}">
				<li class="fieldcontain">
					<span id="unidadAdministrativaResponsable-label" class="property-label"><g:message code="categoriaDelProblema.unidadAdministrativaResponsable.label" default="Unidad Administrativa Responsable" /></span>
					
						<span class="property-value" aria-labelledby="unidadAdministrativaResponsable-label"><g:link controller="unidadAdministrativa" action="show" id="${categoriaDelProblemaInstance?.unidadAdministrativaResponsable?.id}">${categoriaDelProblemaInstance?.unidadAdministrativaResponsable?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:categoriaDelProblemaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${categoriaDelProblemaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
