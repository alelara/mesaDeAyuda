
<%@ page import="mx.gob.ifr.rt.PrioridadDelProblema" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'prioridadDelProblema.label', default: 'PrioridadDelProblema')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-prioridadDelProblema" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-prioridadDelProblema" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list prioridadDelProblema">
			
				<g:if test="${prioridadDelProblemaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="prioridadDelProblema.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${prioridadDelProblemaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prioridadDelProblemaInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="prioridadDelProblema.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${prioridadDelProblemaInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${prioridadDelProblemaInstance?.tiempoDeResolucion}">
				<li class="fieldcontain">
					<span id="tiempoDeResolucion-label" class="property-label"><g:message code="prioridadDelProblema.tiempoDeResolucion.label" default="Tiempo De Resolucion" /></span>
					
						<span class="property-value" aria-labelledby="tiempoDeResolucion-label"><g:fieldValue bean="${prioridadDelProblemaInstance}" field="tiempoDeResolucion"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:prioridadDelProblemaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${prioridadDelProblemaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
