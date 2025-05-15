var imagedict = null
var nowitems = {}
var basketitems = {}
var totalitemdata = {}
var categories = {}
var language = {}
var selectedaq = "all"
var totalprice = 0

$(document).ready(function () {
	$('#input-search').on('input', function() {
		var searchQuery = $(this).val().toLowerCase();
	
		$('.container').each(function() {
			var label = $(this).find('.uruntext').text().toLowerCase();
			var itemCategory = $(this).data('category');
	
			if (label.indexOf(searchQuery) !== -1 && (selectedaq === 'all' || itemCategory === selectedaq)) {
				$(this).show();
			} else {
				$(this).hide();
			}
		});
	});

	$('#paycash').on('click', function() {
		$.post('https://savana-shopsv2/paycash', JSON.stringify({ basket: basketitems, price: totalprice }));
	});

	$('#paybank').on('click', function() {
		$.post('https://savana-shopsv2/paybank', JSON.stringify({ basket: basketitems, price: totalprice }));
	});
});

window.addEventListener('message', function (event) {
	let data = event.data;
	switch (data.action) {
		case 'close':
			basketitems = {}
			closemenu();
		break;
		case 'closedata':
			basketitems = {}
		break;
		case 'open':
			$('body').fadeIn(500);
			$('.ShopScreen').fadeIn(500);
			document.getElementById('marketlabel').innerHTML = data.data.MarketName;
			document.getElementById('cashmoney').innerHTML = "$ " + data.data.moneydata.cash.toLocaleString();
			document.getElementById('bankmoney').innerHTML = "$ " + data.data.moneydata.bank.toLocaleString();
			$('#totalprice').text(language.total_price + " $0");
			$('#totaltype').text(language.total_type + " 0x");
			$('#totalcategories').text(language.total_product_type +" 0x");

			const sortedItems = {};

			const sortedCategories = Object.keys(data.data.items).sort();

			for (const category of sortedCategories) {
			const items = data.data.items[category];

			if (!items) {
				console.warn(`No items found in category ${category}`);
				continue;
			}

			const sortedCategoryItems = Object.entries(items)
				.sort((a, b) => a[1]?.label?.localeCompare(b[1]?.label))
				.map(([key, item]) => {
				if (item && item.label && item.price !== undefined) {
					return { [key]: item };
				} else {
					console.error(`Missing label or price for item ${key} in category ${category}`);
					return null;
				}
				})
				.filter(item => item !== null);

			sortedItems[category] = sortedCategoryItems;
			}
			
			data.data.items = sortedItems;
		
			function calculateTotalItems() {
				var totalItemsCount = 0;
				var totalTypesCount = 0;
		
				for (var tokenData in basketitems) {
					if (basketitems.hasOwnProperty(tokenData)) {
						totalItemsCount += basketitems[tokenData];
						totalTypesCount++;
					}
				}
		
				$('#totaltype').text("Total Type: " + totalTypesCount + "x");
				calculateTotalCategories()
			}
		
			function calculateTotalCategories() {
				var categoriesInBasket = new Set();
		
				for (var tokenData in basketitems) {
					if (basketitems.hasOwnProperty(tokenData)) {
						for (var category in totalitemdata) {
							if (totalitemdata.hasOwnProperty(category)) {
								for (var categoryname in totalitemdata[category]) {
									if (totalitemdata[category][categoryname].hasOwnProperty(tokenData)) {
										categoriesInBasket.add(category);
									}
								}
							}
						}
					}
				}
		
				var totalCategories = categoriesInBasket.size;
				$('#totalcategories').text("Total Product Type: " + totalCategories + "x");
			}
		
			$('.typesscroll').empty();
			var CategoryItems = '';
			CategoryItems += `
				<div class="typetext" data-token="all" style="min-width: 19%; width: 19%; height: 100%; background: rgba(217, 217, 217, 0.05); display: flex; align-items: center; justify-content: center;">All</div>
			`;
			for (var category in data.data.items) {
				CategoryItems += `
					<div class="typetext" data-token="${category}" style="min-width: 19%; width: 19%; height: 100%; background: rgba(217, 217, 217, 0.05); display: flex; align-items: center; justify-content: center;">${categories[category]}</div>
				`;
			}
			$('.typesscroll').html(CategoryItems);
		
			$('.items').empty();
			nowitems = {}
			totalitemdata = data.data.items
			basketitems = {}
			var Items = '';
			for (var category in data.data.items) {
				for (var item in data.data.items[category]) {
					var element = undefined
					var itemnameaq = undefined
					for (var itemaq in data.data.items[category][item]) {
						element = data.data.items[category][item][itemaq];
						nowitems[itemaq] = data.data.items[category][item][itemaq]
						itemnameaq = itemaq
					}
					Items += `
						<div class="container" data-token="${itemnameaq}" data-category="${category}" style="border: 0.055vw solid rgba(255, 255, 255, 0.17); background: rgba(255, 255, 255, 0.03); width: 100%; height: 96%; display: flex; align-items: center; justify-content: flex-start; flex-direction: column;">
							<div style="width: 100%; height: 8%;"></div>
							<div class="uruntext" style="width: 100%; height: 11%; display: flex; align-items: center; justify-content: center;">${element.label}</div>
							<div style="width: 100%; height: 66%; display: flex; align-items: center; justify-content: center; background-image: url(${imagedict}${itemnameaq}.png); background-position: center; background-repeat: no-repeat; background-size: 50% auto;"></div>
							<div style="width: 100%; height: 15%; background: #42EA7B; display: flex; align-items: center; justify-content: center;">
								<div class="addbaskettext" style="width: 100%; height: 100%; background: #42EA7B;">Sepete Ekle</div>
								<div class="pricetext" style="width: 100%; height: 100%; background: #42EA7B;">$${element.price}</div>
							</div>
						</div>
					`;
				}
			}
			$('.items').html(Items);
		
			function calculateTotalPrice() {
				var totalPrice = 0;
		
				for (var tokenData in basketitems) {
					if (basketitems.hasOwnProperty(tokenData)) {
						var quantity = basketitems[tokenData];
						var price = nowitems[tokenData].price;
						totalPrice += price * quantity;
					}
				}
				calculateTotalItems()
				totalprice = totalPrice
		
				$('#totalprice').text("Total Price: $" + totalPrice.toLocaleString());
			}
		
			$('.typesscroll').on('click', '.typetext', function() {
				var selectedCategory = $(this);
				var categoryToken = selectedCategory.data('token');
				selectedaq = categoryToken

				$('.typetext').css('background', 'rgba(217, 217, 217, 0.05)');
				$('.typetext').css('background-image', 'none');

				selectedCategory.css('background', 'rgba(217, 217, 217, 0.25)');

				selectedCategory.css('border-bottom', '2px solid transparent');
				selectedCategory.css('background-image', 'linear-gradient(90deg, transparent 0%, transparent 20%, #FFF 20%, #FFF 100%)');
				selectedCategory.css('background-position', 'bottom');
				selectedCategory.css('background-repeat', 'no-repeat');
				selectedCategory.css('background-size', '40% 2px');

				if (categoryToken === 'all') {
					$('.items .container').show();
				} else {
					$('.items .container').each(function() {
						var itemCategory = $(this).data('category');
						if (itemCategory === categoryToken) {
							$(this).show();
						} else {
							$(this).hide();
						}
					});
				}
			});
		
			$('.items').on('click', '.container', function() {
				var tokenData = $(this).data('token');
				var element = nowitems[tokenData];
				if (basketitems[tokenData]) {
					return;
				}
		
				basketitems[tokenData] = 1;
				calculateTotalPrice();
		
				$('.basket').append(`
					<div class="basket-item" data-token="${tokenData}" style="animation: menuAnimation 0.5s ease-in-out; width: 89.7%; height: 18.3%; min-height: 18.3%; border: 1.063px solid rgba(255, 255, 255, 0.17); background: rgba(255, 255, 255, 0.03); display: flex; align-items: center; justify-content: flex-start; flex-direction: row;">
						<div style="width: 3%; height: 100%;"></div>
						<div class="baskettext" style="opacity: 0.7; width: 37%; height: 100%; background-image: url(${imagedict}${tokenData}.png); background-position: left center; background-repeat: no-repeat; background-size: 50% auto; display: flex; align-items: center; justify-content: center; padding-right: 11%">${element.label}</div>
						<div style="width: 0.7%; height: 10%;"></div>
						<div style="width: 28.5%; height: 35%; border-radius: 20px; border: 1px solid rgba(255, 255, 255, 0.20); background: rgba(255, 255, 255, 0.10); display: flex; align-items: center; justify-content: flex-start; flex-direction: row;">
							<div style="width: 12%; height: 100%;"></div>
							<div class="touch minus" style="width: 15%; height: 100%; background-image: url(./img/minus.png); background-position: center; background-repeat: no-repeat; background-size: auto 100%;"></div>
							<input style="width: 43%; height: 100%; display: flex; align-items: center; justify-content: center;" type="number" value="1" class="input-basket" placeholder="1" />
							<div class="touch plus" style="width: 15%; height: 100%; background-image: url(./img/plus.png); background-position: center; background-repeat: no-repeat; background-size: auto 100%;"></div>
						</div>
						<div style="width: 5%; height: 10%;"></div>
						<div class="piecetext" style="width: 25.5%; height: 30%; display: flex; align-items: center; justify-content: flex-start;">${language.piece}: $${element.price}</div>
					</div>
				`);
		
				$(this).find('.addbaskettext').text("ADDED").css("background", "#6CFA85");
		
				$(this).find('.pricetext').text("ADDED").css("color", "black");
		
				$(this).find('.addbaskettext').off('click');
		
				$(document).off('click', '.touch.minus').on('click', '.touch.minus', function() {
					var inputField = $(this).siblings('.input-basket');
					var currentValue = parseInt(inputField.val());
					var basketItem = $(this).closest('.basket-item');
					var tokenData = basketItem.data('token');
				
					if (currentValue > 1) {
						inputField.val(currentValue - 1);
						basketitems[tokenData] = currentValue - 1;
					} else if (currentValue === 1) {
						basketItem.fadeOut(500, function() {
							basketItem.remove();
							delete basketitems[tokenData];
							calculateTotalPrice();
						});
					}
				
					calculateTotalPrice();
					$('.items').find(`.container[data-token="${tokenData}"]`).each(function() {
						$(this).find('.addbaskettext').text("Sepete Ekle").css("background", "#42EA7B");
						$(this).find('.pricetext').text(`$${nowitems[tokenData].price}`).css("color", "rgba(0, 0, 0, 0.54)");
					});
				});
		
				$(document).off('click', '.touch.plus').on('click', '.touch.plus', function() {
					var inputField = $(this).siblings('.input-basket');
					var currentValue = parseInt(inputField.val());
					var basketItem = $(this).closest('.basket-item');
					var tokenData = basketItem.data('token');
		
					inputField.val(currentValue + 1);
					basketitems[tokenData] = currentValue + 1;
		
					calculateTotalPrice();
				});
		
				$(document).off('change', '.input-basket').on('change', '.input-basket', function() {
					var inputField = $(this);
					var newValue = parseInt(inputField.val());
					var basketItem = $(this).closest('.basket-item');
					var tokenData = basketItem.data('token');
		
					if (newValue <= 0) {
						basketItem.fadeOut(500, function() {
							basketItem.remove(); 
							delete basketitems[tokenData];
							calculateTotalPrice();
						});
					} else {
						basketitems[tokenData] = newValue;
					}
		
					calculateTotalPrice();
		
					$('.items').find(`.container[data-token="${tokenData}"]`).each(function() {
						$(this).find('.addbaskettext').text("Sepete Ekle").css("background", "#42EA7B");
		
						$(this).find('.pricetext').text(`$${element.price}`).css("color", "rgba(0, 0, 0, 0.54)");
					});
				});
			});
		
			$('.basket').empty();
			$('.typesscroll').find('.typetext[data-token="all"]').click();
		break;
		case 'SetSettings':
			imagedict = data.data.ItemImageDict
			language = data.data.Strings
			categories = data.data.CategoryNames

			document.getElementById('carttext').innerHTML = language.Shopping_Cart;
			document.getElementById('paycash').innerHTML = language.pay_cash;
			document.getElementById('paybank').innerHTML = language.pay_bank;
		break;
	}
});

$(document).on('keydown', function () {
	switch (event.keyCode) {
		case 27:
			closemenu();
			break;
	}
});

function closemenu() {
    $('.ShopScreen').fadeOut(500);
	$('body').fadeOut(500);
	$.post('https://savana-shopsv2/close', JSON.stringify({}));
}
