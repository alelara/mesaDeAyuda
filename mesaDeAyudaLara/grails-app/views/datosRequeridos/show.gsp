
<%@ page import="mx.gob.ifr.rt.DatosRequeridos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'datosRequeridos.label', default: 'DatosRequeridos')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-datosRequeridos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-datosRequeridos" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list datosRequeridos">
			
				<g:if test="${datosRequeridosInstance?.nombreCampo}">
				<li class="fieldcontain">
					<span id="nombreCampo-label" class="property-label"><g:message code="datosRequeridos.nombreCampo.label" default="Nombre Campo" /></span>
					
						<span class="property-value" aria-labelledby="nombreCampo-label"><g:fieldValue bean="${datosRequeridosInstance}" field="nombreCampo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${datosRequeridosInstance?.tipoDeDato}">
				<li class="fieldcontain">
					<span id="tipoDeDato-label" class="property-label"><g:message code="datosRequeridos.tipoDeDato.label" default="Tipo De Dato" /></span>
					
						<span class="property-value" aria-labelledby="tipoDeDato-label"><g:fieldValue bean="${datosRequeridosInstance}" field="tipoDeDato"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${datosRequeridosInstance?.activo}">
				<li class="fieldcontain">
					<span id="activo-label" class="property-label"><g:message code="datosRequeridos.activo.label" default="Activo" /></span>
					
						<span class="property-value" aria-labelledby="activo-label"><g:formatBoolean boolean="${datosRequeridosInstance?.activo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${datosRequeridosInstance?.categoria}">
				<li class="fieldcontain">
					<span id="categoria-label" class="property-label"><g:message code="datosRequeridos.categoria.label" default="Categoria" /></span>
					
						<span class="property-value" aria-labelledby="categoria-label"><g:link controller="categoriaDelProblema" action="show" id="${datosRequeridosInstance?.categoria?.id}">${datosRequeridosInstance?.categoria?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${datosRequeridosInstance?.obligatorio}">
				<li class="fieldcontain">
					<span id="obligatorio-label" class="property-label"><g:message code="datosRequeridos.obligatorio.label" default="Obligatorio" /></span>
					
						<span class="property-value" aria-labelledby="obligatorio-label"><g:formatBoolean boolean="${datosRequeridosInstance?.obligatorio}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:datosRequeridosInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${datosRequeridosInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
