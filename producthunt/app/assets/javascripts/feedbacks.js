$(document).ready(function() {

  $('.container').on('click', '.comment-upvote-button', function(event) {
    event.preventDefault();

    $target = $(event.target);
    path = $target.closest('.comment.upvote').children('a').attr('href');

    $.ajax({
      url: path,
      type: 'PUT'
    })
  })

});