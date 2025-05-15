$(function () {
	window.addEventListener('message', function (event) {
		var item = event.data;
		if (item.action == 'openMenu') {
			changePage('main')
			$('.container').show(300)
		}
		if (item.action == 'openDashboard') {
			changePage('dashboard')
			$('.container').show(300)
		}
		if (item.action == 'updateProfile') {
			console.log(item.mugshot)
			$('.profilePicture').attr('src', item.mugshot)

			$('.pName').text(item.name)
			$('.pGrade').text(item.grade)
		}
		if (item.action == 'openProgress') {
			let percentage = (item.progress / item.amount) * 100

			$('.rightTextBox').text(item.amount)
			$('.rightTextEasy').text(item.type)

			$('.MedicalRightText').text(getWordAtPosition(item.location, 1))
			$('.departmentRightText').text(getWordAtPosition(item.location, 2))

			$('.stickLoadingBar').css('width', percentage+"%")
			$('.elevenText').html(item.progress+' <span class="otherText">/'+item.amount+'</span>')

			$('.rightTopBox').show(300)
		}
		if (item.action == 'updateProgress') {
			let percentage = (item.progress / item.amount) * 100

			$('.rightTextBox').text(item.amount)
			$('.rightTextEasy').text(item.type)

			$('.MedicalRightText').text(getWordAtPosition(item.location, 1))
			$('.departmentRightText').text(getWordAtPosition(item.location, 2))

			$('.stickLoadingBar').css('width', percentage+"%")
			$('.elevenText').html(item.progress+' <span class="otherText">/'+item.amount+'</span>')
		}
		if (item.action == 'addPlayer') {
			let div = `<div class="nameSurnameBox player-${item.value.id}">
			<p class="NameText">${item.value.name} (${item.value.id})</p>
			<div onclick="addList(${item.value.id})" class="boostBox">
				<svg class="plusIcon" width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
					<path class="plusColor"c d="M8 1C6.15046 1.02244 4.38299 1.76714 3.07507 3.07507C1.76714 4.38299 1.02244 6.15046 1 8C1.02244 9.84954 1.76714 11.617 3.07507 12.9249C4.38299 14.2329 6.15046 14.9776 8 15C9.84954 14.9776 11.617 14.2329 12.9249 12.9249C14.2329 11.617 14.9776 9.84954 15 8C14.9776 6.15046 14.2329 4.38299 12.9249 3.07507C11.617 1.76714 9.84954 1.02244 8 1ZM12 8.5H8.5V12H7.5V8.5H4V7.5H7.5V4H8.5V7.5H12V8.5Z" fill="#7ABFFF"/>
				</svg>                            
			</div>
			</div>`

			$('.addBoxArea').append(div)
		}
		if (item.action == 'addHistory') {
			let div = `<div class="personBox history-item">
			<p class="personName">${item.data.sender.job}. ${item.data.sender.name}</p>
			<p class="personJob">${item.data.player.name}</p>
			<div class="medicalJobBox">
				<p class="MedicalsoftText">${getWordAtPosition(item.data.player.location, 1)}</p>
				<p class="departmentsoftText">${getWordAtPosition(item.data.player.location, 2)}</p>

				<div class="text-area">
					<p class="text">${item.data.amount}</p>
					<p class="text">${item.data.type}</p>
                </div>

			</div>
			</div>`

			$('.history').append(div)
		}
		if (item.action == 'addOngoing') {
			let div = `<div class="personBox ongoing-item">
			<p class="personName2">${item.data.sender.job}. ${item.data.sender.name}</p>
			<p class="personJob2">${item.data.player.name}</p>
			<div onclick="release('${item.id}', ${false})" class="cancelButton">
			<svg width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
				<path d="M1.758 10.242C1.18494 9.68849 0.727844 9.02642 0.41339 8.2944C0.0989363 7.56237 -0.066581 6.77505 -0.0735039 5.97838C-0.0804268 5.1817 0.0713834 4.39162 0.373069 3.65424C0.674754 2.91687 1.12027 2.24695 1.68363 1.6836C2.24699 1.12024 2.9169 0.674724 3.65427 0.373038C4.39165 0.0713529 5.18173 -0.0804573 5.97841 -0.0735344C6.77508 -0.0666115 7.5624 0.0989058 8.29443 0.41336C9.02645 0.727814 9.68852 1.18491 10.242 1.75797C11.3349 2.88958 11.9397 4.40519 11.926 5.97838C11.9124 7.55156 11.2814 9.05643 10.1689 10.1689C9.05646 11.2813 7.55159 11.9123 5.97841 11.926C4.40523 11.9397 2.88961 11.3349 1.758 10.242ZM6.84 5.99997L8.538 4.30197L7.692 3.45597L6 5.15397L4.302 3.45597L3.456 4.30197L5.154 5.99997L3.456 7.69797L4.302 8.54397L6 6.84597L7.698 8.54397L8.544 7.69797L6.846 5.99997H6.84Z" fill="#FF4848"/>
			</svg>                                    
			</div>
			<div class="medicalJobBox">
			<p class="MedicalsoftText">${getWordAtPosition(item.data.player.location, 1)}</p>
			<p class="departmentsoftText">${getWordAtPosition(item.data.player.location, 2)}</p>
			<div class="text-area">
				<p class="text">${item.data.amount}</p>
				<p class="text">${item.data.type}</p>
			</div>
			</div>
			</div>`

			$('.ongoing').append(div)
		}
		if (item.action == 'release') {
			$('.rightTopBox').hide(300)
		}
	});
});

