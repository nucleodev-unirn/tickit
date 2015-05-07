package br.edu.unirn.nds.chamado.acesso

class Usuario {
    String login
    String senha

    Date dateCreated
    Date lastUpdated

    Boolean ativo = Boolean.TRUE

    static constraints = {
        login nullable: false, unique: true
        senha nullable: false
    }

    def beforeInsert() {
        if(senha){
            this.senha = senha.encodeAsSHA256();
        }
    }
    
}
