var carRender = null
var pedRender = null
var objectRender = null
var lightColor = null
var shadow = null
let colors = {}
let lang = {}
let first = false

function reset() {
  carRender = 0.99
  pedRender = 0.99
  objectRender = 0.99
  shadow = 0.99
  lightColor = 0
  fire = false
  reflection = false
  raind = false
  $('.smallStatus').html(lang.on)
  $('.smallStatus').css('opacity', '1')
  $.post("https://G9-fpsmenu/resetFire", JSON.stringify({}));
  $.post("https://G9-fpsmenu/resetRef", JSON.stringify({}));
  $.post("https://G9-fpsmenu/resetNpc", JSON.stringify({}));
  $.post("https://G9-fpsmenu/resetRain", JSON.stringify({}));
  $.post("https://G9-fpsmenu/g9:shadowDetails", JSON.stringify({objectv: shadow}));
  $.post("https://G9-fpsmenu/g9:light", JSON.stringify({objectv: lightColor}));
  $.post("https://G9-fpsmenu/g9:setObject", JSON.stringify({objectv: pedRender}));
  $.post("https://G9-fpsmenu/g9:setPed", JSON.stringify({objectv: pedRender}));
  $.post("https://G9-fpsmenu/g9:setLod", JSON.stringify({lod: carRender}));
  $('.progStatus').css('width', '100%')
  $('#lightColor .progStatus').css('width', '0%')
  $('.yuzde').html('100%')
  $('#lightColor .yuzde').html('0%')
}

window.addEventListener("message", function (event) {
  if (event.data.action === "open") {
    $("html,body").css("display", "flex").show();
    const color = event.data.colors
    colors = color
    lang = event.data.lang
    if(!first) {
      setLang(event.data.lang)
      first = true
    }
    
    setColors(colors)
  } else if(event.data.action === 'updateFps') {
      $('.fpsValue').html(event.data.fps)
  } else if(event.data.action === 'close') {
    $("html,body").hide();
  } else if(event.data.action === 'closeAdmin') {
    $(".adminActions").hide()
  } else if (event.data.action === 'reset') {
    reset()
  }
});


function setColors(colors) {
  $.each(colors, function(_, color) {
    $('.userHead, .settingsText, .otherText, .fpsText, .smallText, .adminHead, .adminAction,.fpsHead, .renderHead' ).css('color', colors.headers)
    $('.icon').css('background', `rgba(${colors.svgBackground}, 0.1)`);
    $('#renderPc path, #otherPc path').css('fill', colors.svgColor)
    $('#graphicPc path').css('stroke', colors.svgColor)
    $('.render, .graphic, .other, .settings, .fpsStatus, .adminActions').css('border', `1px solid rgba(${colors.borders}, 0.24)`);
    $('.render, .graphic, .other, .settings, .fpsStatus, .adminActions').css('background', `rgba(${colors.background})`);
    $('.progStatus').css('background', `linear-gradient(90deg, rgb(${colors.prog.first}) 0%, rgb(${colors.prog.second}) 100%)`);
    $('.progStatus2').css('background', `rgb(${colors.prog.second})`)
    $('.line').css('background', `linear-gradient(90deg, rgba(0, 162, 255, 0) 0%, ${colors.line} 38.5%, ${colors.line} 67%, rgba(0, 217, 255, 0) 100%)`);
  })
}



$('.settings').on('click', function() {
  $("html,body").hide();
  $.post("https://G9-fpsmenu/openSettings", JSON.stringify({}), function() {
  });
});

const prog = $('.prog');


prog.on('click', function (e) {
  const rect = $(this).get(0).getBoundingClientRect();
  const clickX = e.clientX - rect.left;
  let widthPercentage = (clickX / rect.width) * 100;
  if (clickX === rect.width) {
    widthPercentage = 100;
  }

  if ($(this).closest('#carRender').length) {
    carRender = widthPercentage / 100
    $(this).closest('.carRender').find('.yuzde').html(Math.round(widthPercentage) + '%');
    $.post("https://G9-fpsmenu/g9:setLod", JSON.stringify({lod: carRender}));
  } else if ($(this).closest('#pedRender').length) {
    pedRender = widthPercentage / 100
    $.post("https://G9-fpsmenu/g9:setPed", JSON.stringify({objectv: pedRender}));
  } else if ($(this).closest('#objectRender').length) {
    objectRender = widthPercentage / 100 
    $.post("https://G9-fpsmenu/g9:setObject", JSON.stringify({objectv: objectRender}));
  } else if ($(this).closest('#lightColor').length) {
    lightColor = widthPercentage / 100
    $.post("https://G9-fpsmenu/g9:light", JSON.stringify({objectv: lightColor}));
  } else if ($(this).closest('#shadow').length) {
    shadow = widthPercentage / 100
    $.post("https://G9-fpsmenu/g9:shadowDetails", JSON.stringify({objectv: shadow}));
  }

  $(this).find('.progStatus').css('width', widthPercentage + '%');
  $(this).prev('.header50').find('.yuzde').html(Math.round(widthPercentage) + '%');
});

let reflection = false
let fire = false
let raind = false
let admin = false





