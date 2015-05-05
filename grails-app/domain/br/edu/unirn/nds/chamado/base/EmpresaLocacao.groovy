package br.edu.unirn.nds.chamado.base

import br.edu.unirn.nds.chamado.acesso.Usuario
import br.edu.unirn.nds.chamado.pessoas.PessoaJuridica

class EmpresaLocacao {

    PessoaJuridica pessoaJuridica
    String responsavelAtendimento
    String observacao
    boolean ativo

    Usuario cadastradoPor
    Date dateCreated
    Usuario ultimaAtualizacaoPor
    Date lastUpdated
    Usuario desativadoPor
    Date dataDesativacao

    static constraints = {
        pessoaJuridica()
        responsavelAtendimento()
        observacao()
        ativo()
        cadastradoPor ()
        dateCreated ()
        ultimaAtualizacaoPor ()
        lastUpdated ()
        desativadoPor ()
        dataDesativacao ()
    }
}
