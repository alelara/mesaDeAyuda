<g:each name="usuarios" in="${areas}">
    
                        <li style="padding-bottom:  20px;">

                                  <span class="chat-name">${it?.nombre}</span>   
                                  <span class="label label-success">TEL: ${it?.numero==null ? "------" : it?.numero }</span>
                                  <span class="badge">Ext: ${it?.extension==null ? '----' : it?.extension}</span>
                                  <span class="bg-black" style="font-size: 0.8em;">${it?.correoElectronico==null ? '----' : it?.correoElectronico}</span>
                          </li>

</g:each >
