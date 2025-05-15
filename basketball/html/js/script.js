var SelectGameNumber = 5;
var Price = 0;
var Speed = 0;
var isMinigameActive = false;

$(document).ready(function () {
  window.addEventListener("message", function (event) {
    if (event.data.action == "openmenu") {
      $(".BuyPage").css("display", "flex");
      Price = event.data.price;
      $(".GamePrice").html("$" + Price * SelectGameNumber);
      Speed = event.data.speed;
      isMinigameActive = false;
    } else if (event.data.action == "openminigame") {
      $(".minigame").css("display", "flex");
      StartMinigame();
    } else if (event.data.action == "openmyscore") {
      $(".YourScoreBoard").css("display", "flex");
    } else if (event.data.action == "scoreupdate") {
      $(".RemainingScore").html(
        event.data.ScoreData.remaining - event.data.ScoreData.throw - 1
      );
      $(".YourScore").html(
        event.data.ScoreData.score + "/" + event.data.ScoreData.throw
      );
    } else if (event.data.action == "finishgame") {
      DefaultClose();
    } else if (event.data.action == "topbasketball") {
      $(".one > .ProfileDetail > .ProfileName > t").html(
        event.data.fetch[0].firstname
      );
      $(".one > .ProfileDetail > .ProfileName > p").html(
        event.data.fetch[0].lastname
      );
      $(".one > .leaderbasket").html(event.data.fetch[0].basketball);
      $(".two > .ProfileDetail > .ProfileName > t").html(
        event.data.fetch[1].firstname
      );
      $(".two > .ProfileDetail > .ProfileName > p").html(
        event.data.fetch[1].lastname
      );
      $(".two > .leaderbasket").html(event.data.fetch[1].basketball);
      $(".three > .ProfileDetail > .ProfileName > t").html(
        event.data.fetch[2].firstname
      );
      $(".three > .ProfileDetail > .ProfileName > p").html(
        event.data.fetch[2].lastname
      );
      $(".three > .leaderbasket").html(event.data.fetch[2].basketball);
    }
  });
});

$(document).on("keydown", function (event) {
  switch (event.keyCode) {
    case 27: // ESC
      if (!isMinigameActive) {
        DefaultClose();
      }
  }
});

function DefaultClose() {
  $(".minigame").css("display", "none");
  $(".BuyPage").css("display", "none");
  $(".YourScoreBoard").css("display", "none");
  isMinigameActive = false;
  SelectGame(5);
  $.post("https://basketball/close");
}

function SelectGame(game) {
  SelectGameNumber = game;
  $(".GameSelectBar").removeClass("active");
  $(".GameSelectBars #" + game).addClass("active");
  $(".YouSelectBar > t").html(game + " Ball");
  $(".GamePrice").html("$" + Price * SelectGameNumber);
}

function SelectGameUpdate(type) {
  switch (type) {
    case "add":
      SelectGameNumber++;
      break;
    case "remove":
      SelectGameNumber = Math.max(1, SelectGameNumber - 1);
      break;
  }
  SelectGame(SelectGameNumber);
}

function StartGame() {
  $.post(
    "https://basketball/startgame",
    JSON.stringify({
      game: SelectGameNumber,
    })
  );
  DefaultClose();
}

let isGameRunning = false;

function StartMinigame() {
  if (isGameRunning) {
    return;
  }

  isGameRunning = true;
  isMinigameActive = true;
  let direction = 1;
  let currentMargin = 0;
  const ball = document.querySelector(".ball");
  let result = false;
  let gameInterval = null;
  let hasSpaceBeenPressed = false;

  function resetGame() {
    if (gameInterval) clearInterval(gameInterval);
    ball.style.marginLeft = "0vw";
    currentMargin = 0;
    direction = 1;
  }

  resetGame();
  setTimeout(() => {
    gameInterval = setInterval(() => {
      currentMargin += 3 * direction;
      if (currentMargin >= 47) {
        direction = -1;
        currentMargin = 47;
      }
      if (currentMargin <= -47) {
        direction = 1;
        currentMargin = -47;
      }
      ball.style.marginLeft = currentMargin + "vw";
    }, Speed);

    setTimeout(() => {
      let spaceListener = function (event) {
        if (event.code === "Space" && !hasSpaceBeenPressed) {
          hasSpaceBeenPressed = true;
          clearInterval(gameInterval);
          result = currentMargin >= -3 && currentMargin <= 3;
          $.post(
            "https://basketball/minigameResult",
            JSON.stringify({
              success: result,
              marginValue: currentMargin,
            })
          );

          document.removeEventListener("keydown", spaceListener);

          setTimeout(() => {
            resetGame();
            hasSpaceBeenPressed = false;
            isGameRunning = false;
          }, 550);
        }
      };

      document.addEventListener("keydown", spaceListener);
    }, 500);
  }, 1000);
}
