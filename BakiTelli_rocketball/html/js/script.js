let currentLocales = {};
const keyToSymbol = {
  ESC: "⎋",
  LEFTSHIFT: "⇧",
  RIGHTSHIFT: "⇧",
  LEFTCTRL: "⌃",
  RIGHTCTRL: "⌃",
  LEFTALT: "⌥",
  SPACE: "␣",
  BACKSPACE: "⌫",
  ENTER: "↵",
  TAB: "⇥",
  CAPS: "⇪",
  LEFT: "←",
  RIGHT: "→",
  TOP: "↑",
  DOWN: "↓",
  DELETE: "⌦",
  HOME: "⇱",
  END: "⇲",
  PAGEUP: "⇞",
  PAGEDOWN: "⇟",
};

console.log("discord.gg/debux | Tebex : debux.tebex.io");
$(document).ready(function () {
  window.addEventListener("message", function (event) {
    if (event.data.action == "OpenMainMenu") {
      $(".mainPage").css("display", "flex");
      $(".lobbyListArea").css("display", "flex");
      $(".redTeamScore").html(0);
      $(".blueTeamScore").html(0);
      $(".TopLogoAreaSide > div").css(
        "background-image",
        "url(" + event.data.logo + ")"
      );
      $(".waiting-icon").css(
        "background-image",
        "url(" + event.data.logo + ")"
      );
      currentLocales = event.data.locales;
      updateLocales();
      waitingBar(1300);
    } else if (event.data.action == "CloseMenu") {
      DefaultClose();
    } else if (event.data.action == "updateData") {
      $(".NameSideName > t").html(event.data.data.name);
      $(".NameSideName > p").html("$" + event.data.data.money);
      $(".NameSideProfile").css(
        "background-image",
        "url(" + event.data.data.avatar + ")"
      );
      $(".SelectMapAreaSide").css(
        "background-image",
        "url(" + event.data.map + ")"
      );
      $(".SelectMapAreaName > t").html(event.data.mapname);
      const lobbys = event.data.data.Lobbys;
      lobbys.forEach((lobby) => {
        $(".LobbyList").prepend(`
              <div class="LobbyItem" id="${
                lobby.name
              }" onclick="LoginLobby(this.id)">
                  <div class="LobbyItemLeft">
                      <div class="LobbyItemMap" style="background-image: url(${
                        event.data.map
                      })"></div>
                      <div class="LobbyItemMapName">
                          <i></i>
                          <t>${event.data.mapname}</t>
                      </div>
                  </div>
                  <div class="LobbyItemRight">
                      <div class="LobbyItemRightTop">
                          <div class="LobbyItemRightTopLobName">
                              <t>${lobby.name}</t>
                              <p>${lobby.owner_name}</p>
                          </div>
                      <div class="LobbyItemLock ${
                        !lobby.password ? "unlock" : "lock"
                      }"><div></div></div>
                      </div>
                      <div class="LobbyItemWait ${
                        lobby.starttime === 0 ? "" : "playing"
                      }">
                          <div class="LobbyItemWaitIcon"><div></div></div>
                          <t>${
                            lobby.starttime === 0
                              ? currentLocales.WaitingPlayer
                              : currentLocales.MatchPlayed
                          }</t>
                      </div>
                      <div class="LobbyItemDetailBars">
                          <div class="LobbyItemDetailBar">
                              <div class="LobbyItemDetailBarIcon">
                                  <div class="time"></div>
                              </div>
                              <t>${currentLocales.Time}</t>
                              <div class="TimeText">${lobby.time}M</div>
                          </div>
                          <div class="LobbyItemDetailBar">
                              <div class="LobbyItemDetailBarIcon">
                                  <div class="players"></div>
                              </div>
                              <t>${currentLocales.Players}</t>
                              <div class="playersText"><t>${
                                lobby.all_players
                              }</t>/10</div>
                          </div>
                      </div>
                  </div>
              </div>
          `);
      });
    } else if (event.data.action == "openPassword") {
      $(".mainPagePassowrdPopUp").css("display", "flex");
      $(".popUpText > t").html(event.data.name);
      $(".popUpText > p").html(event.data.owner);
    } else if (event.data.action == "playersDefault") {
      DefaultPlayersDetail();
    } else if (event.data.action == "get-px") {
      waitingBar(2000);
      $(".playerList").css("display", "flex");
      $(".lobbyListArea").css("display", "none");
      $(".mainPagePassowrdPopUp").css("display", "none");
      DefaultPlayersDetail();
    } else if (event.data.action == "update-teamp") {
      $(".redTeamPlayerList > t").html(event.data.red);
      $(".blueTeamPlayerList > t").html(event.data.blue);
    } else if (event.data.action == "addPlayer") {
      $("#" + event.data.team + event.data.num).empty();
      $("#" + event.data.team + event.data.num).addClass("active");
      $("#" + event.data.team + event.data.num).append(`
                <div class="TeamPlayerProfile"><div style="background-image: url(${event.data.profile})"></div></div>
                <div class="TeamPlayerName"><t>${event.data.name}</t> <p></p></div>
      `);
    } else if (event.data.action == "updateLobbyDetail") {
      $(".lobbyDetailTime > t").html(event.data.time);
      $("#lobbynameinput2").val(event.data.name);
      if (event.data.password) {
        $(".lobbyDetailPassword > div").show();
        $(".detail-text-locked").addClass("active");
        $(".detail-text-unlocked").removeClass("active");
      } else {
        $(".lobbyDetailPassword > div").hide();
        $(".detail-text-locked").removeClass("active");
        $(".detail-text-unlocked").addClass("active");
      }
    } else if (event.data.action == "Permission") {
      if (event.data.tx == "owner") {
        $(".startButton").css("opacity", 1);
        $(".startButton").css("pointer-events", "auto");
      } else {
        $(".startButton").css("opacity", 0.24);
        $(".startButton").css("pointer-events", "none");
      }
    } else if (event.data.action == "closeAllMenuStartGame") {
      DefaultClose(true);
    } else if (event.data.action == "startGameTimer") {
      $(".IngameArea").css("display", "flex");
      $(".BigTextArea").css("display", "flex");
      $(".Timer").css("display", "flex");
      $(".Timer > .big-text-bg").html(event.data.time);
      $(".Timer > .big-text-side > t").html(event.data.time);
      if (event.data.time == 0) {
        $(".BigTextArea").css("display", "none");
      }
    } else if (event.data.action == "time-update") {
      $(".scoreboardTimeText").html(event.data.time);
    } else if (event.data.action == "win-lose") {
      $(".Timer").css("display", "none");
      $(".BigTextArea").css("display", "flex");
      if (event.data.typ == "win") {
        $(".defeat").css("display", "none");
        $(".winner").css("display", "flex");
        $(".winner > .big-text-side > p").html(event.data.team);
      } else if (event.data.typ == "goal") {
        $(".winner").css("display", "none");
        $(".defeat").css("display", "none");
        $(".goal").css("display", "flex");
      } else {
        $(".winner").css("display", "none");
        $(".defeat").css("display", "flex");
        $(".defeat > .big-text-side > p").html(event.data.team);
      }
    } else if (event.data.action == "goalClose") {
      $(".BigTextArea").css("display", "none");
      $(".goal").css("display", "none");
    } else if (event.data.action == "updateScore") {
      $(".blueTeamScore").html(event.data.blue);
      $(".redTeamScore").html(event.data.orange);
    } else if (event.data.action == "nitroUpdate") {
      animateSpeedometer(event.data.nitro);
    } else if (event.data.action == "KeyMenuUpdate") {
      const keys = event.data.Keys;
      $(".keybinds").empty();
      keys.forEach((keyData) => {
        const keySymbol =
          keyData.key.length === 1
            ? keyData.key
            : keyToSymbol[keyData.key] || keyData.key;

        $(".keybinds").append(`
              <div class="keybind">
                  <div class="keybind-icon">${keySymbol}</div>
                  <div class="keybind-text">${keyData.text}</div>
              </div>
          `);
      });
    } else if (event.data.action == "playSound") {
      playSound(event.data.soundName);
    }
  });
});

