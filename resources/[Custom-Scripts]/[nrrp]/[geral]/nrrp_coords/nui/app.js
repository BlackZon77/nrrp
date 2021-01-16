function copyToClipboard(element) {
    $('#staticBackdrop').modal('toggle');
    setTimeout(function() {
        var $temp = $("<input>");
        $("#copyRow").append($temp);
        $temp.val($('#'+element).text()).select();
        console.log($('#'+element).text())
        document.execCommand("copy");
        $temp.remove();
        closeNUI()
    }, 500);
}

$( function() {
    // Dynamic Stuff

    $(document).on('click','#closeBtn, #close2',function(){
        $.post('http://nrrp_coords/closeWindow', JSON.stringify({ 
        }));
    });

    $(document).on('click','#normCoords',function(){
        copyToClipboard('stndCopy');
        $.post('http://nrrp_coords/copiedClipboard', JSON.stringify({ }));
    });

    $(document).on('click','#coordTable',function(){
        copyToClipboard('tableCopy');
        $.post('http://nrrp_coords/copiedClipboard', JSON.stringify({ }));
    });

    $(document).on('click','#json',function(){
        copyToClipboard('jsonCopy');
        $.post('http://nrrp_coords/copiedClipboard', JSON.stringify({ }));
    });

    $(document).on('click','#vector3',function(){
        copyToClipboard('vector3Copy');
        $.post('http://nrrp_coords/copiedClipboard', JSON.stringify({ }));
    });

    $(document).on('click','#saveLocation',function(){
        xpos = $("#xposText").val();
        ypos = $("#yposText").val();
        zpos = $("#zposText").val();
        hpos = $("#hposText").val();
        description = $("#saveDescription").val();
        type = $("#saveType").val();

        if(description == undefined || description == null || description == "") {
            $("#saveDescription").addClass('is-invalid');
        } else {
            $('#formToFillOut').fadeOut(500);
            $("#saveDescription").removeClass('is-invalid');
            $.post('http://nrrp_coords/saveCoords', JSON.stringify({ 
                xpos: xpos,
                ypos: ypos, 
                zpos: zpos,
                hpos: hpos,
                description: description,
                type: type,
            }));
            setTimeout(function() {
                $('#success').fadeIn(500)
                setTimeout(function() {
                    $("#xposText").val('');
                    $("#yposText").val('');
                    $("#zposText").val('');
                    $("#hposText").val('');
                    $("#saveDescription").val('');
                    $("#saveType").val('');
                    $('#success').fadeOut(500)
                    setTimeout(function() {
                        $('#formToFillOut').fadeIn(500)
                    }, 501);
                }, 1000);
            }, 501);
        }
    });



    $(document).on('click','#closeWindow, #closeWindow2',function(){
        closeWindow();
    });

    $(document).on('click','#save-tab',function(){
        $('#saveType').val('');
        $('#closeWindow').fadeOut(500)
        setTimeout(function() {
            $('#saveLocation').fadeIn(500)
        }, 501);        
    });

    $(document).on('click','#copy1-tab',function(){
        $('#saveLocation').fadeOut(500)
        setTimeout(function() {
            $('#closeWindow').fadeIn(500)
        }, 501);
    });

});

function closeNUI() {
    $('#copy1').removeClass('show').removeClass('active');
    $('#save').addClass('show').addClass('active');
    $('#copy1-tab').removeClass('active');
    $('#save-tab').addClass('active');
    $.post('http://nrrp_coords/closeWindow', JSON.stringify({ }));
}

function closeWindow() {
    $('#staticBackdrop').modal('toggle');
    $('#copy1').removeClass('show').removeClass('active');
    $('#save').addClass('show').addClass('active');
    $('#copy1-tab').removeClass('active');
    $('#save-tab').addClass('active');
    $.post('http://nrrp_coords/closeWindow', JSON.stringify({ }));
}

function updateCoords(x, y, z, h, json) {
    $('#nuiX').html(parseFloat(x));
    $('#nuiY').html(parseFloat(y));
    $('#nuiZ').html(parseFloat(z));
    $('#nuiH').html(parseFloat(h));
    $('#xpos').html(parseFloat(x));
    $('#ypos').html(parseFloat(y));
    $('#zpos').html(parseFloat(z));
    $('#hpos').html(parseFloat(h));
    $('#jsonCopy').html(json)
    $('#stndCopy').html(parseFloat(x) + ', ' + parseFloat(y) + ', ' + parseFloat(z) +', '+ parseFloat(h))
    $('#vector3Copy').html("vector3("+parseFloat(x)+", "+parseFloat(y)+", "+parseFloat(z)+")")
    $('#tableCopy').html("table = { ['x'] = " + parseFloat(x) + ", ['y'] = " + parseFloat(y) + ", ['z'] = " + parseFloat(z) + ", ['h'] = " + parseFloat(h) + " }")
    $('#xposText').val(parseFloat(x));
    $('#yposText').val(parseFloat(y));
    $('#zposText').val(parseFloat(z));
    $('#hposText').val(parseFloat(h));
}

window.addEventListener("message", function (event) {
    if(event.data.action == "openmenu") {
        $('#saveType').val('');
        $('#saveLocation').css({"display":"block"})
        $('#closeWindow').css({"display":"none"})
        $('#staticBackdrop').modal('toggle');
    } else if(event.data.action == "closemenu") {

    } else if(event.data.action == "showCoords") {
        $('#showCoords').fadeIn(500);
    } else if(event.data.action == "hideCoords") {
        $('#showCoords').fadeOut(500);
    } else if(event.data.action == "updateCoords") {
        updateCoords(event.data.x, event.data.y, event.data.z, event.data.h, event.data.json)
    }
});