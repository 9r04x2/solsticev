var carradioresourcename = "rtx_carradio";

var ineditmenu = "false";

$(function () {
	var currentscale = 1.0;
    if (localStorage.default == "false") {
    } else {
        localStorage.scale = 1.0;
		localStorage.color = "#ff66ff";
    }
    
    let defaultValues = {radiotop: "55", radioleft: "70", scale: "1.0", color: "#ff66ff",};

	var volumeslider = document.getElementById("volumesliderdata");
	
	var scaleslider = document.getElementById("scalesliderdata");
	
	var radiochangercolor = document.getElementById("color-picker");

	var urltypedata = "";

	function closeMain() {
		$("body").css("display", "none");
	}

	function openMain() {
		$("body").css("display", "block");
	}

	$(".turnoffradio").click(function(){
		if ($(".radio-container").data('draggable')) {
			ChangeRadio(); 
			$(".radio-container").draggable("destroy");
		}	
		$("#radiourlshow").hide();
		ineditmenu = "false";
		$("#radioeditshow").hide();						
		$.post('https://'+carradioresourcename+'/quit', JSON.stringify({}));
	});

	$(".closeradiourl").click(function(){
		urltypedata = "";
		$("#radiourlshow").hide();	
	});
	
	$(".closeradioplaylist").click(function(){
		$("#radioplaylistshow").hide();	
	});	

	function fontResizer(outputSelector){
		const maxFontSize = 32;
		let outputDiv = document.getElementById(outputSelector);
		let width = outputDiv.clientWidth;
		let contentWidth = outputDiv.scrollWidth;
		let fontSize = parseInt(window.getComputedStyle(outputDiv, null).getPropertyValue('font-size'),10);
		if (contentWidth > width){
			fontSize = Math.ceil(fontSize * width/contentWidth,10);
			fontSize =  fontSize > maxFontSize  ? fontSize = maxFontSize  : fontSize - 1;
			outputDiv.style.fontSize = fontSize+'px';   
		}else{
			while (contentWidth === width && fontSize < maxFontSize){
				fontSize = Math.ceil(fontSize) + 1;
				fontSize = fontSize > maxFontSize  ? fontSize = maxFontSize  : fontSize;
				outputDiv.style.fontSize = fontSize+'px';   
				width = outputDiv.clientWidth;
				contentWidth = outputDiv.scrollWidth;
				if (contentWidth > width){
					outputDiv.style.fontSize = fontSize-1+'px'; 
				}
			}
		}
	}

    function draggableElements() {
		$(".radio-container").draggable({
            scroll: false,
            axis: "x, y",
            cursor: "move"
        });	
		$(".radio-container").css("transform", "scale(" + localStorage.scale + ")");	
    };		
	
	function currentsliderdata() {
        if (localStorage.default === "true") {
			if (defaultValues.scale == 0.5) {
				return 5;
			} else if (defaultValues.scale == 0.6) {
				return 6;
			} else if (defaultValues.scale == 0.7) {
				return 7;
			} else if (defaultValues.scale == 0.8) {
				return 8;
			} else if (defaultValues.scale == 0.9) {
				return 9;
			} else if (defaultValues.scale == 1.0) {
				return 10;
			} else if (defaultValues.scale == 1.0) {
				return 10;
			} else if (defaultValues.scale == 1.1) {
				return 11;	
			} else if (defaultValues.scale == 1.2) {
				return 12;		
			} else if (defaultValues.scale == 1.3) {
				return 13;	
			} else if (defaultValues.scale == 1.4) {
				return 14;			
			} else if (defaultValues.scale == 1.5) {
				return 15;			
			}	
        } else {
			if (localStorage.scale == 0.5) {
				return 5;
			} else if (localStorage.scale == 0.6) {
				return 6;
			} else if (localStorage.scale == 0.7) {
				return 7;
			} else if (localStorage.scale == 0.8) {
				return 8;
			} else if (localStorage.scale == 0.9) {
				return 9;
			} else if (localStorage.scale == 1.0) {
				return 10;
			} else if (localStorage.scale == 1.0) {
				return 10;
			} else if (localStorage.scale == 1.1) {
				return 11;	
			} else if (localStorage.scale == 1.2) {
				return 12;		
			} else if (localStorage.scale == 1.3) {
				return 13;	
			} else if (localStorage.scale == 1.4) {
				return 14;			
			} else if (localStorage.scale == 1.5) {
				return 15;			
			}	  			
		} 			
	}	
	
    function ChangeRadio() {      
        if (localStorage.default === "true") {
            let root = document.documentElement;
			var radiotop = defaultValues.radiotop + "%";
            var radioleft = defaultValues.radioleft + '%';
            $('.radio-container').css({
                position:'absolute',
                top:radiotop,
                left:radioleft
            });	
			localStorage.scale = defaultValues.scale;
			localStorage.color = defaultValues.color;
			scaleslider.value = currentsliderdata();	
			currentscale = defaultValues.scale;
			root.style.setProperty('--color', defaultValues.color);
			$("#color-picker").spectrum("set", defaultValues.color);
			$(".radio-container").css("transform", "scale(" + defaultValues.scale + ")");					           
        } else {
			let root = document.documentElement;
			var radiotop = localStorage.radiotop + 'px';
            var radioleft = localStorage.radioleft + 'px';	
			var scaledata = localStorage.scale;
			var color = localStorage.color;
			var rgbreformat = localStorage.color;
            $('.radio-container').css({
                position:'absolute',
                top:radiotop,
                left:radioleft
            });
			$("#color-picker").spectrum("set", localStorage.color);
			scaleslider.value = currentsliderdata();	
			root.style.setProperty('--color', color);	
			$(".radio-container").css("transform", "scale(" + scaledata + ")");	
        }
    };	
	
    function ResetRadioToDefault() {      
		let root = document.documentElement;
		var radiotop = defaultValues.radiotop + "%";
		var radioleft = defaultValues.radioleft + '%';
		$('.radio-container').css({
			position:'absolute',
			top:radiotop,
			left:radioleft
		});	
		localStorage.scale = defaultValues.scale;
		localStorage.color = defaultValues.color;
		scaleslider.value = currentsliderdata();	
		currentscale = defaultValues.scale;
		root.style.setProperty('--color', defaultValues.color);
		$("#color-picker").spectrum("set", defaultValues.color);
		$(".radio-container").css("transform", "scale(" + defaultValues.scale + ")");	
    };		

	window.addEventListener('message', function (event) {

		var item = event.data;

		if (item.message == "radioshow") {
			if (item.musicplaying == true) {	
				volumeslider.value = item.musicvolumedata;	
				document.getElementsByClassName("musicdurationtext")[0].innerHTML = item.musicdurationtext;
				if (item.musicupdate == true) {	
					document.getElementsByClassName("musictextlabel")[0].innerHTML = item.musiclabel;
					document.getElementById("musictextlabeldata1").innerHTML = item.musiclabel;
					document.getElementById("musictextlabeldata2").innerHTML = item.musiclabel;
					fontResizer("musictextlabeldata1");
					fontResizer("musictextlabeldata2");
				}
				$("#volumesliderdata").show();	
				$("#musicdurationmainshow").show();	
				$(".musicvolumeicon").show();	
			} else {
				document.getElementsByClassName("musicdurationtext")[0].innerHTML = "";
				if (item.musicupdate == true) {	
					document.getElementById("musictextlabeldata1").innerHTML = item.musiclabel;
					document.getElementById("musictextlabeldata2").innerHTML = item.musiclabel;
					fontResizer("musictextlabeldata1");
					fontResizer("musictextlabeldata2");
				}
				$("#volumesliderdata").hide();	
				$("#musicdurationmainshow").hide();	
				$(".musicvolumeicon").hide();	
				if (item.musiclivefm == true) {
					volumeslider.value = item.musicvolumedata;	
					$("#volumesliderdata").show();	
					$(".musicvolumeicon").show();						
				}	
			}
			if (item.musiccategory == "youtube") {
				if (item.musicloopdata == true) {	
					$(".radioloopbutton").css("color", localStorage.color);
				} else {
					$(".radioloopbutton").css("color", "#ffffff");
				}				
				$("#leftbuttonshow").hide();	
				$("#rightbuttonshow").hide();
				$("#radiopausebuttonshow").show();	
				$("#radioplaylistbuttonshow").show();	
				$("#radioloopbuttonshow").show();	
				$(".radioytbutton").css("color", localStorage.color);
				$(".radiomp3button").css("color", "#5D5D5D");
				$(".radiofmbutton").css("color", "#5D5D5D");
			} else if (item.musiccategory == "classic") {
				if (item.musicloopdata == true) {	
					$(".radioloopbutton").css("color", localStorage.color);
				} else {
					$(".radioloopbutton").css("color", "#ffffff");
				}							
				$("#leftbuttonshow").hide();	
				$("#rightbuttonshow").hide();	
				$("#radiopausebuttonshow").show();	
				$("#radioplaylistbuttonshow").show();	
				$("#radioloopbuttonshow").show();	
				$(".radioytbutton").css("color", "#5D5D5D");
				$(".radiomp3button").css("color", localStorage.color);
				$(".radiofmbutton").css("color", "#5D5D5D");			
			} else if (item.musiccategory == "fm") {	
				$("#radioplaylistbuttonshow").hide();	
				$("#radioloopbuttonshow").hide();					
				$("#leftbuttonshow").show();	
				$("#rightbuttonshow").show();
				$("#radiopausebuttonshow").show();					
				$(".radioytbutton").css("color", "#5D5D5D");
				$(".radiomp3button").css("color", "#5D5D5D");
				$(".radiofmbutton").css("color", localStorage.color);	
			} else {
				$("#radioplaylistbuttonshow").hide();	
				$("#radioloopbuttonshow").hide();					
				$("#leftbuttonshow").hide();	
				$("#rightbuttonshow").hide();	
				$("#radiopausebuttonshow").hide();	
				$(".radioytbutton").css("color", "#5D5D5D");
				$(".radiomp3button").css("color", "#5D5D5D");
				$(".radiofmbutton").css("color", "#5D5D5D");			
			}
			$('.musicdurationmaindata').css("width", item.musicprogressdata+"%")
			$("#radioshow").show();	
			openMain();
		}	
		
		if (item.message == "radiourlshow") {
			$("#musicinputdata").val(""); 
			document.getElementsByClassName("radiourlmaintext")[0].innerHTML = item.musiclabel;
			urltypedata = item.musicradiotype;
			$("#radiourlshow").show();	
			openMain();
		}	
		
		if (item.message == "radioplaylistshow") {
			$( ".radioplaylists" ).empty()
			$("#radioplaylistshow").show();	
			openMain();
		}	

		if (item.message == "addplaylist"){
			$( ".radioplaylists" ).append('<div class="radioplaylist">' +
					'<div class="radioplaylistduration">' + item.radioplaylistdurationdata + '</div><div class="radioplaylistlabel">' + item.radioplaylistlabeldata + '</div><div class="radioplaylistremove" vehicleid="' + item.vehicleiddata + ' "playlistid="' + item.playlistiddata + '"><i class="fa-solid fa-trash"></i></div>' + 
			'</div>');	
		}			
		
		if (item.message == "radiosettingsloadfirst") {
			carradioresourcename = item.carradioresourcenamedata;
			defaultValues.radiotop = item.radiopositiontopdata;
			defaultValues.radioleft = item.radiopositionleftdata;
			defaultValues.scale = item.radioscaledata;
			defaultValues.color = item.radiocollordata;
			if (localStorage.default == "false") {
			} else {
				localStorage.default = "true";
			}
			ChangeRadio(); 
		}	
		
		if (item.message == "radiosettingsload") {
			carradioresourcename = item.carradioresourcenamedata;
			defaultValues.radiotop = item.radiopositiontopdata;
			defaultValues.radioleft = item.radiopositionleftdata;
			defaultValues.scale = item.radioscaledata;
			defaultValues.color = item.radiocollordata;
			if (localStorage.default == "false") {
			} else {
				localStorage.default = "true";
				if (ineditmenu == "false") {
					ResetRadioToDefault();
				}					
			}
		}			

		if (item.message == "radioreset") {
			localStorage.default = "true";
			ChangeRadio(); 
		}						
		
		if (item.message == "hide") {
			closeMain();
		}
		document.onkeyup = function (data) {
			if (open) {
				if (data.which == 27) {
					if ($(".radio-container").data('draggable')) {
						ChangeRadio(); 
						$(".radio-container").draggable("destroy");
					}	
					$("#radiourlshow").hide();
					ineditmenu = "false";
					$("#radioeditshow").hide();						
					$.post('https://'+carradioresourcename+'/quit', JSON.stringify({}));
				}
			}	
		};	
	});

	$(".radiofmbutton").click(function () {
		$.post('https://'+carradioresourcename+'/fmradioenable', JSON.stringify({}));
	});

	$(".radioytbutton").click(function () {
		$.post('https://'+carradioresourcename+'/youtuberadiourl', JSON.stringify({}));
	});

	$(".radiomp3button").click(function () {
		$.post('https://'+carradioresourcename+'/mp3radiourl', JSON.stringify({}));
	});

	$(".leftbutton").click(function () {
		$.post('https://'+carradioresourcename+'/fmradioleft', JSON.stringify({}));
	});

	$(".rightbutton").click(function () {
		$.post('https://'+carradioresourcename+'/fmradioright', JSON.stringify({}));
	});

	$(".radiopausebutton").click(function () {
		$.post('https://'+carradioresourcename+'/radiostop', JSON.stringify({}));
	});
	
	$(".radioloopbutton").click(function () {
		$.post('https://'+carradioresourcename+'/loopchange', JSON.stringify({}));
	});	

	$(".buttonplayradionewurl").click(function () {
		if (!urltypedata == "") {
			$.post('https://'+carradioresourcename+'/radionewurl', JSON.stringify({
				musicurldata: $("#musicinputdata").val().trim(),
				musicurltype: urltypedata
			}));
			urltypedata = "";
			$("#radiourlshow").hide();	
		}	
	});
	$(".closeradioedit").click(function(){
		ChangeRadio(); 
		ineditmenu = "false";
		$(".radio-container").draggable("destroy");
		$("#radioeditshow").hide();	
	});	
	
	$(".radiosettingsbutton").click(function(){
		draggableElements();
		ineditmenu = "true";
		$("#radioeditshow").show();	
	});	
	
	$(".buttonradioeditreset").click(function(){
		localStorage.default = "true";
        ChangeRadio(); 
	});		
	
	$(".radioplaylistbutton").click(function(){
		$.post('https://'+carradioresourcename+'/playlistcheck', JSON.stringify({}));
	});		
	
	$(".radioplaylists").on("click", ".radioplaylistremove", function() {
		$("#radioplaylistshow").hide();	
		var $playlisthandler = $(this);
		var $vehiclenetworkiddata = $playlisthandler.attr('vehicleid')	
		var $playlistiddata = $playlisthandler.attr('playlistid')	
		$.post('https://'+carradioresourcename+'/removeplaylistmusic', JSON.stringify({
			vehiclenetworkiddata: $vehiclenetworkiddata,
			playlistiddata: $playlistiddata,
		}));
	});		
	
	$(".buttonradioeditsave").click(function(){
        $(".radio-container").draggable("disable")
		localStorage.default = "false";
        var radiopos = $(".radio-container").position();
        localStorage.radiotop = radiopos.top;
        localStorage.radioleft = radiopos.left;	
		localStorage.scale = currentscale;
		localStorage.color = $("#color-picker").spectrum("get");
        ChangeRadio(); 
		$(".radio-container").draggable("destroy");
		ineditmenu = "false";
		$("#radioeditshow").hide();	
	});		
   $(document).ready(function() {	
		$(".sp-container").on({
		  click: function(){
			let root = document.documentElement;
			var value = $("#color-picker").val();
			var hexstring = $("#color-picker").spectrum("get");
			root.style.setProperty('--color', hexstring);
			localStorage.color = hexstring;
		  }, 
		  change: function(){
			let root = document.documentElement;
			var value = $("#color-picker").val();
			root.style.setProperty('--color', hexstring);
			var hexstring = $("#color-picker").spectrum("get");
			localStorage.color = hexstring;
		  } 		  
		});	
		
    });	
	scaleslider.oninput = function() {
		if (this.value == 5) {
			$(".radio-container").css("transform", "scale(0.5)");
			currentscale = 0.5;
		} else if (this.value == 6) {
			$(".radio-container").css("transform", "scale(0.6)");
			currentscale = 0.6;	
		} else if (this.value == 7) {
			$(".radio-container").css("transform", "scale(0.7)");
			currentscale = 0.7;				
		} else if (this.value == 8) {
			$(".radio-container").css("transform", "scale(0.8)");
			currentscale = 0.8;				
		} else if (this.value == 9) {
			$(".radio-container").css("transform", "scale(0.9)");
			currentscale = 0.9;	
		} else if (this.value == 10) {
			$(".radio-container").css("transform", "scale(1.0)");
			currentscale = 1.0;	
		} else if (this.value == 11) {
			$(".radio-container").css("transform", "scale(1.1)");
			currentscale = 1.1;
		} else if (this.value == 12) {
			$(".radio-container").css("transform", "scale(1.2)");
			currentscale = 1.2;		
		} else if (this.value == 13) {
			$(".radio-container").css("transform", "scale(1.3)");
			currentscale = 1.3;	
		} else if (this.value == 14) {
			$(".radio-container").css("transform", "scale(1.4)");
			currentscale = 1.4;
		} else if (this.value == 15) {
			$(".radio-container").css("transform", "scale(1.5)");
			currentscale = 1.5;								
		}	  
	}	
    $('#color-picker').spectrum({
		preferredFormat: "rgb",
		showInput: true,
		showPalette: false,
		allowEmpty:false,
		showAlpha: false,
		showButtons: false
    });		
})

function getOrigin(elm) {
  var box = (elm.getBoundingClientRect) ? elm.getBoundingClientRect() : {
      top: 0,
      left: 0
    },
    doc = elm && elm.ownerDocument,
    body = doc.body,
    win = doc.defaultView || doc.parentWindow || window,
    docElem = doc.documentElement || body.parentNode,
    clientTop = docElem.clientTop || body.clientTop || 0,
    clientLeft = docElem.clientLeft || body.clientLeft || 0;

  return {
    left: box.left + (win.pageXOffset || docElem.scrollLeft) - clientLeft,
    top: box.top + (win.pageYOffset || docElem.scrollTop) - clientTop
  };
}

function volumechange(e) {
	$.post('https://'+carradioresourcename+'/volumechange', JSON.stringify({
		volumedata: e.value
	})); 
}

function ChangeDuration(e) {
	var parentOffset = $("#musicdurationmainshow").parent().offset();
	var relX = e.pageX - parentOffset.left;
	var perc = relX / $("#musicdurationmainshow").width() * 100;
	$.post('https://'+carradioresourcename+'/durationchange', JSON.stringify({
		durationdata: perc
	})); 
}	