$(document).on("keydown", function (event) {
  switch (event.keyCode) {
    case 27: // ESC
      DefaultClose();
  }
});

function DefaultClose(typ) {
  $(".mainPagePassowrdPopUp").css("display", "none");
  $(".mainPage").css("display", "none");
  $(".playerList").css("display", "none");
  $(".lobbyListArea").css("display", "none");
  $(".LobbyList").empty();
  if (typ == null) {
    $(".BigTextArea").css("display", "none");
    $(".winner").css("display", "none");
    $(".goal").css("display", "none");
    $(".defeat").css("display", "none");
    $(".Timer").css("display", "none");
    $(".IngameArea").css("display", "none");
    $.post("https://BakiTelli_rocketball/close");
  }
}

function DefaultPlayersDetail() {
  var teams = ["red", "blue"];
  var players = ["1", "2", "3", "4", "5"];
  $(".TeamPlayer").empty();
  $(".TeamPlayer").removeClass("active");
  teams.forEach(function (team) {
    players.forEach(function (player) {
      var selector = "#" + team + player;
      $(selector).append(`
        <div class="TeamPlayerCreate" id="${selector}join"></div>
      `);
    });
  });
}

function CheckPassword() {
  password_no = $("#enterPasswordInput").val();
  DefaultPlayersDetail();
  $.post(
    "https://BakiTelli_rocketball/checkPassword",
    JSON.stringify({
      password: password_no,
    })
  );
}

