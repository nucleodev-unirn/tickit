package br.edu.unirn.nds.chamado.acesso

import br.edu.unirn.nds.tipos.TipoUsuario

class Usuario {
//    String login
    String matricula
    String senha
    String email
    TipoUsuario tipoUsuario = TipoUsuario.SEM_TIPO

    Date dateCreated
    Date lastUpdated

    Boolean ativo = Boolean.TRUE

    static constraints = {
        matricula()
        email email: true, nullable: true
        senha nullable: true, attributes: [showInList: false]
        tipoUsuario()
        dateCreated()
        lastUpdated()
    }

    def beforeInsert() {
        if(senha){
            this.senha = senha.encodeAsSHA256();
        }
    }

    static searchFields = ["matricula", 'email']

    @Override
    String toString() {
//        return super.toString()
        "${matricula}"
    }
}

