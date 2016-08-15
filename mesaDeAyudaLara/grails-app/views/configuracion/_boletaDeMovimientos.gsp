<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sample title</title>

    </head>
    <body>
        <div style=" width: 60%; border: 5px solid #CCC; margin-left: 20%;">
            <section>
                             <img src="https://lh4.googleusercontent.com/-N5g6-4VXm8U/Vi_ehukMkzI/AAAAAAAAAA4/5ExOolynOnA/w1598-h827-no/Logo%2BIFREM%2Bverde.png" style="width: 100%;">
            </section>
            <section>

                <h1 style="text-align: center; color: #454b52;">Boleta de Notificación de Movimientos</h1>

            <section>
                <table style="width: 90%; margin-left: 5%;">
                    <tr>
                        <td style="background: red; padding: 5px; width: 50%; color: #FFF; text-align: center; font-weight: bold; text-transform: uppercase;border-radius: 8px 8px 8px 8px;">Número de Ticket</td>
                        <td class="valorGis" style="background: #848484; padding: 5px; width: 50%; color: #FFF; text-align: center; font-weight: bold; text-transform: uppercase;border-radius: 8px 8px 8px 8px; margin-bottom: 10px;">  <g:formatNumber name="folioReal" number="${caso?.id}" minIntegerDigits="8" /> </td>
                    </tr> 
                    <tr>
                        <td></td>
                    </tr>
                    <tr >
                        <td class="valor" style="background: #95C120; padding: 5px; width: 50%; color: #FFF; text-align: center; font-weight: bold; text-transform: uppercase;border-radius: 8px 8px 8px 8px;">Movimiento</td>
                        <td class="valorGis" style="background: #848484; padding: 5px; width: 50%; color: #FFF; text-align: center; font-weight: bold; text-transform: uppercase;border-radius: 8px 8px 8px 8px; margin-bottom: 10px;">${directa?.tipoDeAtencion}</td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                      <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="valor" style="background: #95C120; padding: 5px; width: 50%; color: #FFF; text-align: center; font-weight: bold; text-transform: uppercase;border-radius: 8px 8px 8px 8px;">Fecha de Movimiento</td>
                        <td class="valorGis" style="background: #848484; padding: 5px; width: 50%; color: #FFF; text-align: center; font-weight: bold; text-transform: uppercase;border-radius: 8px 8px 8px 8px;">${directa?.fechaDeAtencion?.format("dd-MM-yyyy HH:mm:ss")}</td>
                    </tr>              <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="valor" style="background: #95C120; padding: 5px; width: 50%; color: #FFF; text-align: center; font-weight: bold; text-transform: uppercase;border-radius: 8px 8px 8px 8px;">Categoria del Problema</td>
                        <td class="valorGis" style="background: #848484; padding: 5px; width: 50%; color: #FFF; text-align: center; font-weight: bold; text-transform: uppercase;border-radius: 8px 8px 8px 8px;">${directa?.categoria}</td>
                    </tr>              <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="valor" style="background: #95C120; padding: 5px; width: 50%; color: #FFF; text-align: center; font-weight: bold; text-transform: uppercase;border-radius: 8px 8px 8px 8px;">Unidad Administrativa</td>
                        <td class="valorGis" style="background: #848484; padding: 5px; width: 50%; color: #FFF; text-align: center; font-weight: bold; text-transform: uppercase;border-radius: 8px 8px 8px 8px;">${directa?.usuarioQueSeAtiende}</td>
                    </tr>              <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="valor" style="background: #95C120; padding: 5px; width: 50%; color: #FFF; text-align: center; font-weight: bold; text-transform: uppercase;border-radius: 8px 8px 8px 8px;">Nombre del usuario</td>
                        <td class="valorGis" style="background: #848484; padding: 5px; width: 50%; color: #FFF; text-align: center; font-weight: bold; text-transform: uppercase;border-radius: 8px 8px 8px 8px;">${directa?.usuarioDeAtencion}</td>
                    </tr>              <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="valor" style=" background: #95C120; padding: 5px; width: 50%; color: #FFF; text-align: center; font-weight: bold; text-transform: uppercase;border-radius: 8px 8px 8px 8px;">Url de Acceso</td>
                        <td class="valorGis" style="background: #848484; padding: 5px; width: 50%; color: #FFF; text-align: center; font-weight: bold; text-transform: uppercase;border-radius: 8px 8px 8px 8px;">${directa?.descrpcionDelProblema}</td>
                    </tr>
                </table> 
                <br><br>
            </section>
        </div>
                    <p style="color: red; font-size: 0.7em; margin-left: 20%;">
        <br>ATENCIÓN:<br>
-No responda este correo, es sólo de ENVÍO/NOTIFICACIÓN.<br>
-Usted recibe este correo porque forma parte de la Mesa de Ayuda del Instituto de la Función Registral del Estado de México.<br>
<span style="color: #CCC;;">&copy;IFREM 2015</span>
        </p>
    </body>
</html>
