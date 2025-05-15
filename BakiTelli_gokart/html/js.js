var thisprice = 0;
var totalprice = 0;
var thistime = 0;
var SelectRenting = 0;
console.log("discord.gg/debux | Tebex : debux.tebex.io");

window.addEventListener("message", function (event) {
  if (event.data.action == "OpenUI") {
    Default();
    if (event.data.typ == "mainPage") {
      $(".main-menu").css("display", "flex");
    }
  } else if (event.data.action == "update") {
    if (event.data.typ == "addCar") {
      car = event.data.car;
      html =
        `
      <div class="Car">
      <div class="item-top">
        <div class="item-join">GOKART CAR</div>
        <div class="item-label">` +
        car.label +
        `</div>
        <center>
          <div class="item-top-alt-text">` +
        car.type +
        `</div>
        </center>
      </div>
      <div class="item-img" style="background-image:url(./img/` +
        car.img +
        `)"></div>
      <div class="item-rent" id="` +
        event.data.id +
        `" onclick="RentMenu(this.id)">
        <div class="rent-buy">Rent Car</div>
        <div class="rent-price">$` +
        car.price +
        `</div>
      </div>
    </div>
  `;
      $(".Cars").prepend(html);
    } else if (event.data.typ == "priceUpdate") {
      thisprice = event.data.price;
    } else if (event.data.typ == "namemoney") {
      $(".player-detail").html(
        event.data.name + "<br/> <span> $" + event.data.money + "</span>"
      );
    }
  } else if (event.data.action == "closeAll") {
    closex();
  } else if (event.data.action == "UpdateTimerBar") {
    $(".timer").css("display", "block");
    const yuzde = (event.data.time / event.data.totaltime) * 100;
    $(".bar-total").css("width", yuzde.toFixed(4) + "%");
  }
});

$(document).on("keydown", function (event) {
  switch (event.keyCode) {
    case 27: // ESC
      closex();
  }
});

function closex(typ) {
  if (typ == "mini") {
    $(".cafe-buy").css("display", "none");
  } else {
    Default();
    $.post("https://BakiTelli_gokart/close");
  }
}

function Default() {
  $(".Cars").empty();
  $(".main-menu").css("display", "none");
  $(".cafe-buy").css("display", "none");
  thistime = 0;
  totalprice = 0;
  $(".choose-value").html(thistime + "m");
  $("#TotalPrice").html("$" + totalprice);
  $(".timer").css("display", "none");
}

function RentMenu(id) {
  $.post(
    "https://BakiTelli_gokart/RentMenu",
    JSON.stringify({
      id: id,
    })
  );
  $(".cafe-buy").css("display", "flex");
  thistime = 0;
  totalprice = 0;
  SelectRenting = id;
  $(".choose-value").html(thistime + "m");
  $("#TotalPrice").html("$" + totalprice);
}

function UpdTime(typ, time) {
  if (typ == "update") {
    thistime = time;
  } else if (typ == "add") {
    thistime = thistime + time;
  } else if (typ == "remove") {
    if (thistime > 0) {
      thistime = thistime - time;
    }
  }
  totalprice = thistime * thisprice;
  $("#TotalPrice").html("$" + totalprice);
  $(".choose-value").html(thistime + "m");
}

function RentCar() {
  $.post(
    "https://BakiTelli_gokart/RentCar",
    JSON.stringify({
      id: SelectRenting,
      time: thistime,
    })
  );
  closex();
}
