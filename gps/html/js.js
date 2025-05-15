var color = "";
var size = "";
var isUI = false;
var animate = false;

window.addEventListener("message", function (event) {
  if (event.data.action == "openmenu") {
    OpenMenu(event.data.typ);
  } else if (event.data.action == "exitGPS") {
    $(".gpsRightLogoInside").css("opacity", 0.55);
    $("#PolygonOpen").css("background-image", "url(./img/Polygon2.svg)");
  } else if (event.data.action == "UpdateGPSUI") {
    color = event.data.color;
    ChangeTheme(event.data.color);
    ChaneLogo(event.data.job);
    ChangeSize(3);
  } else if (event.data.action == "close") {
    closex(true);
  } else if (event.data.action == "UpdateGPSUISave") {
    color = event.data.color;
    ChangeTheme(event.data.color);
    ChangeSize(event.data.size);
  } else if (event.data.action == "ChangeMenuDetail") {
    UpdateMenuDetail(
      event.data.playerdetail,
      event.data.weather,
      event.data.pdetail
    );
  } else if (event.data.action == "firstlogin") {
    namef = event.data.name;
    SendLogin(event.data.typ, namef);
    if (isUI == false && animate == false) {
      animate = true;
      $(".gpsLeftBox").animate(
        {
          opacity: "1.0",
        },
        500,
        function () {
          $(".gpsLeftBox").css({ display: "flex" });
        }
      );
      setTimeout(() => {
        animate = false;
        $(".gpsLeftBox").animate(
          {
            opacity: "0.0",
          },
          500,
          function () {
            $(".gpsLeftBox").css({ display: "none" });
          }
        );
      }, 3500);
    }
  }
});

$(document).on("keydown", function (event) {
  switch (event.keyCode) {
    case 27: // ESC
      closex(true);
  }
});

function closex(typ) {
  $(".gpsBox").css("display", "none");
  $(".gpsLeftBox").css("display", "none");
  $(".gpsLogiTitleBox").css("display", "none");
  $(".gpsDataBox").css("display", "none");
  $(".gpsBoxOne").css("display", "none");
  $(".gpsBoxFour").css("display", "none");
  $(".gpsBoxTwo").css("display", "none");
  $(".gpsBoxTre").css("display", "none");
  if (typ) {
    isUI = false;
    $.post("https://gps/close");
  }
}

function OpenMenu(typ) {
  closex();
  isUI = true;
  $(".gpsBox").css("display", "flex");
  $(".gpsLeftBox").css("display", "flex");
  $(".gpsLeftBox").css("opacity", "1");
  if (typ == "MainPage") {
    $(".gpsLogiTitleBox").css("display", "flex");
  } else if (typ == "ConnectionMainMenu") {
    $(".gpsDataBox").css("display", "flex");
    $(".gpsBoxOne").css("display", "flex");
  } else if (typ == "SettingsPage") {
    $(".gpsDataBox").css("display", "flex");
    $(".gpsBoxFour").css("display", "flex");
  } else if (typ == "MapPage") {
    $(".gpsDataBox").css("display", "flex");
    $(".gpsBoxTwo").css("display", "flex");
  }
}

function Click(typ, typ2) {
  if (typ == "GpsLine") {
    OpenMenu("ConnectionMainMenu");
  } else if (typ == "SettingsPage") {
    OpenMenu("SettingsPage");
  } else if (typ == "MapPage") {
    OpenMenu("MapPage");
  } else if (typ == "MainPage") {
    OpenMenu("ConnectionMainMenu");
  } else if (typ == "SOS") {
    $.post("https://gps/sos");
  } else if (typ == "Connect" || typ == "Disconnect") {
    $.post(
      "https://gps/ConnectorDisconnect",
      JSON.stringify({
        typ: typ,
      })
    );
    if (typ == "Connect") {
      $(".gpsRightLogoInside").css("opacity", 1);
      $("#PolygonOpen").css("background-image", "url(./img/Polygon1.svg)");
    }
  } else if (typ == "ChangeCode") {
    $(".activeAdemsTitle > p").html(typ2);
    $(".gpsLoginCodeBox > p").html(typ2);
  } else if (typ == "SaveCode") {
    $.post(
      "https://gps/ConnectorDisconnect",
      JSON.stringify({
        typ: typ,
        code: typ2,
      })
    );
  } else if (typ == "SetMenuSize") {
    size = typ2;
    ChangeSize(size);
  } else if (typ == "SetColor") {
    color = typ2;
    ChangeTheme(typ2);
  } else if (typ == "SaveReset") {
    $.post(
      "https://gps/SaveReset",
      JSON.stringify({
        typ: typ2,
        size: size,
        color: color,
      })
    );
  }
}

