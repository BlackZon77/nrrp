function round(value, precision) {
	if (Number.isInteger(precision)) {
	  var shift = Math.pow(10, precision);
	  return Math.round(value * shift) / shift;
	} else {
	  return Math.round(value);
	}
} 

window.addEventListener('message', function (event) {
    var item = event.data;
	
		
    if (item.clear == true) {
        $(".items").empty();
    }
    if (item !== undefined && item.display == true) {
		$('#playerid').text(event.data.playerid);
		$('#name').text(event.data.name);
		$('#sex').text(event.data.sex);
		$('#dateofbirth').text(event.data.dateofbirth);
		$('#job').text(event.data.job);
		$('#phone_number').text(event.data.phone_number);
		
		$('#money').text(event.data.money);
		$('#bank_money').text(event.data.bank);
		$('#black_money').text(event.data.black_money);
		
        $(".container").fadeIn(100);
		return;
    }
	
    if (item.display == false) {
        $(".container").fadeOut(100);
    }
});

document.addEventListener('DOMContentLoaded', function () {
    $(".container").hide();
});