$('#reflection').on('click', function() {
  if (!reflection) {
    $(this).html(lang.off)
    $(this).css('opacity', '0.5')
    reflection = true
    $.post("https://G9-fpsmenu/g9:reflectionLights", JSON.stringify({
    }), function(response) {
    })
  } else {
    $(this).html(lang.on)
    $(this).css('opacity', '1')
    reflection = false
    $.post("https://G9-fpsmenu/g9:reflectionLights", JSON.stringify({
    }), function(response) {
    })
  } 
})

$('#fire').on('click', function() {
  if (!fire) {
    $(this).html(lang.off)
    $(this).css('opacity', '0.5')
    fire = true
    $.post("https://G9-fpsmenu/g9:fireEffect", JSON.stringify({objectv: shadow}));
  } else {
    $(this).html(lang.on)
    $(this).css('opacity', '1')
    fire = false
    $.post("https://G9-fpsmenu/g9:fireEffect", JSON.stringify({objectv: shadow}));
  }
})

$('#clearBlood').on('click', function() {
  $.post("https://G9-fpsmenu/g9:clearDirts", JSON.stringify({}));
})

$('#raind').on('click', function() {
  if (!raind) {
    $(this).html(lang.off)
    $(this).css('opacity', '0.5')
    raind = true
    $.post("https://G9-fpsmenu/g9:raind", JSON.stringify({}));
  } else {
    $(this).html(lang.on)
    $(this).css('opacity', '1')
    raind = false
    $.post("https://G9-fpsmenu/g9:raind", JSON.stringify({}));
  }
})

$('#admin').on('click', function() {
  if (!admin) {
    $(this).html(lang.off)
    $(this).css('opacity', '0.5')
    admin = true
    $.post("https://G9-fpsmenu/g9:npc", JSON.stringify({}));
  } else {
    $(this).html(lang.on)
    $(this).css('opacity', '1')
    admin = false
    $.post("https://G9-fpsmenu/g9:npc", JSON.stringify({}));
  }
})

let active = false

$('#otheractiv').on('click', function() {
  if (!active) {
    $(this).html(lang.activated)
    $(this).css('opacity', '1')
    active = true
    $.post("https://G9-fpsmenu/g9:boostOpen", JSON.stringify({}));
  } else {
    $(this).html(lang.off)
    $(this).css('opacity', '0.5')
    active = false
    $.post("https://G9-fpsmenu/g9:boostOpen", JSON.stringify({}));
  }
})

$('.reset').on('click', function() {
  if ($(this).closest('#carReset').length) {
    carRender = 0.99
    $.post("https://G9-fpsmenu/g9:setLod", JSON.stringify({lod: carRender}));
    $(this).closest('.carRender').find('.yuzde').html('100%');
    $(this).closest('.carRender').find('.progStatus').css('width', '100%');
  } else if ($(this).closest('#pedReset').length) {
    pedRender = 0.99
    $.post("https://G9-fpsmenu/g9:setPed", JSON.stringify({objectv: pedRender}));
    $(this).closest('.carRender').find('.yuzde').html('100%');
    $(this).closest('.carRender').find('.progStatus').css('width', '100%');
  } else if ($(this).closest('#objectReset').length) {
    objectRender = 0.99
    $.post("https://G9-fpsmenu/g9:setObject", JSON.stringify({objectv: pedRender}));
    $(this).closest('.carRender').find('.yuzde').html('100%');
    $(this).closest('.carRender').find('.progStatus').css('width', '100%');
  } else if ($(this).closest('#lightReset').length) {
    lightColor = 0
    $.post("https://G9-fpsmenu/g9:light", JSON.stringify({objectv: lightColor}));
    $(this).closest('.carRender').find('.yuzde').html('0%');
    $(this).closest('.carRender').find('.progStatus').css('width', '0%');
  } else if ($(this).closest('#shadowReset').length) {
    shadow = 0.99
    $.post("https://G9-fpsmenu/g9:shadowDetails", JSON.stringify({objectv: shadow}));
    $(this).closest('.carRender').find('.yuzde').html('100%');
    $(this).closest('.carRender').find('.progStatus').css('width', '100%');
  } else if ($(this).closest('#raindr').length) {
    $('#raind').html(lang.on)
    $('#raind').css('opacity', '1')
    raind = false
    $.post("https://G9-fpsmenu/resetRain", JSON.stringify({}));
  } else if ($(this).closest('#adminr').length) {
    $('#admin').html(lang.on)
    $('#admin').css('opacity', '1')
    $.post("https://G9-fpsmenu/resetNpc", JSON.stringify({}));
    admin = false
  } else if ($(this).closest('#reflectionReset').length) {
    $('#reflection').html(lang.on)
    $('#reflection').css('opacity', '1')
    $.post("https://G9-fpsmenu/resetRef", JSON.stringify({}));
    reflection = false
  } else if ($(this).closest('#fireReset').length) {
    $('#fire').html(lang.on)
    $('#fire').css('opacity', '1')
    $.post("https://G9-fpsmenu/resetFire", JSON.stringify({}));
    fire = false
  }
})

window.addEventListener("keyup", (event) => {
  event.preventDefault();
  if (event.key == "Escape" || event.key == 'Backspace') {
    $.post("https://G9-fpsmenu/close", JSON.stringify({}));
  }
})



