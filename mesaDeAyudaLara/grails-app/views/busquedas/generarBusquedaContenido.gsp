                 
                             <div class="alert alert-success alert-dismissable">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="fa fa-times-circle"></i></button>
                  <strong> ${dato}</strong>  <strong>...Total de concidencias: ${listaDeConcidencias?.size()}</strong>  </div>
                 
                        <div class="table-relative table-responsive">
                          <table class="table table-condensed table-striped margin-0px">
                            <thead>
                              <tr>
                                <th>Ver Caso
                                  <label for="all"></label></th>
                                <th>Remitente</th>
                                <th>Número de Ticket</th>
                                <th>Fecha de Creacion</th>
                                <th>Estado</th>
                                <th colspan="2">Concidencia</th>
                              </tr>
                            </thead>
                            <tbody>
                                
                            <g:each in="${listaDeConcidencias}" var="concidencia" name="casos">    
                              <tr class="unread">
                                  <td class="star" style="text-align: center;"><a class="fa fa-flag fa-folder-open" href="${createLink(controller:'solicitudDeCaso', action:'verCaso', params:['idCaso':concidencia?.caso?.id])}"></a></td>
                                <td><a href="#">${mx.gob.ifr.rt.UsuarioUnidadAdministrativa.findByUsuario(concidencia?.caso?.creador)?.unidad}</a> <small><a href="#">${concidencia?.caso?.creador}</a></small></td>
                                <td><a>${mx.gob.ifr.rt.CasoCategoriaDelProblema.findByCaso(concidencia?.caso)?.categoria} <small>Número de Ticket: ${concidencia?.caso?.id}</small></a></td>
                                <td>${concidencia?.caso?.fechaDeCreacion}<small></small></td>
                                <td>${concidencia?.caso?.estado}</td>
                                <td colspan="2">${concidencia?.concidencia}</td>
                              </tr>
                             </g:each>
                            </tbody>
                          </table>
                          
                         
                        </div>