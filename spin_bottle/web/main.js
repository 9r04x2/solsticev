$(document).ready((function() {
    window.addEventListener('message', event => {
        const { type, bool, locs } = event.data;
        if (type === 'main') {
            if (bool === 'open') {
                $('body').fadeIn(250);
                $('body').css('display', 'flex');
            } else if (bool === 'close') {
                $('body').fadeOut(250);
                setTimeout(() => {
                    $('body').css('display', 'none');
                }, 250);
            } else if (bool === 'update') {
                $('.pressETitle').html(locs["pressETitle"]);
                $('.pressEDesc').html(locs["pressEDesc"]);
                $('.pressGTitle').html(locs["pressGTitle"]);
                $('.pressGDesc').html(locs["pressGDesc"]);
            }
        }
    });

    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            $('body').css('display', 'none');
        } 
    });
}));