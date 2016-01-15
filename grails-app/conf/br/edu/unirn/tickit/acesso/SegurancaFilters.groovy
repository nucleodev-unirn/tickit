package br.edu.unirn.tickit.acesso

class SegurancaFilters {

    def filters = {
//        all(controller:'*', action:'*') {
        all(controller:'index', action:'index2', invert:true) {
            before = {
                def publicControllers = ['autenticacao','endereco']
                if(controllerName != "assets"){
                    if(!session.usuario && !publicControllers.contains(controllerName)){
                        redirect(controller: 'autenticacao')
                        return false
                    }
                }
            }
            after = { Map model ->

            }
            afterView = { Exception e ->

            }
        }
    }
}
