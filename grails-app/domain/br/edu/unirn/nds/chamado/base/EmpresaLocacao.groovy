package br.edu.unirn.nds.chamado.base
import br.edu.unirn.nds.chamado.acesso.Usuario

class EmpresaLocacao {

    String nome
    String razaoSocial
    String cpfCnpj

    String responsavelAtendimento
    String observacao
    Boolean ativo = Boolean.TRUE

    Date dateCreated
    Date lastUpdated
    Date dataDesativacao

    Usuario cadastradoPor
    Usuario ultimaAtualizacaoPor
    Usuario desativadoPor

    static constraints = {
        nome()
        razaoSocial nullable: true
        cpfCnpj()
        responsavelAtendimento()
        observacao nullable: true
        ativo()

        cadastradoPor attributes: [showInList: false]
        dateCreated attributes: [showInList: false]
        lastUpdated attributes: [showInList: false], nullable: true
        ultimaAtualizacaoPor nullable: true, attributes: [ showInForm: false, showInList: false]
        desativadoPor nullable: true, attributes: [ showInForm: false, showInList: false]
        dataDesativacao nullable: true, attributes: [ showInForm: false, showInList: false]
    }

    @Override
    String toString() {
        return nome
    }

    static searchFields = ["nome","razaoSocial","cpfCnpj","responsavelAtendimento"]
}
