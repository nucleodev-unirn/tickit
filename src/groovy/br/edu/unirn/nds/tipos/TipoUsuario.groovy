package br.edu.unirn.nds.tipos

/**
 * Created by MarcioDavi on 08/08/2015.
 */
enum TipoUsuario {
    ADMINISTRADOR("Administrador"), FUNCIONARIO("Funcionário"), COMUM("Comum"), SEM_TIPO('Sem Tipo')

    String descricao

    private TipoUsuario(descricao){
        this.descricao = descricao
    }

    String toString(){descricao}
}