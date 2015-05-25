$(document).ready(function() {

  $(document).foundation();

  $('.container').on('click', '.single-line-post', function(event) {
    var $target = $(event.target);
    var $post = $target.closest('.single-line-post')

    $('#post-modal').foundation('reveal','open', $post.data('href'))
  });

  $('.container').on('click', '.post-filter', function(event) {
    event.preventDefault();

    var $target = $(event.target);

    $.get($target.attr('href'), function(response) {
      $('.post-listings-container').html(response);
      $('.post-filter').removeClass('active');
      $target.addClass('active');
    });
  })

});