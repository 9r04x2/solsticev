canUseEsc = true;
fingerprint = false;
WantedList= [];
WantedHistList = [];
HistoryList = [];
crid = 0;
$(window).ready(function() {
    window.addEventListener('message', (event) => {
        let data = event.data;
        switch (data.action) {
          case "open":
            $("body").show('fade');
            $(".main").show();
            $(".scanning p").html('Scanning...');
            $(".cancel-scan").show();
            $(".refuse-scan").hide();
            canUseEsc = true;
            fingerprint = false;
          break;  
          case 'close':
            canUseEsc = true;
            Close();
          break;
          case 'refused':
            $(".main").show("fade");
            $(".scanning").hide('fade');
          break
          case 'fingerprint':
            $("body").show('fade');
            $(".main").hide();
            $(".scan").hide("fade");
            $(".wanted-menu").hide("fade");
            $(".wanted-new").hide("fade");
            $(".wanted-reason").hide("fade");
            $(".wanted-list").hide("fade");
            $(".wanted-why").hide("fade");
            $(".history").hide("fade");
            $(".scanning").show();
            $(".scanning p").html('Sensöre parmağınızı koyun (Uzun Basın)');
            $(".refuse-scan").show();
            $(".cancel-scan").hide();
            canUseEsc = false;
            fingerprint = true;
          break;
          case 'scanResult':       
            result = data.result;
            $(".scanning").hide("fade");
            $(".scan").show("fade");
            $(".a-id").val(result.id);
            $(".a-fn").val(result.name);
            $(".a-g").val(result.gender);
            $(".a-bd").val(result.dateofbirth);
            $(".a-wtd").val(result.wanted);
            $(".a-gshot").val(result.gunshot);
          break;
        }
    });
});


var longpress = 800;
var start;
var timer;
$(".container").on( 'mousedown', function( e ) {
    if(fingerprint == false) return;
    start = new Date().getTime();
    timer = setTimeout(function(){  
        fingerprint = false;
        canUseEsc = true;
        $.post("https://s4-fingerprint/allowShareMyData");
        $("body").hide();
        setTimeout(Close, 1000);
    }, longpress)
}).on( 'mouseleave', function( e ) {
    start = 0;
    clearTimeout(timer);
}).on( 'mouseup', function( e ) {
    if ( new Date().getTime() < ( start + longpress )  ) {
       clearTimeout(timer);
       $.post("https://s4-fingerprint/notify", JSON.stringify({ 
            title: 'Fingerprint',
            message: 'İşlem tamamlanana kadar parmağınızı sensör üzerinde tutun.',
            type: 'error'
     })); 
    }
});
 

$(document).on('click', '.scan button', async function () {
    const src = $(this).attr('data-src');
    if(src == 'back') {
        $(".scan").hide("fade");
        $(".main").show("fade");
        return;
    }
});



$(document).on('click', ".cancel-scan", function () {
    $.post('http://s4-fingerprint/cancelScan');
    $(".main").show("fade");
    $(".scanning").hide("fade");
});

$(document).on('click', ".refuse-scan", function () {
    $.post('http://s4-fingerprint/refuse');
    $.post('http://s4-fingerprint/close');
    $("body").hide("fade");
});

