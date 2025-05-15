$(document).ready(function () {
    const $sliderContainer = $(".slider-container");
    const $sliderLeftArr = $(".slider-left-arr");
    const $sliderRightArr = $(".slider-right-arr");
    const $sliderItems = $(".slider-wrapper");

    const itemWidth = 1440;
    const maxScrollLeft = $sliderItems.length * itemWidth - $sliderContainer[0].clientWidth;

    let isDragging = false;
    let startX;
    let scrollLeft;

    $sliderRightArr.on("click", function () {
        if ($sliderContainer.scrollLeft() + itemWidth >= maxScrollLeft) {
            $sliderContainer.scrollLeft(0);
        } else {
            $sliderContainer.scrollLeft($sliderContainer.scrollLeft() + itemWidth);
        }
    });

    $sliderLeftArr.on("click", function () {
        if ($sliderContainer.scrollLeft() - itemWidth >= 0) {
            $sliderContainer.scrollLeft($sliderContainer.scrollLeft() - itemWidth);
        } else {
            $sliderContainer.scrollLeft(maxScrollLeft);
        }
    });

    $sliderContainer.on("mousedown", function (e) {
        isDragging = true;
        startX = e.pageX - $sliderContainer.offset().left;
        scrollLeft = $sliderContainer.scrollLeft();
    });

    $sliderContainer.on("mouseleave mouseup", function () {
        isDragging = false;
    });

    $sliderContainer.on("mousemove", function (e) {
        if (!isDragging) return;
        e.preventDefault();
        const x = e.pageX - $sliderContainer.offset().left;
        const walk = (x - startX) * 2;
        $sliderContainer.scrollLeft(scrollLeft - walk);
    });
});


function updateBackgrounds() {
    let images = $('.bg img');
    let divs = $('.side-num-border');
    let sideNum = $('.side-num');
    let currentIndex = 0;
    let numberOfImages = images.length;
    let divHeight = 100 / numberOfImages;
    let increment = (100 - divHeight) / (numberOfImages - 1);
    let intervalTime = 10000;

    divs.css('height', divHeight + '%');

    function updateDivsTop() {
        divs.each(function(index) {
            let newIndex = (currentIndex + index) % numberOfImages;
            let newTop = increment * newIndex;

            if (newTop >= 100 - divHeight) {
                newTop = 100 - divHeight;
            }

            $(this).css({
                'top': newTop + '%',
                'bottom': ''
            });
        });
    }

    function updateSideNum() {
        let formattedNumber = ('0' + (currentIndex + 1)).slice(-2);
        sideNum.text(formattedNumber);
    }

    function showNextImage() {
        images.eq(currentIndex).removeClass('active');
        currentIndex = (currentIndex + 1) % images.length;
        images.eq(currentIndex).addClass('active');
        updateDivsTop();
        updateSideNum();
    }

    let interval = setInterval(showNextImage, intervalTime);

    $('.next-btn').on('click', function() {
        clearInterval(interval);
        showNextImage();
        interval = setInterval(showNextImage, intervalTime);
    });

    updateDivsTop();
    updateSideNum();
}

function changePage(page) {
    $('.menu-item').removeClass('active')
    $('.button_'+page).addClass('active')

    $('.pages').hide(300)
    $('.page_'+page).show(300)
}


window.addEventListener('DOMContentLoaded', () => {
    if(window.nuiHandoverData.team) {
        setupTeam(window.nuiHandoverData.team)
        setupGallery(window.nuiHandoverData.galleryList)
        setupMedia(window.nuiHandoverData.mediaList)
        setupBackgrounds(window.nuiHandoverData.Backgrounds)

        defaultVolume = window.nuiHandoverData.Volume
        musicList = window.nuiHandoverData.musicList
        startMusic()
    }
});

function setupBackgrounds(backgrounds) {
    for (let i = 0; i < backgrounds.length; i++) {
        let img = `<img src="${backgrounds[i]}">`;

        if (i === 0) {
            img = `<img src="${backgrounds[i]}" class="active">`;
        }

        $('.bg').append(img);
    }
    updateBackgrounds()
}


