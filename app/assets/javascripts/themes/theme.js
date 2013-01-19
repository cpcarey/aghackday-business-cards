
document.ready = function() {
  var totalHeight = 0;
  
  var cardWidth = 980 - 180;
  var cardHeight = 1091 - 191;
  
  var simWidth = 980;
  var simHeight = 1091;
  
  var windowWidth = simWidth;//window.innerWidth;
  var windowHeight = simHeight;//window.innerHeight;
  
  var cardTop = (windowHeight - cardHeight) / 2;
  var cardLeft = (windowWidth - cardWidth) / 2;
  
  var card = document.getElementById('card');
  if (card) {
    card.style.top = cardTop + 'px';
    card.style.left = cardLeft + 'px';
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

    cardButtons[i].style.top = cardButtonTop + 'px';
    cardButtons[i].style.left = left + 'px';
    
    cardButtonTop += (cardButtonHeight + cardButtonSpacing);
    totalHeight += (cardButtonHeight + cardButtonSpacing);
  }
  
  if (totalHeight != 0) {
    totalHeight += 40;
    document.body.style.height = totalHeight + 'px';
  }
};
