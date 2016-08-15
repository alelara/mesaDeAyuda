class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        //"/"(view:"/solicitudDeCaso/bandejaDeCasos")
        "500"(view:'/error')
        "404"(view:'/404')
	}
}
