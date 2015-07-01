package br.edu.unirn.nds.chamado.acesso

class Usuario {
    String login
    String senha

    Date dateCreated
    Date lastUpdated

    Boolean ativo = Boolean.TRUE

    static constraints = {
        login nullable: false, unique: true
        senha nullable: false, attributes: [showInList: false]
        dateCreated()
        lastUpdated()
    }

    def beforeInsert() {
        if(senha){
            this.senha = senha.encodeAsSHA256();
        }
    }

    static searchFields = ["login"]

    @Override
    String toString() {
//        return super.toString()
        login
    }
}
