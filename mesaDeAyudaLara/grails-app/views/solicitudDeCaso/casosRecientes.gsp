                   
<g:each name="casos" in="${casosRecientes}">
<li><a href="${createLink(controller:'solicitudDeCaso', action:'verCaso', params:['idCaso':it?.caso?.id])}"> <span class="user-image"><img src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQd_1aH4yEJ0vN1j7wPnSeoL-AmsVLiswfyEIGPV3wfdR_K7nvvTQ" alt="Gluck Dorris" /></span>
                      <h4>${mx.gob.ifr.rt.UsuarioUnidadAdministrativa.findByUsuario(it?.caso?.creador)?.unidad}</h4>
                      <p>${it?.categoria} <span class="label label-default" style="margin-top: 5px;"><i class="entypo-bell"></i> Ticket: ${it?.caso?.id}</span></p>
                      <span class="label label-default"><i class="entypo-clock"></i> ${it?.caso?.fechaDeCreacion}</span><br>
                      
                      <span class="delete"><i class="entypo-back"></i></span> </a> </li>
                   
</g:each>