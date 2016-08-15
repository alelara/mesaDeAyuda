

                
                <!DOCTYPE html>

<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Ifrem| Error</title>
<meta name="layout" content="rt"/>
</head>

<body>
<div class="standalone-page-wrapper"> 
  
  <!--Top Block-->
  <div class="error-top-block">
      <div class="error-top-block-image"> <asset:image src="images/error-robot.png" alt="Ooops!" />  </div>
  </div>
  <!--/Top Block--> 
  <!--Bottom Block-->
  <div class="error-bottom-block">
    <div class="col-md-6 col-md-offset-3 error-description">
      <div class="error-code">Error 500 </div>
      <div class="error-meaning">Error Interno del Servidor</div>
      <div class="todo">
        <h4>¿Que sucedio?</h4>
		<g:if env="development">
			<g:renderException exception="${exception}" />
		</g:if>
		<g:else>
			<ul class="errors">
				<li>An error has occurred</li>
			</ul>
		</g:else>
        <div class="input-group">
            <a href="${createLink(uri: '/')}" class="btn btn-danger" style="width: 20%;"> Salir </a>
        </div>
        <!-- /input-group --> 
        
      </div>
      <div class="copyrights"> Mesa de Ayuda | Ifrem <br>
        Creado por IFREM &copy; 2015 </div>
    </div>
  </div>
  <!--/Bottom Block--> 
</div>
</body>
</html>