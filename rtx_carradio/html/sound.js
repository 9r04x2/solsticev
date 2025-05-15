var carradioresourcename = "rtx_carradio";
var soundhandler = {}
var soundcheckerhandler = {}
var soundloop = {}

window.addEventListener('message', function (event) {

	var item = event.data;
	
	if (item.message == "updateresourcename") {
		carradioresourcename = item.carradioresourcenamedata;
	}				
	
	if (item.message == "playsound") {
		if (item.soundcategory == "youtube") {
			if (soundhandler[item.soundid] == undefined) {
				soundloop[item.soundid] = item.soundloop;
				$("body").append("<div id='"+ item.soundid +"'></div>");
				soundhandler[item.soundid] = new YT.Player(""+ item.soundid +"", {

					startSeconds:Number,
					videoId: item.soundsrc,
					origin: window.location.href,
					enablejsapi: 1,
					width: "0",
					height: "0",
					playerVars: {
						playsinline: 1,
						controls: 0,
					},					
					events: {
						'onReady': function(event){
							event.target.unMute();
							event.target.setVolume(0);
							event.target.playVideo();
						},
						'onError': function(event){
							$.post('https://'+carradioresourcename+'/sounderror', JSON.stringify({
								soundid: item.soundid
							}));  								
						},						
						'onStateChange': function(event){
							if (event.data == YT.PlayerState.PLAYING) {
								$.post('https://'+carradioresourcename+'/updatesounddata', JSON.stringify({
									soundid: item.soundid,
									soundname: soundhandler[item.soundid].getVideoData().title,
									soundtime: soundhandler[item.soundid].getCurrentTime(),
									soundtimemax: soundhandler[item.soundid].getDuration()
								}));  
							}
							if (event.data == YT.PlayerState.ENDED) {
								if (soundloop[item.soundid] == true) {
									soundhandler[item.soundid].seekTo(0);
									soundhandler[item.soundid].playVideo();									
								} else {	
									$.post('https://'+carradioresourcename+'/soundend', JSON.stringify({
										soundid: item.soundid
									}));  								
								}	
							}
						}
					}
				});	
			} else {			
				soundloop[item.soundid] = item.soundloop;
				if (typeof soundhandler[item.soundid].setVolume === 'function') {
				  soundhandler[item.soundid].setVolume(item.soundvolume);	
				}			
			}				
		} else {
			if (soundhandler[item.soundid] == undefined) {
				soundloop[item.soundid] = item.soundloop;
				soundhandler[item.soundid] = new Howl({
				  src: item.soundsrc,
				  volume: 0.0,
				  loop: item.soundloop,
				  html5: true,
				  onplay: function(){
					$.post('https://'+carradioresourcename+'/updatesounddata', JSON.stringify({
						soundid: item.soundid,
						soundname: "MP3",
						soundtime: 0,
						soundtimemax: 100
					}));  
				  },				  
				  onend: function() {
					if (soundloop[item.soundid] == false) {
						$.post('https://'+carradioresourcename+'/soundend', JSON.stringify({
							soundid: item.soundid
						}));										
					}						   	 		
				  }  
				});	
				
				soundhandler[item.soundid].play();
			} else {			
				soundloop[item.soundid] = item.soundloop;
				if (typeof soundhandler[item.soundid].volume === 'function') {
					soundhandler[item.soundid].volume(item.soundvolume);
					soundhandler[item.soundid].loop(item.soundloop);	
				}							
				if (soundhandler[item.soundid].playing() == false) {
					soundhandler[item.soundid].play();	
				}				
			}			
		}
	}
	
	if (item.message == "resetsoundplaynew") {
		if (soundhandler[item.soundid] == undefined) {
		} else {
			if (item.soundcategory == "youtube") {
                soundhandler[item.soundid].stopVideo();
                soundhandler[item.soundid].destroy();
                soundhandler[item.soundid] = undefined;
				soundloop[item.soundid] = null;
				$("#'"+ item.soundid +"'").remove();
			} else {
				soundhandler[item.soundid].loop(false)
				soundhandler[item.soundid].stop()
				soundhandler[item.soundid] = undefined;
				soundloop[item.soundid] = null;			
			}			
		}		
		if (item.soundcategory == "youtube") {
			if (soundhandler[item.soundid] == undefined) {
				soundloop[item.soundid] = item.soundloop;
				$("body").append("<div id='"+ item.soundid +"'></div>");
				soundhandler[item.soundid] = new YT.Player(""+ item.soundid +"", {

					startSeconds:Number,
					videoId: item.soundsrc,
					origin: window.location.href,
					enablejsapi: 1,
					width: "0",
					height: "0",
					playerVars: {
						playsinline: 1,
						controls: 0,
					},							
					events: {
						'onReady': function(event){
							event.target.unMute();
							event.target.setVolume(0);
							event.target.playVideo();
						},
						'onError': function(event){
							$.post('https://'+carradioresourcename+'/sounderror', JSON.stringify({
								soundid: item.soundid
							}));  								
						},						
						'onStateChange': function(event){
							if (event.data == YT.PlayerState.PLAYING) {
								$.post('https://'+carradioresourcename+'/updatesounddata', JSON.stringify({
									soundid: item.soundid,
									soundname: soundhandler[item.soundid].getVideoData().title,
									soundtime: soundhandler[item.soundid].getCurrentTime(),
									soundtimemax: soundhandler[item.soundid].getDuration()
								}));  
							}
							if (event.data == YT.PlayerState.ENDED) {
								if (soundloop[item.soundid] == true) {
									soundhandler[item.soundid].seekTo(0);
									soundhandler[item.soundid].playVideo();									
								} else {	
									$.post('https://'+carradioresourcename+'/soundend', JSON.stringify({
										soundid: item.soundid
									}));  								
								}	
							}
						}
					}
				});	
			} else {			
				soundloop[item.soundid] = item.soundloop;
				soundhandler[item.soundid].setVolume(item.soundvolume);		
			}				
		} else {
			if (soundhandler[item.soundid] == undefined) {
				soundloop[item.soundid] = item.soundloop;
				soundhandler[item.soundid] = new Howl({
				  src: item.soundsrc,
				  volume: 0.0,
				  loop: item.soundloop,
				  html5: true,
				  onplay: function(){
					$.post('https://'+carradioresourcename+'/updatesounddata', JSON.stringify({
						soundid: item.soundid,
						soundname: "MP3",
						soundtime: 0,
						soundtimemax: 100
					}));  
				  },				  
				  onend: function() {
					if (soundloop[item.soundid] == true) {								
					} else {	
						$.post('https://'+carradioresourcename+'/soundend', JSON.stringify({
							soundid: item.soundid
						}));  								
					}						   		
				  }  
				});	
				
				soundhandler[item.soundid].play();
			} else {			
				soundloop[item.soundid] = item.soundloop;
				soundhandler[item.soundid].volume(item.soundvolume);
				soundhandler[item.soundid].loop(item.soundloop);
				if (soundhandler[item.soundid].playing() == false) {
					soundhandler[item.soundid].play();	
				}				
			}			
		}
	}	
	if (item.message == "addmusictoplaylist") {
		if (item.soundcategory == "youtube") {
			$("body").append("<div id='"+ item.soundid +"xx'></div>");
			soundcheckerhandler[""+ item.soundid +"xx"] = new YT.Player(""+ item.soundid +"xx", {
				startSeconds:Number,
				videoId: item.soundsrc,
				origin: window.location.href,
				enablejsapi: 1,
				width: "0",
				height: "0",
				playerVars: {
					playsinline: 1,
					controls: 0,
				},			
				events: {
					'onReady': function(event){
						event.target.setVolume(0);
						event.target.playVideo();
					},							
					'onStateChange': function(event){
						if (event.data == YT.PlayerState.PLAYING) {
							$.post('https://'+carradioresourcename+'/setplaylistdata', JSON.stringify({
								soundid: item.soundid,
								soundidplaylist: item.soundidplaylist,
								soundname: soundcheckerhandler[""+ item.soundid +"xx"].getVideoData().title,
								soundtimemax: soundcheckerhandler[""+ item.soundid +"xx"].getDuration()
							}));  
							soundcheckerhandler[""+ item.soundid +"xx"].stopVideo();
							soundcheckerhandler[""+ item.soundid +"xx"].destroy();
							soundcheckerhandler[""+ item.soundid +"xx"] = null;					
						}
					}
				}
			});						
		}
		if (item.soundcategory == "classic") {
			soundcheckerhandler[""+ item.soundid +"xx"] = new Howl({
			  src: item.soundsrc,
			  volume: 0.0,
			  loop: false,
			  html5: true,
			  onplay: function(){
				$.post('https://'+carradioresourcename+'/setplaylistdata', JSON.stringify({
					soundid: item.soundid,
					soundidplaylist: item.soundidplaylist,
					soundname: "MP3",
					soundtimemax: soundcheckerhandler[""+ item.soundid +"xx"].duration()
				}));  	
				soundcheckerhandler[""+ item.soundid +"xx"].loop(false)
				soundcheckerhandler[""+ item.soundid +"xx"].stop()
				soundcheckerhandler[""+ item.soundid +"xx"] = null;						
			  }			  				   		 
			});	
			soundcheckerhandler[""+ item.soundid +"xx"].play();
		}
	}
	if (item.message == "checkmusicurl") {
		$("body").append("<div id='videourlcheckyoutube'></div>");
		soundcheckerhandler["videourlcheckyoutube"] = new YT.Player("videourlcheckyoutube", {
			startSeconds:Number,
			videoId: item.soundsrc,
			origin: window.location.href,
			enablejsapi: 1,
			width: "0",
			height: "0",
			playerVars: {
				playsinline: 1,
				controls: 0,
			},				
			events: {
				'onReady': function(event){
					event.target.setVolume(0);
					event.target.playVideo();
				},		
				'onError': function(event){
					$.post('https://'+carradioresourcename+'/checkdone', JSON.stringify({
						soundallowed: false,
					}));  
					soundcheckerhandler["videourlcheckyoutube"].stopVideo();
					soundcheckerhandler["videourlcheckyoutube"].destroy();
					soundcheckerhandler["videourlcheckyoutube"] = null;						
				},						
				'onStateChange': function(event){
					if (event.data == YT.PlayerState.PLAYING) {
						$.post('https://'+carradioresourcename+'/checkdone', JSON.stringify({
							soundallowed: true,
						}));  
						soundcheckerhandler["videourlcheckyoutube"].stopVideo();
						soundcheckerhandler["videourlcheckyoutube"].destroy();
						soundcheckerhandler["videourlcheckyoutube"] = null;					
					}
				}
			}					
		});										
	}	
	if (item.message == "updatesounddata") {
		if (soundhandler[item.soundid] == undefined) {
		} else {
			if (item.soundcategorytype == "youtube") {
				if (soundhandler[item.soundid].getPlayerState() == 1) {
					$.post('https://'+carradioresourcename+'/updatesounddata', JSON.stringify({
						soundid: item.soundid,
						soundname: soundhandler[item.soundid].getVideoData().title,
						soundtime: soundhandler[item.soundid].getCurrentTime(),
						soundtimemax: soundhandler[item.soundid].getDuration()
					}));  										
				}
			} else {
				if (soundhandler[item.soundid].playing() == true) {
					$.post('https://'+carradioresourcename+'/updatesounddata', JSON.stringify({
						soundid: item.soundid,
						soundname: "MP3",
						soundtime: soundhandler[item.soundid].seek(),
						soundtimemax: soundhandler[item.soundid].duration()
					}));  
				}					
			}			
		}
	}		
	
	if (item.message == "setsoundtime") {
		if (soundhandler[item.soundid] == undefined) {
		} else {
			if (item.soundcategorytype == "youtube") {
				soundhandler[item.soundid].seekTo(item.timedata);
			} else {
				soundhandler[item.soundid].seek(item.timedata);
			}			
		}
	}			
	
	if (item.message == "stopsound") {
		if (soundhandler[item.soundid] == undefined) {
		} else {
			if (item.soundcategorytype == "youtube") {
                soundhandler[item.soundid].stopVideo();
                soundhandler[item.soundid].destroy();
                soundhandler[item.soundid] = null;
				soundloop[item.soundid] = null;
				$("#'"+ item.soundid +"'").remove();
			} else {
				soundhandler[item.soundid].loop(false)
				soundhandler[item.soundid].stop()
				soundhandler[item.soundid] = null;
				soundloop[item.soundid] = null;			
			}			
		}
	}		
});