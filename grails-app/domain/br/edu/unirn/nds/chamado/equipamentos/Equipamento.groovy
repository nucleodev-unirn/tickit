package br.edu.unirn.nds.chamado.equipamentos

import br.edu.unirn.nds.chamado.acesso.Usuario
import br.edu.unirn.nds.chamado.base.EmpresaLocacao

class Equipamento {

    String nome
    String tombamento
    String descricao
    String mac

    Boolean locado = Boolean.FALSE

    EmpresaLocacao empresaLocacao
    TipoEquipamento tipoEquipamento

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
        descricao nullable: true
        mac nullable: true
        locado()
        empresaLocacao(nullable: true)
        tipoEquipamento()

        ativo()

        dateCreated attributes: [showInList: false]
        lastUpdated attributes: [showInList: false]
        cadastradoPor attributes: [showInList: false]
        ultimaAtualizacaoPor nullable: true, attributes: [ showInForm: false, showInList: false]
        desativadoPor nullable: true, attributes: [ showInForm: false, showInList: false]
        dataDesativacao nullable: true, attributes: [ showInForm: false, showInList: false]
    }

    static searchFields = ["nome","tombamento","descricao","mac"]
}