function ChaneLogo(job) {
  $(".gpsLogoBox").css("background-image", "url(./img/gps-" + job + ".svg)");
  var imageUrl = "./img/gps-" + job + ".svg";
  $("<img>")
    .attr("src", imageUrl)
    .on("load", function () {
      $(".gpsLogoBox").css("background-image", `url(${imageUrl})`);
    })
    .on("error", function () {
      $(".gpsLogoBox").css("background-image", "url(./img/gps-lossantos.svg)");
    });
}

function ChangeTheme(color) {
  $(".gpsBox").css("background-image", "url(./img/gps-" + color + ".png)");
  if (color == "blue") {
    color = "#0077FF";
    color2 = "#0f2b4b";
    color3 = "rgba(0, 170, 255, 0.28)";
  } else if (color == "red") {
    color = "#CE6767";
    color2 = "#CE6767";
    color3 = "rgba(252, 124, 152, 0.28)";
  } else if (color == "yellow") {
    color = "#987E4F";
    color2 = "#FFE100";
    color3 = "rgba(255, 193, 92, 0.28)";
  } else {
    color = "#ABCD99";
    color2 = "#00FFAE";
    color3 = "rgba(167, 255, 201, 0.28)";
  }
  $(".gpsDataBox").css(
    "background",
    "linear-gradient(180deg, " + color + " 0%, #000 100%)"
  );
  $(".gpsLogiTitleBox").css(
    "background",
    "linear-gradient(0deg, " + color + " 0%, #000 100%)"
  );
  $(".gpsRightLogoInside").css("background", color2);
  $(".saveBox").css("background", color3);
  $(".saveBox p").css("color", color);
  $(".connectBtn").css("background", color3);
  $(".connectBtn p").css("color", color);
}

function ChangeSize(size) {
  $(".gpsBox").css("scale", (0.7 + Number("0." + size)).toFixed(1));
  $(".gpsLeftBox").css("scale", (0.7 + Number("0." + size)).toFixed(1));
  if (size == 0) {
    text = "25%";
  } else if (size == 1) {
    text = "50%";
  } else if (size == 2) {
    text = "75%";
  } else if (size == 3) {
    text = "100%";
  }
  $(".menuSizeTitle > p > span").html(text);
  $(".menuSizeLine > input").val(size);
}

function GetTime() {
  const now = new Date();
  const hours = String(now.getHours()).padStart(2, "0");
  const minutes = String(now.getMinutes()).padStart(2, "0");
  return `${hours}:${minutes}`;
}

function GetDay() {
  const now = new Date();
  const options = { weekday: "short", month: "long", day: "numeric" };
  return now.toLocaleDateString("en-US", options);
}

function UpdateMenuDetail(playerdetail, weather, pdetail) {
  $(".airTemperatureTitle > p").html(weather);
  $(".gpsOfficerTitle > p").html(
    playerdetail.name.firstname + " " + playerdetail.name.lastname
  );
  $(".gpsOfficerLogoMenu").css(
    "background-image",
    "url(" + playerdetail.profile + ")"
  );
  $(".clockNumberTitle p").html(GetTime());
  $(".weatherForecastClockNumber p").html(GetTime());
  $(".weatherForecastClockTitle p").html(GetDay());
  $("#BoatNumber > p").html(pdetail.Boat);
  $("#Helinumber > p").html(pdetail.Heli);
  $("#CarNumber > p").html(pdetail.Car);
  $("#WalkingNumber > p").html(pdetail.Walk);
}

function SendLogin(typ, namef) {
  if (typ == "exit") {
    typ = "background-image: url(./img/Polygon2.svg)";
    typ2 = "background-image: url(./img/vector9.svg)";
  } else {
    typ = "background-image: url(./img/Polygon1.svg)";
    typ2 = "background-image: url(./img/vector8.svg)";
  }
  html =
    `
          <div class="userEntryBox">
            <div class="userEntryMenu">
              <div class="userEntryMenuLogo" style="` +
    typ +
    `"></div>
              <div class="userName"><p>` +
    namef +
    `</p></div>
            </div>
            <div class="userEntryMenuOne">
              <div class="userEntryMenuOneLogo"  style="` +
    typ2 +
    `"></div>
              <div class="userNumberBox"><p>` +
    GetTime() +
    `</p></div>
            </div>
          </div>
`;
  $(".entryAndExitBox").prepend(html);
}
