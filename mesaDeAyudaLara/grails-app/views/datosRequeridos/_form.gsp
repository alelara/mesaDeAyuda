<%@ page import="mx.gob.ifr.rt.DatosRequeridos" %>



<div class="fieldcontain ${hasErrors(bean: datosRequeridosInstance, field: 'nombreCampo', 'error')} ">
	<label for="nombreCampo">
		<g:message code="datosRequeridos.nombreCampo.label" default="Nombre Campo" />
		
	</label>
	<g:textField name="nombreCampo" value="${datosRequeridosInstance?.nombreCampo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: datosRequeridosInstance, field: 'tipoDeDato', 'error')} ">
	<label for="tipoDeDato">
		<g:message code="datosRequeridos.tipoDeDato.label" default="Tipo De Dato" />
		
	</label>
	<g:textField name="tipoDeDato" value="${datosRequeridosInstance?.tipoDeDato}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: datosRequeridosInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="datosRequeridos.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${datosRequeridosInstance?.activo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: datosRequeridosInstance, field: 'categoria', 'error')} required">
	<label for="categoria">
		<g:message code="datosRequeridos.categoria.label" default="Categoria" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="categoria" name="categoria.id" from="${mx.gob.ifr.rt.CategoriaDelProblema.list()}" optionKey="id" required="" value="${datosRequeridosInstance?.categoria?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: datosRequeridosInstance, field: 'obligatorio', 'error')} ">
	<label for="obligatorio">
		<g:message code="datosRequeridos.obligatorio.label" default="Obligatorio" />
		
	</label>
	<g:checkBox name="obligatorio" value="${datosRequeridosInstance?.obligatorio}" />

</div>

