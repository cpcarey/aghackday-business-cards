
document.ready = function() {
  var card = document.getElementById('card');
  if (card) {
    var cardWidth = 980 - 180;
    var cardHeight = 1091 - 191;
    
    var simWidth = 980;
    var simHeight = 1091;
  
    var windowWidth = simWidth;//window.innerWidth;
    var windowHeight = simHeight;//window.innerHeight;
    
    var top = (windowHeight - cardHeight) / 2;
    var left = (windowWidth - cardWidth) / 2;
    
    card.style.top = top + 'px';
    card.style.left = left + 'px';
    card.style.width = cardWidth + 'px';
    card.style.height = cardHeight + 'px';
  }
};
