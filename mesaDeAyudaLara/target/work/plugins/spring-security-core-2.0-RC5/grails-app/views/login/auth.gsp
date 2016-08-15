<html>
<head>

	<title><g:message code="springSecurity.login.title"/></title>
        
        
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ORB | Login</title>
<asset:stylesheet src="styles.css"/>

<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
<asset:javascript  src="vendors/horisontal/modernizr.custom.js"/>
	
</head>

<body>
    
 <!---   
<div class="colorful-page-wrapper">
  <div class="center-block">
    <div class="login-block">

		<g:if test='${flash.message}'>
			<div class='login_message'>${flash.message}</div>
		</g:if>

		<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
			        <header>
          <div class="image-block">
              <asset:link rel="shortcut icon" href="IFREM_verde.png" type="image/x-icon"/>
              <asset:image src="iconsIFREM_verde.png"/>
          </div>
          Login to ORB <small><sec:ifLoggedIn>
Welcome Back!
</sec:ifLoggedIn></small></header>
                    
                    
                    <p>
				<label for='username'><g:message code="springSecurity.login.username.label"/>:</label>
				<input type='text' class='text_' name='j_username' id='username'/>
			</p>

			<p>
				<label for='password'><g:message code="springSecurity.login.password.label"/>:</label>
				<input type='password' class='text_' name='j_password' id='password'/>
			</p>

			<p id="remember_me_holder">
				<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>/>
				<label for='remember_me'><g:message code="springSecurity.login.remember.me.label"/></label>
			</p>

			      <footer>
				<input type='submit' id="submit" class="btn btn-default" value='${message(code: "springSecurity.login.button")}'/>        </footer>
			
		</form>
	</div>    <div class="using-social-header">Sign In Using Social Profiles</div>
    <div class="social-buttons">
      <ul class="social">
        <li><a href="http://facebook.com/"><i class="entypo-facebook-circled"></i></a></li>
        <li><a href="http://google.com/"><i class="entypo-gplus-circled"></i></a></li>
        <li><a href="http://twitter.com/"><i class="entypo-twitter-circled"></i></a></li>
      </ul>
    </div>
    <div class="copyrights"> ORB Power Admin Dashboard Template <br>
      Created by DazeinCreative &copy; 2014 </div>
  </div>
</div>
<script type='text/javascript'>
(function() {
	document.forms['loginForm'].elements['j_username'].focus();
})();
</script>

-->

<div class="colorful-page-wrapper">
  <div class="center-block">
    <div class="login-block">
      <form action="${postUrl}" id="login-form" class="orb-form" method='POST' autocomplete='off'>
        <header>
          <div class="image-block">
                            <asset:image src="IFREM_gris.png"/>
          </div>
          Mesa de Ayuda <small>Tickets</small></header>
        <fieldset>
          <section>
            <div class="row">
              <label class="label col col-4">Usuario</label>
              <div class="col col-8">
                <label class="input"> <i class="icon-append fa fa-user"></i>
                    <input type="text" name='j_username'>
                </label>
              </div>
            </div>
          </section>
          <section>
            <div class="row">
              <label class="label col col-4">Contraseña</label>
              <div class="col col-8">
                <label class="input"> <i class="icon-append fa fa-lock"></i>
                  <input type="password" name='j_password'>
                </label>
                <div class="note"><a href="#">¿Olvidaste tu contraseña?</a></div>
              </div>
            </div>
          </section>
          <section>
            <div class="row">
              <div class="col col-4"></div>
              <div class="col col-8">
                <label class="checkbox">
                  <input type="checkbox" name="remember" checked>
                  <i></i>Recordar Sesion</label>
              </div>
            </div>
                <g:if test='${flash.message}'>
                    <div class='login_message' style="color: red; text-align: center; "><br>${flash.message}</div>
		</g:if>
          </section>
        </fieldset>
        <footer>
          <button type="submit" class="btn btn-default">Iniciar Sesion</button>
        </footer>
      </form>
    </div>
    <div class="using-social-header">Sistemas del Ifrem</div>
    <div class="social-buttons">
      <ul class="social">
          <li><a href="http://www.ifrem.gob.mx/IFR/" title="Portal De Pagos"><i class="entypo-tag"></i></a></li>
        <li><a href="http://189.206.57.166:8080/siremweb/" title="SiremWeb">  <i class="entypo-archive"></i>  </a></li>
        <li><a href="http://ifrem.edomex.gob.mx/" title="Portal Ifrem"><i class="entypo-address"></i></a></li>
      </ul>
    </div>
    <div class="copyrights"> Instituto de la Función Registral del Estado  de México<br>
      Creado por Depto Desarrollo Ifrem &copy; 2015 </div>
  </div>
</div>

<!--Scripts--> 
<!--JQuery--> 
<asset:javascript src="js/vendors/jquery/jquery.min.js"/>
<asset:javascript  src="js/vendors/jquery/jquery-ui.min.js"/>

<!--Forms--> 
<asset:javascript  src="js/vendors/forms/jquery.form.min.js"/>
<asset:javascript  src="js/vendors/forms/jquery.validate.min.js"/>
<asset:javascript  src="js/vendors/forms/jquery.maskedinput.min.js"/>
<asset:javascript  src="js/vendors/jquery-steps/jquery.steps.min.js"/>

<!--NanoScroller--> 
<asset:javascript  src="js/vendors/nanoscroller/jquery.nanoscroller.min.js"/>

<!--Sparkline--> 
<asset:javascript  src="js/vendors/sparkline/jquery.sparkline.min.js"/> 

<!--Main App--> 
<asset:javascript  src="js/scripts.js"/>

<script type='text/javascript'>
(function() {
	document.forms['login-form'].elements['j_username'].focus();
})();
</script>

</body>
</html>