var password = true;
let currentTime = 15;

// password bar
$(".digit-box").each(function (index, input) {
  $(input).on("input", function () {
    if ($(this).val().length >= 1) {
      $(this).val($(this).val().slice(-1));

      if (!/^\d+$/.test($(this).val())) {
        $(this).val("");
        return;
      }

      if (index < $(".digit-box").length - 1) {
        $(".digit-box")
          .eq(index + 1)
          .focus();
      }
    }
  });

  $(input).on("keydown", function (e) {
    if (/^\d$/.test(e.key)) {
      e.preventDefault();
      $(this).val(e.key);

      if (index < $(".digit-box").length - 1) {
        $(".digit-box")
          .eq(index + 1)
          .focus();
      }
    }

    if (e.key === "Backspace") {
      if (!$(this).val() && index > 0) {
        $(".digit-box")
          .eq(index - 1)
          .focus();
      }
      $(this).val("");
    }
  });
});

$(".matchPasswordBarInput").on("click", function () {
  waitingBar(1000);
  if (password) {
    password = false;
    $(".matchPasswordBarInput > div").hide();
    $(".text-locked").removeClass("active");
    $(".text-unlocked").addClass("active");
  } else {
    password = true;
    $(".matchPasswordBarInput > div").show();
    $(".text-locked").addClass("active");
    $(".text-unlocked").removeClass("active");
  }
});

// time bar
$(".matchTimeAddButton").on("click", function () {
  if (currentTime < 30) {
    currentTime += 1;
    updateTimeText();
  }
});

$(".matchTimeRemoveButton").on("click", function () {
  if (currentTime > 1) {
    currentTime -= 1;
    updateTimeText();
  }
});

function updateTimeText() {
  $(".matchTimeSelectText > t").text(currentTime);
}

// nitro bar
function setSpeedometerProgress(percent) {
  percent = Math.min(Math.max(percent, 0), 100);

  const maxAngle = 275;
  const offset = -180;
  const fillAngle = (percent / 100) * maxAngle;

  const mask = `conic-gradient(
      from ${offset}deg,
      #fff 0deg ${fillAngle}deg,
      transparent ${fillAngle}deg 360deg
  )`;

  $(".speedometer-bar-inner").css({
    "mask-image": mask,
    "-webkit-mask-image": mask,
  });

  $(".speedometer-text").text(percent);
}

let currentAnimation = null;

