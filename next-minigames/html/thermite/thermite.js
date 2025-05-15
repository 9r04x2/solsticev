let timer_start, timer_game, timer_finish, timer_time, good_positions, wrong, right, speed, timerStart, positions;
let game_started = false;
let streak = 0;
let max_streak = 0;
let best_time = 99.999;

let mode = 'jewelry';
let mode_data = {};
mode_data['vault'] = [36, 14];
mode_data['jewelry'] = [25, 10];

data = {
    "time": 0
}


const sleep = (ms, fn) => {return setTimeout(fn, ms)};

const range = (start, end, length = end - start + 1) => {
    return Array.from({length}, (_, i) => start + i)
}

const shuffle = (arr) => {
    for (let i = arr.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        const temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
}

window.addEventListener('message', (event) => {
    switch (event.data.type) {
        case "thermiteDisplay":
            if (event.data.display == true) {
                $(".thermite-minigame").css("display", "block")
                data.time = event.data.data.time
                mode = event.data.data.type
                reset();
            } else {
                $(".thermite-minigame").css("display", "none")
            }
        break;
    }
});

function listener(ev) {
    if(!game_started) return;

    if( good_positions.indexOf( parseInt(ev.target.dataset.position) ) === -1 ){
        wrong++;
        ev.target.classList.add('bad');
    }else{
        right++;
        ev.target.classList.add('good');
    }

    ev.target.removeEventListener('mousedown', listener);

    check();
}

function addListeners(){
    document.querySelectorAll('.group').forEach(el => {
        el.addEventListener('mousedown', listener);
    });
}

function check() {
    if(wrong === 3){
        resetTimer();
        game_started = false;
        streak = 0;

        let blocks = document.querySelectorAll('.group');
        good_positions.forEach( pos => {
            blocks[pos].classList.add('proper');
        });
        //error post
        $.post("http://next-minigames/thermiteCheck", JSON.stringify({
            success: false
        }));
        return;
    }
    if(right === mode_data[mode][1]){
        // succses post
        $.post("http://next-minigames/thermiteCheck", JSON.stringify({
            success: true
        }));
    }
}

function reset() {
    game_started = false;

    resetTimer();
    clearTimeout(timer_start);
    clearTimeout(timer_game);
    clearTimeout(timer_finish);

    document.querySelector('.splash').classList.remove('hidden');
    document.querySelector('.groups').classList.add('hidden');

    document.querySelectorAll('.group').forEach(el => { el.remove(); });

    start();
}

// 2.07.2021 15:22 TEST İÇİN KAPATTIM -TORCHZ
// start();

function start(){
    wrong = 0;
    right = 0;

    positions = range(0, mode_data[mode][0] - 1);
    shuffle(positions);
    good_positions = positions.slice(0, mode_data[mode][1]);

    let div = document.createElement('div');
    div.classList.add('group');
    const groups = document.querySelector('.groups');
    if (mode == "jewelry" ){
        $(".groups").addClass("jewelry")
    }
    for(let i=0; i < mode_data[mode][0]; i++){
        let group = div.cloneNode();
        group.dataset.position = i.toString();
        groups.appendChild(group);
    }

    addListeners();


    timer_start = sleep(2000, function(){
        document.querySelector('.splash').classList.add('hidden');
        document.querySelector('.groups').classList.remove('hidden');

        let blocks = document.querySelectorAll('.group');
        good_positions.forEach( pos => {
            blocks[pos].classList.add('good');
        });

        timer_game = sleep(4000, function(){
            document.querySelectorAll('.group.good').forEach(el => { el.classList.remove('good')});
            game_started = true;

            startTimer();
            speed = 10; //time
            timer_finish = sleep((speed * 1000), function(){
                game_started = false;
                wrong = 3;
                check();
            });
        });
    });
}

function startTimer(){
    timerStart = new Date();
    timer_time = setInterval(timer,1);
}

function timer(){
    let timerNow = new Date();
    let timerDiff = new Date();
    timerDiff.setTime(timerNow - timerStart);
    let ms = timerDiff.getMilliseconds();
    let sec = timerDiff.getSeconds();
    if (ms < 10) {ms = "00"+ms;}else if (ms < 100) {ms = "0"+ms;}
}

function stopTimer(){
    clearInterval(timer_time);
}

function resetTimer(){
    clearInterval(timer_time);
}
