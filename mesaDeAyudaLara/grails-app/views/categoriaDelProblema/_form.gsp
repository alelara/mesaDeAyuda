<%@ page import="mx.gob.ifr.rt.CategoriaDelProblema" %>



<div class="fieldcontain ${hasErrors(bean: categoriaDelProblemaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="categoriaDelProblema.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${categoriaDelProblemaInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: categoriaDelProblemaInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="categoriaDelProblema.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${categoriaDelProblemaInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: categoriaDelProblemaInstance, field: 'activo', 'error')} ">
	<label for="activo">
		<g:message code="categoriaDelProblema.activo.label" default="Activo" />
		
	</label>
	<g:checkBox name="activo" value="${categoriaDelProblemaInstance?.activo}" />

</div>

<div class="fieldcontain ${hasErrors(bean: categoriaDelProblemaInstance, field: 'prioridad', 'error')} required">
	<label for="prioridad">
		<g:message code="categoriaDelProblema.prioridad.label" default="Prioridad" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="prioridad" name="prioridad.id" from="${mx.gob.ifr.rt.PrioridadDelProblema.list()}" optionKey="id" required="" value="${categoriaDelProblemaInstance?.prioridad?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: categoriaDelProblemaInstance, field: 'unidadAdministrativaResponsable', 'error')} required">
	<label for="unidadAdministrativaResponsable">
		<g:message code="categoriaDelProblema.unidadAdministrativaResponsable.label" default="Unidad Administrativa Responsable" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="unidadAdministrativaResponsable" name="unidadAdministrativaResponsable.id" from="${mx.gob.ifr.rt.UnidadAdministrativa.list()}" optionKey="id" required="" value="${categoriaDelProblemaInstance?.unidadAdministrativaResponsable?.id}" class="many-to-one"/>

</div>

