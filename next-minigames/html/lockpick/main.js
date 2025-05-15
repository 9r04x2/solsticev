let canvas = document.getElementById("canvas");
let ctx = canvas.getContext("2d");

let W = canvas.width;
let H = canvas.height;
let degrees = 0;
let new_degrees = 0;
let time = 0;
let color = "#ffffff";
let bgcolor = "#404b58";
let bgcolor2 = "#41a491";
let key_to_press;
let g_start, g_end;
let animation_loop;

let lockpcikStreak = 0;
let max_lockpcikStreak = 0;

let durum = false

function getRandomInt(min, max) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min + 1) + min); //The maximum is inclusive and the minimum is inclusive
}

function init() {
    if (durum != true) return
    // Clear the canvas every time a chart is drawn
    ctx.clearRect(0,0,W,H);

    // Background 360 degree arc
    ctx.beginPath();
    ctx.strokeStyle = bgcolor;
    ctx.lineWidth = 20;
    ctx.arc(W / 2, H / 2, 100, 0, Math.PI * 2, false);
    ctx.stroke();

    // Green zone
    ctx.beginPath();
    ctx.strokeStyle = bgcolor2;
    ctx.lineWidth = 20;
    ctx.arc(W / 2, H / 2, 100, g_start - 90 * Math.PI / 180, g_end - 90 * Math.PI / 180, false);
    ctx.stroke();

    // Angle in radians = angle in degrees * PI / 180
    let radians = degrees * Math.PI / 180;
    ctx.beginPath();
    ctx.strokeStyle = color;
    ctx.lineWidth = 20;
    ctx.arc(W / 2, H / 2, 100, 0 - 90 * Math.PI / 180, radians - 90 * Math.PI / 180, false);
    ctx.stroke();

    // Adding the key_to_press
    ctx.fillStyle = color;
    ctx.font = "100px sans-serif";
    let text_width = ctx.measureText(key_to_press).width;
    ctx.fillText(key_to_press, W / 2 - text_width / 2, H / 2 + 35);
}

function draw() {
    if (durum == true) {
        if (typeof animation_loop !== undefined) clearInterval(animation_loop);

        g_start = getRandomInt(20,40) / 10;
        g_end = getRandomInt(5,10) / 10;
        g_end = g_start + g_end;

        degrees = 0;
        new_degrees = 360;

        key_to_press = '' + getRandomInt(1,4);
        $.post("http://next-minigames/setKeyLockpick", JSON.stringify({
            key: key_to_press
        }));

        time = getRandomInt(1, 3) * 5;

        animation_loop = setInterval(animate_to, time);
    }
}

function animate_to() {
    if (degrees >= new_degrees) {
        // console.log("ıajsfdkuasd")
        if (durum == true) {
            lockpickWrong();
        } 
        return;
    }

    degrees += 2;
    init();
}

function lockpickCorrect(){
    $.post("http://next-minigames/lockpickCheck", JSON.stringify({
        success: true
    }));
    durum = false
}

function lockpickWrong(){
    $.post("http://next-minigames/lockpickCheck", JSON.stringify({
        success: false
    }));
    durum = false
}

window.addEventListener('message', (event) => {
    switch (event.data.type) {
        case "checkLockpick":
            kocadede()
        break;
        case "lockpickDisplay":
            if (event.data.display == true) {
                $(".lockpick-minigame").css("display", "block")
                durum = event.data.durum
                draw();
            } else {
                $(".lockpick-minigame").css("display", "none")
            }
        break;
    }
});

function kocadede() {
    let d_start = (180 / Math.PI) * g_start;
    let d_end = (180 / Math.PI) * g_end;
    if (degrees < d_start ){
        lockpickWrong();
        return
    } else if ( degrees > d_end ){
        lockpickWrong();
        return
    } else {
        lockpickCorrect();
        return
    }
}
