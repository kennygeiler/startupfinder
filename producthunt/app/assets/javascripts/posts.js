$(document).ready(function() {

  $('.container').on('click', '.single-line-post', function(event) {

    var $target = $(event.target);
    var $post = $target.closest('.single-line-post')

    window.location = $post.data('href');

  });

});