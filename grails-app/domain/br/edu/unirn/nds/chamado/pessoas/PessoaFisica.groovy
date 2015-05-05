package br.edu.unirn.nds.chamado.pessoas

class PessoaFisica extends Pessoa {
    
    String cpf

    static constraints = {
        cpf size: 0..11 // (sem máscara. 000.111.222-33)
    }
}
