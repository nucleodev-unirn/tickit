package br.edu.unirn.nds.chamado.base

class Pessoa {

    String nome
    String email
    String cpfCnpj
    Character tipo = 'F'

    static constraints = {
        nome()
        email()
        cpfCnpj()
        tipo inList: ['F', 'J']
    }

    def getTiposPessoa(){
        ['F': "Físico",'J': "Jurídico"]
    }

    @Override
    String toString() {
        "${nome} (${cpfCnpj})"
    }
}