function setupGallery(data) {
    for(i = 0; i <= data.length; i++) {
        if(data[i]) {
            let div = `<img onclick="gallery('`+data[i]+`')" src="`+data[i]+`" class="character-img">`
            $('.character-images-container').append(div)
        }
    }
    updateGallery()
}

function updateGallery() {
    
$(document).ready(function() {
    let interval = 5000;
    let movement = 52.3;
    let initialLeft = 50.35;
    let elements = $('.character-img');
    let totalElements = elements.length;
    let index = 0;
    let autoSlide;

    for (let i = 0; i < totalElements; i++) {
        $('.character-select-process-item-container').append('<div class="character-select-process-item"></div>');
    }

    let processItems = $('.character-select-process-item');
    $(processItems[0]).addClass('active');

    $('.character-select-rate-right').text(totalElements.toString().padStart(2, '0'));

    $('.character-select-rate-left').text('01');

    elements.css('left', initialLeft + 'vh');

    function startAutoSlide() {
        autoSlide = setInterval(function() {
            moveRight();
        }, interval);
    }

    function stopAutoSlide() {
        clearInterval(autoSlide);
    }

    function moveRight() {
        if (index < totalElements - 1) {
            index++;
        } else {
            index = 0;
        }
        updateSlide();
    }

    function moveLeft() {
        if (index > 0) {
            index--;
        } else {
            index = totalElements - 1;
        }
        updateSlide();
    }

    function updateSlide() {
        let newLeft;
        if (index === 0) {
            newLeft = initialLeft;
        } else {
            newLeft = initialLeft - (movement * index);
        }

        elements.css('left', newLeft + 'vh');
        processItems.removeClass('active');
        $(processItems[index]).addClass('active');
        
        $('.character-select-rate-left').text((index + 1).toString().padStart(2, '0'));
    }

    $('.character-select-right-arr').on('click', function() {
        stopAutoSlide();
        moveRight();
        startAutoSlide();
    });

    $('.character-select-left-arr').on('click', function() {
        stopAutoSlide();
        moveLeft();
        startAutoSlide();
    });

    startAutoSlide();
});
}

function gallery(src) {
    if(src) {
        $('.show').attr('src', src)
        $('.gallery-show').css('display', 'flex')
    }
    else {
        $('.gallery-show').hide()        
    }
}

let pagesUrl = {}

function setupMedia(data) {
    for (let key in data) {
        if (data.hasOwnProperty(key)) {
            pagesUrl[key] = data[key];
        }
    }
}

