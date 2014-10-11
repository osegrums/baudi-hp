var initSlideShow = function($container) {
  var transitionMs = 800;
  var betweenSlidesMs = 4000;

  preLoadImages($container);

  var count = $container.find('img').size();

  var currentSlide = 0;

  $('.slides-container img').hide()

  $($container.find('img')[currentSlide]).fadeIn(transitionMs);
  setInterval(function() {
    var nextSlide = currentSlide + 1;
    if(nextSlide >= count) nextSlide = 0;
    $($container.find('img')[currentSlide]).fadeOut(transitionMs);
    $($container.find('img')[nextSlide]).fadeIn(transitionMs);
    // if(currentSlide == 0) { setTimeout(function() {}, 5000) }
    currentSlide = nextSlide;
  }, betweenSlidesMs);
}

var preLoadImages = function($container) {
  $container.data('images').forEach(function(imageUrl, index, arr) {
    var cacheImage = document.createElement('img');
    cacheImage.src = imageUrl;
    $container.append(cacheImage);
  });
}