$(document).on('click', '.button-box button', async function () {
    const src = $(this).attr('data-src');
    switch (src) {
        case 'close':
            Close();
        break;
        case "cancel-scan":
            $(".main").show("fade");
            $(".scanning").hide("fade");
        break;
        case 'scan':
         $(".main").hide("fade");
         $(".scanning").show("fade");
         await wait(1000);
         $.post('http://s4-fingerprint/scan', JSON.stringify({}) , function(result) {
            if(result == 'error') {
                $(".main").show("fade");
                $(".scanning").hide("fade");
            }
         });
        break;
        case 'history':
            $(".main").hide("fade");
            $(".scanning").hide("fade");
            $(".history").show("fade");
            $(".history-list").html("");
            $.post("https://s4-fingerprint/history", {}, function (data) {
                HistoryList = data;
                $.each(data, function (i, v) { 
                    $(".history-list").append(`<button data-src="show-history" data-id="${v.uniq}">${v.name}<p>${v.added_who} | ${v.added_time}</p></button>`);
                });
            });
        break;
        case 'wanted': 
            $(".main").hide("fade");
            $(".wanted-menu").show("fade");
        break;
        case 'back':
            $(".scan").hide("fade");
            $(".scanning").hide("fade");
            $(".wanted-menu").hide("fade");
            $(".wanted-new").hide("fade");
            $(".wanted-reason").hide("fade");
            $(".wanted-list").hide("fade");
            $(".wanted-why").hide("fade");
            $(".history").hide("fade");
            $(".main").show("fade");
            $.post("https://s4-fingerprint/enableNui");
        break;
        case 'wanted-list':
            $(".main").hide("fade");
            $(".wanted-list").show("fade");
            $(".wanted-player-list").html("");
            $.post("https://s4-fingerprint/wantedList", {}, function (data) {
                WantedHistList = data;
                $.each(data, function (i, v) { 
                    $(".wanted-player-list").append(`<button data-src="show-wtd" data-id="${v.id}">${v.name}</button>`);
                });
            });
        break;
        case 'new-wanted':
            $(".main").hide("fade");
            $(".wanted-new").show("fade");
            $(".wanted-player-list").html("");
            $.post("https://s4-fingerprint/playerList", {}, function (data) {
                WantedList = data;
                $.each(data, function (i, v) { 
                    $(".wanted-player-list").append(`<button data-src="add-wtd" data-id="${v.id}">${v.name}</button>`);
                });
            });
        break;
        case 'add-to-wanted':
            $.post("https://s4-fingerprint/enableNui");
            $(".wanted-reason").hide("fade");
            wantedPerson = WantedList.find(x => x.id == crid)
            wantedPerson.reason = $(".wanted-reason textarea").val() || "Sebep bulunmuyor";
            $.post("https://s4-fingerprint/addToWanted", JSON.stringify(wantedPerson));
        break;
        case "remove-wanted":
            $(".wanted-why").hide("fade");
            $(".wanted-list").hide("fade");
            $(".main").show("fade");
            wantedPerson = WantedHistList.find(x => x.id == crid);
            $.post("https://s4-fingerprint/removeWanted", JSON.stringify(wantedPerson));
        break;
    }
});

$(document).on('click', '.wanted-player-list button', function () {
     const src = $(this).attr('data-src');
     if(src == 'add-wtd') {
        crid = $(this).attr('data-id');
        wantedname = WantedList.find(x => x.id == crid).name;
        $(".wanted-reason").show("fade");
        $(".wanted-new").hide("fade");
        $(".person-name").html(wantedname);
        $.post("https://s4-fingerprint/disableFullNui");
     }else if(src == 'show-wtd') {
        crid = $(this).attr('data-id');
        wantedPerson = WantedHistList.find(x => x.id == crid);
        $(".wanted-why").show("fade");
        $(".wanted-menu").hide("fade");
        $(".w-date").val(wantedPerson.added_time);
        $(".w-fn").val(wantedPerson.name);
        $(".w-ofc").val(wantedPerson.added_who);
        $(".w-reason").val(wantedPerson.reason);
     } 
});

$(document).on('click', '.history-list button', function () {
    const src = $(this).attr('data-src');
    uniq = $(this).attr('data-id');
    result = HistoryList.find(x => x.uniq == uniq);
    $(".history").hide("fade");
    $(".scan").show("fade");
    $(".a-id").val(result.id);
    $(".a-fn").val(result.name);
    $(".a-g").val(result.gender);
    $(".a-bd").val(result.dateofbirth);
    $(".a-wtd").val(result.wanted);
    $(".a-gshot").val(result.gunshot);
});

async function wait(ms) {
    return new Promise(resolve => {
        setTimeout(resolve, ms);
    });
}

$(document).keydown(function(e) {
    if (e.key === "Escape") {  Close(); }
});

Close = () => {
    if(canUseEsc == false) return;
    $("body").hide('fade');
    $(".main").hide();
    $(".main").hide();
    $.post('http://s4-fingerprint/close');
}