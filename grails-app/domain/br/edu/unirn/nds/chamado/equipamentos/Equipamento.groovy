package br.edu.unirn.nds.chamado.equipamentos

import br.edu.unirn.nds.chamado.acesso.Usuario
import br.edu.unirn.nds.chamado.base.EmpresaLocacao

class Equipamento {

    String nome
    String tombamento
    String descricao
    String mac
    boolean locado
    EmpresaLocacao empresaLocacao
    EquipamentoChamado equipamentoChamado

    Boolean ativo = Boolean.TRUE

    Date dateCreated
    Date lastUpdated
    Date dataDesativacao

    Usuario cadastradoPor
    Usuario ultimaAtualizacaoPor
    Usuario desativadoPor

    static constraints = {
        nome()
        tombamento()
        descricao()
        mac()
        locado()
        empresaLocacao()
        equipamentoChamado()

        ativo()

        dateCreated attributes: [showInList: false]
        lastUpdated attributes: [showInList: false]
        cadastradoPor attributes: [ showInForm: false, showInList: false]
        ultimaAtualizacaoPor nullable: true, attributes: [ showInForm: false, showInList: false]
        desativadoPor nullable: true, attributes: [ showInForm: false, showInList: false]
        dataDesativacao nullable: true, attributes: [ showInForm: false, showInList: false]
    }
}
