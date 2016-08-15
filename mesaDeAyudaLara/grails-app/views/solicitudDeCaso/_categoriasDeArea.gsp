
<g:if test="${categorias}">
    <label class="select">
<g:select  from="${categorias}"  optionKey="id"  optionValue="nombre"  name="categoriaId" required="true"/> </label>
</g:if>
<g:else>
       <div class="alert alert-danger alert-dismissable">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="fa fa-times-circle"></i></button>
                  <strong>Debe Seleccionar el area donde desea levantar el ticket.</strong>  </div>
</g:else>

 