<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="layout" content="rt"/>
    </head>
    <body>
        <div class="breadcrumb clearfix">
            <ul>
                <li><a ><i class="fa fa-home"></i></a></li>
                <li><a href="${createLink(controller:'solicitudDeCaso', action:'bandejaDeCasos')}">Mesa de Ayuda</a></li>
                <li class="active">Configuración de Categorias de Problemas</li>
            </ul>
        </div>
        <!--/Breadcrumb-->

        <div class="page-header">
            <h1>Editar de Categoria del Problema<small>${unidadDeUsuario?.unidad}</small></h1>
        </div>
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title pull-left">Editar Wiki<small>${categoria}</small></div>
                <div class="pull-right"> <a href="#" data-toggle="modal" data-target="#panel-question" class="btn-question"><i class="fa fa-question-circle"></i></a> <a href="#" class="btn-minmax"><i class="fa fa-chevron-circle-up"></i></a> <a href="#" class="btn-close"><i class="fa fa-times-circle"></i></a> </div>
                <div class="clearfix"></div>
            </div>
            <div class="panel-body">

                <p class="lead">Navbars are responsive meta components that serve as navigation headers for your application or site. They begin collapsed (and are toggleable) in mobile views and become horizontal as the available viewport width increases. We are not use Bootstrap Navs in ORB, but you can &#8212; so, we style them to include in theme.</p>
                <div class="inbox-new-message">
                    <g:form role="form"  url="[controller: 'configuracion', action:'updateWiki']">
                        <input type="hidden" name="idCategoria" value="${categoria?.id}">
                        <div class="row">

                            <div class="form-group col-md-12">
                                <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Topic of Message" value="${categoria}">
                            </div>
                        </div>
                            <textarea id="summernote" name="wiki"></textarea>
                        <button type="submit" class="btn btn-info">Actualizar Wiki</button>
                    </g:form>
                </div>
            </div>
        </div>
    </body>
</html>
