var ready;

ready = function() {
  $('#star-rating').raty({
    path: 'https://s3.amazonaws.com/the-greasy-spoon-production/Stars',
    scoreName: 'review[rating]',
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
