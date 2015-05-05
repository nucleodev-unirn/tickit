package br.edu.unirn.nds.chamado.acesso

class Usuario {
    String login
    String senha
    String senhaHash
    
    static transients = ["senha"]

    static constraints = {
        login()
        senha(nullable: false, blank: false)
        senhaHash()
    }
    
    def setSenha(String val){
        if(val){
            senha = val
            senhaHash = senha?.encodeAsSHA256()
        }
    }
}
