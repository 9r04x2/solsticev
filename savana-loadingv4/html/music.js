defaultVolume = 50

var musicList = {
    1: {
        url : "songs/baitaca.mp3",
        image : "songs/images/baitaca.jpg",
        name : "Do Fundo da Grota",
        singer : "Baitaca"
    },
    2: {
        url : "songs/loseyouself.mp3",
        image : "songs/images/loseyouself.jpg",
        name : "Lose Youself",
        singer : "Eminem"
    },
}


var currentMusicId = 1
const media = document.getElementById('audio');

function updateMusicInfo() {
    $('.music-box-img').attr('src', musicList[currentMusicId]["image"])
    $('.music-box-text').text(musicList[currentMusicId]["name"])
    $('.music-box-title').text(musicList[currentMusicId]["singer"])
}

function startMusic() {
    var audio = document.getElementById('audio');
    updateMusicInfo()

    audio.src = musicList[currentMusicId]["url"]
    audio.load();

    setAudioVolumeTo50Percent();

    togglePlay()
}

document.addEventListener('keydown', function(event) {
    if (event.code === 'Space') {
        event.preventDefault()
        togglePlay()
    }
});

function togglePlay() {
    var audio = document.getElementById('audio');

    if (audio.paused === false) {
        audio.pause();
        $('.music-box-stop-btn-img').attr('src', 'public/music-play-btn.svg')
    } else {
        audio.play();
        $('.music-box-stop-btn-img').attr('src', 'public/music-stop-btn.svg')
    }
  }

  function formatTime(value) {
    const minutes = Math.floor(value / 60);
    const seconds = value % 60;
  
    const formattedMinutes = parseInt(String(minutes).padStart(2, "0"))
    const formattedSeconds = parseInt(String(seconds).padStart(2, "0"))
  
    return formattedMinutes + ":" + formattedSeconds;
}

  function initProgressBar() {
    const currentTime = calculateCurrentValue(media.currentTime);
    $(".music-box-start-num").text(currentTime)

    getAudioDurationFormatted(audio).then(function(duration) {
        $(".music-box-finish-num").text(duration);
    }).catch(function(error) {
        console.error(error);
    });

    if(currentTime) {
      $('.music-text').text(currentTime)
    }
    document.getElementById('skip').addEventListener('click', seek);
  
    media.onended = () => {
      $(ui.play).classList.remove('pause');
      $(".music-box-start-num").text('00:00')
    };
  
    function seek(e) {
      const percent = e.offsetX / this.offsetWidth;
      media.currentTime = percent * media.duration;
    }
    
    calculatePercentPlayed();
  }

  function calculatePercentPlayed() {
    let percentage = (media.currentTime / media.duration).toFixed(2) * 100;
    $('.music-box-process-bar').css('width', percentage+"%")
  }

function seek2(e) {
    const percent = e.offsetX / this.offsetWidth;

    $('.volume-inside').css('width', parseInt(e.offsetX / this.offsetWidth * 100)+"%")

    media.volume = parseFloat(percent).toFixed(1)
    media.volume = parseFloat(percent).toFixed(1)
  }

window.onload=function(){
    document.getElementById('audio').addEventListener('timeupdate', initProgressBar);
}


  function calculateCurrentValue(currentTime) {
    const currentMinute = parseInt(currentTime / 60) % 60;
    const currentSecondsLong = currentTime % 60;
    const currentSeconds = currentSecondsLong.toFixed();
    const currentTimeFormatted = `${currentMinute < 10 ? `${currentMinute}` : currentMinute}:${
    currentSeconds < 10 ? `0${currentSeconds}` : currentSeconds
    }`;
    
    return currentTimeFormatted;
  }


  function skipMusic() {
    if(musicList[currentMusicId+1]) {
        currentMusicId++

        var audio = document.getElementById('audio');
        updateMusicInfo()

        audio.src = musicList[currentMusicId]["url"]
        audio.load();
    }
    else {
        currentMusicId = 0

        var audio = document.getElementById('audio');
        updateMusicInfo()

        audio.src = musicList[currentMusicId]["url"]
        audio.load();
    }
    setAudioVolumeTo50Percent();
    togglePlay()
}

function backMusic() {
    if(musicList[currentMusicId-1]) {
        currentMusicId--

        var audio = document.getElementById('audio');
        updateMusicInfo()

        audio.src = musicList[currentMusicId]["url"]
        audio.load();
    }
    else {
        currentMusicId = 1

        var audio = document.getElementById('audio');
        updateMusicInfo()

        audio.src = musicList[currentMusicId]["url"]
        audio.load();
    }
    setAudioVolumeTo50Percent();
    togglePlay()
}

function getAudioDurationFormatted(audioElement) {
    return new Promise(function(resolve, reject) {
        if(audioElement.paused == false) {
            var duration = audioElement.duration;

            var minutes = Math.floor(duration / 60);
            var seconds = Math.floor(duration % 60);
    
            if (seconds < 10) {
                seconds = "0" + seconds;
            }
    
            var formattedDuration = minutes + ":" + seconds;
            
            if(formattedDuration == "NaN:NaN") {
                formattedDuration = "Loading.."
            }

            resolve(formattedDuration);
    
            audioElement.addEventListener('error', function() {
                reject("Ses dosyası yüklenirken bir hata oluştu.");
            });
        }
    });
}

function adjustAudioVolume(increase) {
    var audio = document.getElementById('audio');
    var currentVolume = audio.volume * 100;

    if (increase && currentVolume < 100) {
        currentVolume += 10;
        if (currentVolume > 100) currentVolume = 100;
    } else if (!increase && currentVolume > 0) {
        currentVolume -= 10;
        if (currentVolume < 0) currentVolume = 0;
    }

    audio.volume = currentVolume / 100;

    $(".music-box-percent-wrapper").text(currentVolume + "%");
}

function setAudioVolumeTo50Percent() {
    var audio = document.getElementById('audio');

    audio.volume = defaultVolume / 100;

    $(".music-box-percent-wrapper").text(defaultVolume + "%");
}