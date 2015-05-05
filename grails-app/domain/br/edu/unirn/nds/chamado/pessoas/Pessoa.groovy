package br.edu.unirn.nds.chamado.pessoas

class Pessoa {

    String nome

    Date dateCreated
    Date lastUpdated


    static constraints = {
        nome()
        dateCreated()
        lastUpdated()
    }
}