function release(id, all) {
	$('.personBox').remove()
	$.post(`https://${GetParentResourceName()}/release`,JSON.stringify({
		id: id,
		all: all
	}))
}

function getWordAtPosition(text, position) {
    const parts = text.split(' ');

    if (position > 0 && position <= parts.length) {
        return parts[position - 1];
    } else {
        return '';
    }
}

let players = {}

function addList(id) {
	if(players[id]) {
		players[id] = undefined
		$('.player-'+id).removeClass('active')
	}
	else {
		players[id] = true
		$('.player-'+id).addClass('active')
	}
}

function resetList() {
	$('.nameSurnameBox').removeClass('active')

	players = {}
}

window.addEventListener("keyup", (event) => {
    event.preventDefault();
    if (event.key == "Escape") {
        exit()
    }
})

function exit() {
	if(lastLocation) {
		$('.medicalArea').hide(300)
		selectLocation()

		$('.value').val("")
	}
	else {
		$('.container').hide(300)
		$('.pages').hide(300)
		$.post(`https://${GetParentResourceName()}/exit`,JSON.stringify({}))
	
		$('.nameSurnameBox').remove()
		$('.value').val("")
		$('.personBox').remove()
	}
}

function changePage(page) {
	$('.pages').hide()

	$('.page-'+page).show()
}


function send() {
	let value = $('.value').val()

	if(parseInt(value) > 0) {
		$.post(`https://${GetParentResourceName()}/send`,JSON.stringify({
			players: players,
			amount: value,
			type: targetType,
			location: targetLocation
		}))
		exit()
		exit()
	}
}

let lastLocation = false

function selectLocation(loc) {
	if(!lastLocation) {
		$('.difficuityBox').hide(300)
		$('.location').addClass('active')

		$('.box-'+loc).show(300)
		$('.location-'+loc).removeClass('active')

		loadLocation(loc)

		lastLocation = true
	}
	else {
		$('.difficuityBox').hide(300)
		$('.location').removeClass('active')

		resetList()
		lastLocation = false
	}

	targetLocation = loc
}

function loadLocation(loc) {
	$.post(`https://${GetParentResourceName()}/loadName`,JSON.stringify({
		loc: loc,
	}), function(data){
		$('.MedicalText').text(getWordAtPosition(data, 1))
		$('.departmentText').text(getWordAtPosition(data, 2))

	})
}

function selectDifficulty(diff) {
	$('.medicalArea').show(300)
	$('.easyBox').text(diff)

	targetType = diff
}

$(document).ready(function () {
    $(".history-input").on("keyup", function () {
      var value = $(this).val().toLowerCase();
      $(".history-item").filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
      });
    });
});

$(document).ready(function () {
    $(".ongoing-input").on("keyup", function () {
      var value = $(this).val().toLowerCase();
      $(".ongoing-item").filter(function () {
        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
      });
    });
});