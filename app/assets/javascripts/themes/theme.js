
document.ready = function() {
  var totalHeight = 0;
  
  var cardWidth = 980 - 180;
  var cardHeight = 1091 - 191;
  
  var simWidth = 980;
  var simHeight = 1091;
  
  var windowWidth = simWidth;//window.innerWidth;
  var windowHeight = simHeight;//window.innerHeight;
  
  var offsetTop = 0;//window.screenTop;
  var offsetLeft = 0;//window.screenLeft;
  
  var cardTop = 80;
  var cardLeft = (windowWidth - cardWidth);
  
  var card = document.getElementById('card');
  if (card) {
    card.style.marginTop = cardTop + 'px';
    card.style.marginLeft = 'auto';
    card.style.marginRight = 'auto';
    card.style.display = 'block';
    card.style.width = cardWidth + 'px';
    card.style.height = cardHeight + 'px';
    totalHeight += cardTop + cardHeight;
  }

  var cardButtonHeight = 100;
  var cardButtonSpacing = 40;
  var cardButtonTop = cardHeight + cardTop + cardButtonSpacing;
  
  var cardButtons = document.getElementsByClassName('card-button');
 
  for (var i = 0; i < cardButtons.length; i++) {
    var left = (windowWidth - cardWidth) / 2;

    cardButtons[i].style.marginTop = (i == 0) ? '80px' : '40px';
    cardButtons[i].style.marginLeft = 'auto';
    cardButtons[i].style.marginRight = 'auto';
    cardButtons[i].style.display = 'block';
    
    cardButtonTop += (cardButtonHeight + cardButtonSpacing);
    totalHeight += (cardButtonHeight + cardButtonSpacing);
  }
  
  if (totalHeight != 0) {
    totalHeight += 40;
    document.body.style.height = totalHeight + 'px';
  }
  
  var formWrapper = document.getElementById('form-wrapper');
  if (formWrapper) {
    formWrapper.style.position = 'relative';
    formWrapper.style.display = 'block';
    formWrapper.style.marginLeft = 'auto';
    formWrapper.style.marginRight = 'auto';
    formWrapper.style.width = '100%';
  }
};
