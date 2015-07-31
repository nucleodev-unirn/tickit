(function(){

    $(document).ready(function(){
        init();
    })

    function init(){
        $("#pesquisaEquipamentoForm").submit(pesquisarEquipamentos);
        $("#alterarStatusEquipamentoForm").submit(alterarStatusEquipamento);
        $("#alterarSetorEquipamentoForm").submit(alterarSetorEquipamento);
        $("#tabelaEquipamento").delegate(".alteraStatusEquipamento-btn","click",modalAlteraStatus);
        $("#tabelaEquipamento").delegate(".alteraSetorEquipamento-btn","click",modalAlteraSetor);
    }

    function pesquisarEquipamentos(event){
        event.preventDefault();
        if(checkForm(this)){
            var formData = $(this).serialize();
            loadingEquipamento("show");
            $.ajax({
                url: window.baseUrl+"equipamento/buscar",
                method: "POST",
                data: formData,
                success: gerarTabelaEquipamento
            });
        }else{
            alertMsg("#alert-pesquisar", "alert-info", "Preencha um campo para pesquisar");
            console.info("Preecha um campo")
        }
    }

    function gerarTabelaEquipamento(data){
        var html = "";
        $.each(data, function(i, v){
            html += "<tr id='equipamento-"+ v.id+"'>" +
                "<td>"+v.nome+"</td>" +
                "<td>"+ v.tombamento+"</td>" +
                "<td>"+ v.mac+"</td>" +
                "<td class='statusEquipamento'>"+ v.statusEquipamento+"</td>" +
                "<td class='setorAtual'>"+ v.setorAtual+"</td>" +
                "<td class='text-center'>" +
                "<button class='btn btn-xs btn-default alteraStatusEquipamento-btn' data-id="+ v.id+">Alterar Status</button>" +
                "<button class='btn btn-xs btn-default alteraSetorEquipamento-btn margin-left-10' data-id="+ v.id+">Alterar Setor</button>" +
                "</td>" +
                "</tr>";
        });
        $("#tabelaEquipamento").html(html);
        loadingEquipamento("hide");
    }

    function loadingEquipamento(status){
        if(status == 'show'){
            $(".loading-equipamento").removeClass("invisible");
        }else if(status == 'hide'){
            $(".loading-equipamento").addClass("invisible");
        }
    }

    function modalAlteraStatus(){
        var equipamento = $(this).data("id");
        $(".modal-body .alert").remove();
        $.get(window.baseUrl+"equipamento/ultimoStatus/"+equipamento+".json").done(function(data){
            $("#modalAlterarStatusEquipamento #equipamento-nome").text(data.equipamento.nome);
            $("#modalAlterarStatusEquipamento #statusAnterior").val(data.ultimoStatus.nome);
            $("#modalAlterarStatusEquipamento #equipamento").val(equipamento);
            $("#modalAlterarStatusEquipamento").modal("show");
        })
    }

    function alterarStatusEquipamento(event){
        event.preventDefault();
        var formData = $(this).serialize();
        $.ajax({
            url: window.baseUrl+"equipamento/alterarStatus",
            method: "POST",
            data: formData,
            success: function(data){
                var $tr = $("tr#equipamento-"+$('#modalAlterarStatusEquipamento #equipamento').val());
                $tr.find(".statusEquipamento").text($("#statusEquipamento option:selected").text());
                alertMsg(".modal-body", "alert-success",data);
                resetStatusForm();
            },error: function(data){
                alertMsg(".modal-body", "alert-danger",data.responseText);
            }
        });
    }

    function modalAlteraSetor(){
        var equipamento = $(this).data("id");
        $(".modal-body .alert").remove();
        $.get(window.baseUrl+"equipamento/ultimoSetor/"+equipamento+".json").done(function(data){
            $("#modalAlterarSetorEquipamento #equipamento-nome").text(data.equipamento.nome);
            $("#modalAlterarSetorEquipamento #setorAnterior").val(data.ultimoSetor.nome);
            $("#modalAlterarSetorEquipamento #equipamento").val(equipamento);
            $("#modalAlterarSetorEquipamento").modal("show");
        })
    }

    function alterarSetorEquipamento(event){
        event.preventDefault();
        var formData = $(this).serialize();
        $.ajax({
            url: window.baseUrl+"equipamento/alterarSetor",
            method: "POST",
            data: formData,
            success: function(data){
                var $tr = $("tr#equipamento-"+$('#modalAlterarSetorEquipamento #equipamento').val());
                $tr.find(".setorAtual").text($("#setor option:selected").text());
                alertMsg(".modal-body", "alert-success",data);
                resetStatusForm();
            },error: function(data){
                alertMsg(".modal-body", "alert-danger",data.responseText);
            }
        });
    }

    function alertMsg(container, type, msg){
        var html = "<div class='alert "+type+" alert-dismissible fade in'>" +
            "<button type='button' class='close' data-dismiss='alert'><span aria-hidden='true'>×</span></button>"+msg+"</div>";
        $(container).prepend(html);
    }

    function resetStatusForm(){
        $("#observacao").val("");
        $("#statusEquipamento option:first").attr('selected','selected');
    }

    function checkForm(form){
        var valid = 0;
        $(form).find('input, select').each(function(){
            if(($(this).val() != "" && $(this).attr("type") != "checkbox") || $(this).is(":checked")) valid+=1;
        });
        return valid
    }

})();