package br.edu.unirn.nds.chamado.pessoas

class PessoaJuridica extends Pessoa {

    String cnpj

    static constraints = {
        cnpj size: 0..14 // (sem máscara. 99.999.999/9999-99)
    }
}
