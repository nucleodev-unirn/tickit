(function(){

    $(document).ready(function(){
        init();
    })

    function init(){
        $(".equipamentoInfo-btn").click(carregaInformacoesModal);
    }

    function carregaInformacoesModal(){
        var equipamento = $(this).data("id");
        $.get(window.baseUrl+"equipamento/informacoes/"+equipamento).done(function(data){
            $("#equipamento-nome").text(data.nome);
            $("#modalInfoEquipamento").modal("show");
        })
    }

})();