function setupTeam(item) {
    for (let i = 0; i < item.length; i++) {
        let div = `
        <div class="slider-wrapper">
            <img src="${item[i].image}" class="slider-img">
            <div class="slider-job">${item[i].rank}</div>
            <div class="slider-title">${item[i].name}</div>
            <div class="slider-text">${item[i].description}</div>
            <div class="slider-icons-box">
            <div  onclick="openURL('${item[i].media.facebook}')" class="media-icon">
            <svg
            xmlns="http://www.w3.org/2000/svg"
            width="2.0833vw"
            height="2.0833vw"
            viewBox="0 0 40 40"
            fill="none"
          >
            <path
              d="M36.6667 20C36.6667 10.8 29.2 3.33331 20 3.33331C10.8 3.33331 3.33334 10.8 3.33334 20C3.33334 28.0666 9.06667 34.7833 16.6667 36.3333V25H13.3333V20H16.6667V15.8333C16.6667 12.6166 19.2833 9.99998 22.5 9.99998H26.6667V15H23.3333C22.4167 15 21.6667 15.75 21.6667 16.6666V20H26.6667V25H21.6667V36.5833C30.0833 35.75 36.6667 28.65 36.6667 20Z"
            />
          </svg>
        </div>
        <div  onclick="openURL('${item[i].media.instagram}')" class="media-icon">
            <svg
            xmlns="http://www.w3.org/2000/svg"
            width="1.7708vw"
            height="1.7708vw"
            viewBox="0 0 34 34"
            fill="none"
          >
            <path
              d="M11.05 2.83334H22.95C27.4833 2.83334 31.1667 6.51668 31.1667 11.05V22.95C31.1667 25.1292 30.301 27.2191 28.7601 28.7601C27.2191 30.301 25.1292 31.1667 22.95 31.1667H11.05C6.51666 31.1667 2.83333 27.4833 2.83333 22.95V11.05C2.83333 8.87082 3.69901 6.78087 5.23993 5.23995C6.78086 3.69903 8.8708 2.83334 11.05 2.83334ZM10.7667 5.66668C9.41406 5.66668 8.11685 6.204 7.16042 7.16043C6.20398 8.11687 5.66666 9.41407 5.66666 10.7667V23.2333C5.66666 26.0525 7.9475 28.3333 10.7667 28.3333H23.2333C24.5859 28.3333 25.8831 27.796 26.8396 26.8396C27.796 25.8832 28.3333 24.5859 28.3333 23.2333V10.7667C28.3333 7.94751 26.0525 5.66668 23.2333 5.66668H10.7667ZM24.4375 7.79168C24.9072 7.79168 25.3576 7.97825 25.6897 8.31034C26.0218 8.64244 26.2083 9.09286 26.2083 9.56251C26.2083 10.0322 26.0218 10.4826 25.6897 10.8147C25.3576 11.1468 24.9072 11.3333 24.4375 11.3333C23.9678 11.3333 23.5174 11.1468 23.1853 10.8147C22.8532 10.4826 22.6667 10.0322 22.6667 9.56251C22.6667 9.09286 22.8532 8.64244 23.1853 8.31034C23.5174 7.97825 23.9678 7.79168 24.4375 7.79168ZM17 9.91668C18.8786 9.91668 20.6803 10.663 22.0087 11.9913C23.3371 13.3197 24.0833 15.1214 24.0833 17C24.0833 18.8786 23.3371 20.6803 22.0087 22.0087C20.6803 23.3371 18.8786 24.0833 17 24.0833C15.1214 24.0833 13.3197 23.3371 11.9913 22.0087C10.6629 20.6803 9.91666 18.8786 9.91666 17C9.91666 15.1214 10.6629 13.3197 11.9913 11.9913C13.3197 10.663 15.1214 9.91668 17 9.91668ZM17 12.75C15.8728 12.75 14.7918 13.1978 13.9948 13.9948C13.1978 14.7918 12.75 15.8728 12.75 17C12.75 18.1272 13.1978 19.2082 13.9948 20.0052C14.7918 20.8022 15.8728 21.25 17 21.25C18.1272 21.25 19.2082 20.8022 20.0052 20.0052C20.8022 19.2082 21.25 18.1272 21.25 17C21.25 15.8728 20.8022 14.7918 20.0052 13.9948C19.2082 13.1978 18.1272 12.75 17 12.75Z"
            />
          </svg>
        </div>
        <div  onclick="openURL('${item[i].media.twitter}')" class="media-icon">
            <svg
            xmlns="http://www.w3.org/2000/svg"
            width="1.5625vw"
            height="1.5625vw"
            viewBox="0 0 30 30"
            fill="none"
          >
            <path
              d="M23.6262 1.44128H28.2262L18.1763 12.9288L30 28.5575H20.7425L13.4925 19.0775L5.195 28.5575H0.5925L11.3425 16.27L0 1.44253H9.4925L16.0462 10.1075L23.6262 1.44128ZM22.0125 25.805H24.5613L8.1075 4.05003H5.3725L22.0125 25.805Z"

            />
          </svg>
        </div>
        <div  onclick="openURL('${item[i].media.tiktok}')" class="media-icon">
            <svg
            xmlns="http://www.w3.org/2000/svg"
            width="2.2917vw"
            height="2.2917vw"
            viewBox="0 0 44 44"
            fill="none"
          >
            <path
              d="M30.4333 10.67C29.1804 9.23913 28.4898 7.4019 28.49 5.5H22.825V28.2333C22.7822 29.4639 22.2631 30.6296 21.3772 31.4847C20.4914 32.3399 19.3079 32.8174 18.0767 32.8167C15.4733 32.8167 13.31 30.69 13.31 28.05C13.31 24.8967 16.3533 22.5317 19.4883 23.5033V17.71C13.1633 16.8667 7.62668 21.78 7.62668 28.05C7.62668 34.155 12.6867 38.5 18.0583 38.5C23.815 38.5 28.49 33.825 28.49 28.05V16.5183C30.7872 18.1681 33.5452 19.0532 36.3733 19.0483V13.3833C36.3733 13.3833 32.9267 13.5483 30.4333 10.67Z"
            />
          </svg>
        </div>
        <div  onclick="openURL('${item[i].media.youtube}')" class="media-icon">
            <svg
            xmlns="http://www.w3.org/2000/svg"
            width="1.875vw"
            height="1.875vw"
            viewBox="0 0 36 36"
            fill="none"
          >
            <g clip-path="url(#clip0_1_24)">
              <path
                fill-rule="evenodd"
                clip-rule="evenodd"
                d="M18 6C19.2825 6 20.598 6.033 21.873 6.087L23.379 6.159L24.8205 6.2445L26.1705 6.336L27.4035 6.432C28.7418 6.53384 30.0012 7.10465 30.9599 8.0439C31.9187 8.98315 32.5152 10.2306 32.6445 11.5665L32.7045 12.204L32.817 13.569C32.922 14.9835 33 16.5255 33 18C33 19.4745 32.922 21.0165 32.817 22.431L32.7045 23.796L32.6445 24.4335C32.5152 25.7696 31.9184 27.0173 30.9594 27.9566C30.0003 28.8958 28.7405 29.4665 27.402 29.568L26.172 29.6625L24.822 29.7555L23.379 29.841L21.873 29.913C20.5827 29.9689 19.2915 29.9979 18 30C16.7085 29.9979 15.4173 29.9689 14.127 29.913L12.621 29.841L11.1795 29.7555L9.8295 29.6625L8.5965 29.568C7.25822 29.4662 5.9988 28.8953 5.04007 27.9561C4.08133 27.0168 3.48479 25.7694 3.3555 24.4335L3.2955 23.796L3.183 22.431C3.06875 20.9567 3.00771 19.4787 3 18C3 16.5255 3.078 14.9835 3.183 13.569L3.2955 12.204L3.3555 11.5665C3.48474 10.2308 4.08107 8.98358 5.03949 8.04436C5.99792 7.10514 7.25699 6.53417 8.595 6.432L9.8265 6.336L11.1765 6.2445L12.6195 6.159L14.1255 6.087C15.4163 6.03109 16.708 6.00208 18 6ZM15 14.3625V21.6375C15 22.3305 15.75 22.7625 16.35 22.4175L22.65 18.78C22.7871 18.7011 22.901 18.5874 22.9801 18.4505C23.0593 18.3136 23.101 18.1582 23.101 18C23.101 17.8418 23.0593 17.6864 22.9801 17.5495C22.901 17.4126 22.7871 17.2989 22.65 17.22L16.35 13.584C16.2131 13.505 16.0579 13.4634 15.8999 13.4634C15.7418 13.4634 15.5866 13.5051 15.4497 13.5841C15.3129 13.6632 15.1993 13.7769 15.1204 13.9138C15.0414 14.0507 14.9999 14.206 15 14.364V14.3625Z"
              />
            </g>
            <defs>
              <clipPath id="clip0_1_24">
                <rect width="36" height="36" fill="white" />
              </clipPath>
            </defs>
          </svg>
        </div>
            </div>
        </div>`;
        $('.slider-container').append(div);
    }
}


function openPage(page) {
    window.invokeNative("openUrl", pagesUrl[page]);
}

function openURL(url) {
    window.invokeNative("openUrl", url);
}

let musicValue = true

function music() {
    if(!musicValue) {
        $('.music-box-container').css('top', "-12.5vh")
        musicValue = true
    }
    else {
        $('.music-box-container').css('top', "-5vh")
        musicValue = false
    }
}