function animateSpeedometer(targetPercent) {
  // Eğer mevcut bir animasyon varsa durdur
  if (currentAnimation) {
    currentAnimation.stop();
  }

  const currentPercent = parseInt($(".speedometer-text").text()) || 0;

  // Eğer hedef 0 ise, direkt 0'a set et
  if (targetPercent === 0) {
    setSpeedometerProgress(0);
    return;
  }

  currentAnimation = $({ percent: currentPercent }).animate(
    {
      percent: targetPercent,
    },
    {
      duration: 500, // Daha hızlı animasyon
      step: function () {
        setSpeedometerProgress(Math.round(this.percent));
      },
      complete: function () {
        currentAnimation = null;
      },
    }
  );
}
// search bar
function searchLobbies() {
  const searchInput = document.getElementById("searchInput");
  const filter = searchInput.value.toLowerCase();
  const lobbyItems = document.querySelectorAll(".LobbyItem");

  lobbyItems.forEach((item) => {
    const lobbyNameElement = item.querySelector(".LobbyItemRightTopLobName");
    const lobbyText = lobbyNameElement.textContent.toLowerCase();

    if (lobbyText.includes(filter)) {
      item.style.display = "";
    } else {
      item.style.display = "none";
    }
  });
}

// create lobby
function createLobby() {
  const lobbyName = $("#lobbynameinput").val() || false;

  const lobbyPassword = password
    ? $(".digit-box")
        .map(function () {
          return $(this).val();
        })
        .get()
        .join("")
    : false;

  const timeText = $(".matchTimeSelectText > t").text();
  const lobbyTime =
    timeText.length === 4 ? timeText.substring(0, 2) : timeText.charAt(0);

  $.post(
    "https://BakiTelli_rocketball/createLobby",
    JSON.stringify({
      lobbyName: lobbyName,
      lobbyPassword: lobbyPassword,
      lobbyTime: lobbyTime,
    })
  );
  waitingBar(2500);
  $(".playerList").css("display", "flex");
  $(".lobbyListArea").css("display", "none");
  $(".mainPagePassowrdPopUp").css("display", "none");
}

// login lobby
function LoginLobby(lobbyName) {
  // waitingBar(2000);
  $.post(
    "https://BakiTelli_rocketball/LoginLobby",
    JSON.stringify({
      name: lobbyName,
    })
  );
  // DefaultClose();
}

// login team
function LoginTeam(team, num) {
  waitingBar(1500);
  $.post(
    "https://BakiTelli_rocketball/LoginTeam",
    JSON.stringify({
      team: team,
      num: num,
    })
  );
}

// waiting bar
function waitingBar(time) {
  $(".waitingBar").css("display", "flex");
  setTimeout(() => {
    $(".waitingBar").css("display", "none");
  }, time);
}

// start game
function StartGame() {
  waitingBar(2000);
  $.post("https://BakiTelli_rocketball/StartGame");
}

// update locales
function updateLocales() {
  document.querySelectorAll("[data-locale]").forEach((element) => {
    const key = element.getAttribute("data-locale");
    if (currentLocales[key]) {
      if (element.tagName.toLowerCase() === "input") {
        element.placeholder = currentLocales[key];
      } else {
        element.textContent = currentLocales[key];
      }
    }
  });

  document.querySelectorAll("[data-locale-placeholder]").forEach((element) => {
    const key = element.getAttribute("data-locale-placeholder");
    if (currentLocales[key]) {
      element.placeholder = currentLocales[key];
    }
  });
}

let currentAudio = null;
let currentSound = null;

function playSound(soundName = null) {
  if (currentAudio) {
    fadeOut(currentAudio, 20); // Mevcut sesi 500ms'de fade out yap
  }

  if (soundName) {
    currentSound = soundName;
  }

  currentAudio = new Audio(`./sounds/${currentSound}`);
  currentAudio.volume = 0.5; // Sabit ses seviyesi

  currentAudio.play();

  currentAudio.onloadedmetadata = function () {
    const duration = currentAudio.duration * 1000;
    setTimeout(() => {
      if (currentAudio) {
        fadeOut(currentAudio, 500);
      }
    }, duration - 500);
  };

  currentAudio.onended = function () {
    currentAudio = null;
  };
}

function fadeOut(audio, duration) {
  const startVolume = audio.volume;
  const steps = 20; // Fade adım sayısı
  const volumeStep = startVolume / steps;
  const intervalTime = duration / steps;

  const fadeInterval = setInterval(() => {
    if (audio.volume > volumeStep) {
      audio.volume -= volumeStep;
    } else {
      audio.volume = 0;
      clearInterval(fadeInterval);
      audio.pause();
      audio.currentTime = 0;
    }
  }, intervalTime);
}
