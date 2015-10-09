var ready;
ready = function() {
  $('.star-rating').raty({
    path: 'https://s3.amazonaws.com/the-greasy-spoon-production/Stars',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    },
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);
