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

    boolean ativo
    Usuario cadastradoPor
    Date dateCreated
    Usuario ultimaAtualizacaoPor
    Date lastUpdated
    Usuario desativadoPor
    Date dataDesativacao

    static constraints = {
        nome()
        tombamento()
        descricao()
        mac()
        locado()
        empresaLocacao()
        equipamentoChamado()

        ativo()
        cadastradoPor ()
        dateCreated ()
        ultimaAtualizacaoPor ()
        lastUpdated ()
        desativadoPor ()
        dataDesativacao ()
    }
}
