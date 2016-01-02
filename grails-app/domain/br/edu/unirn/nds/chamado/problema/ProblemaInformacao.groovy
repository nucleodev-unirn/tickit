package br.edu.unirn.nds.chamado.problema

import br.edu.unirn.nds.chamado.acesso.Usuario

class ProblemaInformacao {

    Problema problema
    InformacaoAdicional informacaoAdicional
    boolean ativo = true

    Date dateCreated
    Usuario cadastradoPor

    static constraints = {
        problema()
        informacaoAdicional()
        ativo()
        cadastradoPor()
        dateCreated()
    }

    @Override
    String toString() {
        "${problema?.titulo} - ${informacaoAdicional?.nome}"
    }
}
