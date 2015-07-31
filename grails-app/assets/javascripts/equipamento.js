(function(){

    $(document).ready(function(){
        init();
    })

    function init(){
        $(".equipamentoInfo-btn").click(carregaInformacoesModal);
    }

    function gerarTabelaHistStatus(data){
        var html = "";
        $.each(data, function(i, v){
            html += "<tr>" +
                "<td>"+v.status+"</td>" +
                "<td>"+ v.observacao+"</td>" +
                "<td class='text-center'>"+ v.cadastradoPor+"</td>" +
                "<td class='text-center'>"+ v.dateCreated+"</td>" +
                "</tr>";
        });
        $("#tabelaHistStatus").html(html);
    }

    function gerarTabelaHistSetor(data){
        var html = "";
        $.each(data, function(i, v){
            html += "<tr>" +
                "<td>"+v.nomeSetor+"</td>" +
                "<td class='text-center'>"+ v.cadastradoPor+"</td>" +
                "<td class='text-center'>"+ v.dateCreated+"</td>" +
                "</tr>";
        });
        $("#tabelaHistSetor").html(html);
    }

    function carregaInformacoesModal(){
        var equipamento = $(this).data("id");
        $.get(window.baseUrl+"equipamento/informacoes/"+equipamento).done(function(data){
            $("#equipamento-nome").text(data.equipamento.nome);
            $("#modalInfoEquipamento").modal("show");
            gerarTabelaHistStatus(data.historicoStatus);
            gerarTabelaHistSetor(data.historicoSetor);
            $("#qntChamados").text(data.quantidadeChamados);
        });
    }

})();