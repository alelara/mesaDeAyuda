<!DOCTYPE html>
<html>
	<head>

                     <sec:ifLoggedIn>
                         

                            <sec:ifNotGranted roles='ROLE_CONSULTAWIKI'>
                                <META http-equiv="refresh" content="0;URL=${createLink(controller:'solicitudDeCaso', action:'bandejaDeCasos')}">
                            </sec:ifNotGranted>


                            <sec:ifAllGranted roles='ROLE_CONSULTAWIKI'>
                                <META http-equiv="refresh" content="0;URL=${createLink(controller:'consulta', action:'wiki')}">
                            </sec:ifAllGranted>



                      
                     </sec:ifLoggedIn> 

              <sec:ifNotLoggedIn>                        
                  <META http-equiv="refresh" content="0;URL=${createLink(controller:'login', action:'auth')}">
                </sec:ifNotLoggedIn>
	</head>
	<body>


  
	</body>
</html>
