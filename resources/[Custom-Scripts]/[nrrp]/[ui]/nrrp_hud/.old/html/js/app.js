window.addEventListener('message', function (event) {


    switch (event.data.action) {
        case 'updateStatusHud':
            $("body").css("display", event.data.show ? "block" : "none");
            $("#boxSetHealth").css("width", event.data.health + "%");
            $("#boxSetArmour").css("width", event.data.armour + "%");

            widthHeightSplit(event.data.hunger, $("#boxSetHunger"));
            widthHeightSplit(event.data.thirst, $("#boxSetThirst"));
            widthHeightSplit(event.data.oxygen, $("#boxSetOxygen"));
            break;
        case 'tick':    
            if (event.data.speed < 10) {
                $('.speed-val').html('00' + event.data.speed);
            } else if (event.data.speed < 100 && event.data.speed >= 10) {
                $('.speed-val').html('0' + event.data.speed);
            } else {
                $('.speed-val').html(event.data.speed);
            }

            $('.measurement-val').html(event.data.sign);

            if (event.data.speed >= 250) {
                $('.speed-val').addClass('fast');
            } else {
                $('.speed-val').removeClass('fast');
            }

            $('.clock').html(event.data.time + ' <span class="ampm">' + event.data.ampm + '</span>');

            if (event.data.street2 !== '') {
                $('.position').html(event.data.direction + ' <span class="street"><span class="seperator">|</span> ' + event.data.street1 + ' </span><span class="seperator2">-</span> ' + event.data.street2 + ' <span class="area"><span class="seperator">|</span> ' + event.data.area + '</span>');
            } else {
                $('.position').html(event.data.direction + ' <span class="street"><span class="seperator">|</span> ' + event.data.street1 + ' </span><span class="area"><span class="seperator">|</span> ' + event.data.area + '</span>');
            }
            break;
        case 'hidecar':
            $('.car').fadeOut();
            break;
        case 'showcar':
            $('.car').fadeIn();
            break;
        case 'showui':
            $('body').fadeIn();
            break;
        case 'hideui':
            $('body').fadeOut();
            break;
        case 'toggle-seatbelt':
            if ($('.seatbelt').hasClass('on')) {
                $('.seatbelt').addClass('off').removeClass('on');
            } else {
                $('.seatbelt').addClass('on').removeClass('off');
            }
            break;
        case 'set-seatbelt':
            if (!event.data.seatbelt) {
                $('.seatbelt').addClass('off').removeClass('on');
            } else {
                $('.seatbelt').addClass('on').removeClass('off');
            }
            break;
        case 'update-fuel':
            if (event.data.fuel < 100) {
                $('.fuel-val').html('0' + event.data.fuel);
            } else {
                $('.fuel-val').html(event.data.fuel);
            }

            if (event.data.fuel <= 10) {
                $('.fuel-val').addClass('low');
            } else {
                $('.fuel-val').removeClass('low');
            }

            break;
    }
});

function widthHeightSplit(value, ele) {
    let height = 25.5;
    let eleHeight = (value / 100) * height;
    let leftOverHeight = height - eleHeight;

    ele.css("height", eleHeight + "px");
    ele.css("top", leftOverHeight + "px");
};