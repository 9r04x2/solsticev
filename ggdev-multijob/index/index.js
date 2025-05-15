window.addEventListener('message', function(event) {
    if (event.data.type === 'openAfkMenu') {
        document.querySelector('.afk-menu').style.display = 'block';
        document.querySelector('.progress-bar-fill').style.width = '100%';
    } else if (event.data.type === 'closeAfkMenu') {
        document.querySelector('.afk-menu').style.display = 'none';
        document.querySelector('.progress-bar-fill').style.width = '0%';
    }
});

function closeAfkMenu() {
    fetch(`https://${GetParentResourceName()}/closeAfkMenu`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8'
        },
        body: JSON.stringify({})
    }).then(resp => resp.json()).then(resp => {
        console.log(resp);
        document.querySelector('.afk-menu').style.display = 'none';
    });
}
