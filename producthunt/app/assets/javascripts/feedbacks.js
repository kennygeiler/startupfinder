$(document).ready(function() {

  $('.container').on('click', '.comment-upvote-button', function(event) {

    event.preventDefault();
    event.stopPropagation();

    $target = $(event.target);
    path = $target.closest('.comment-upvote').children('a').attr('href');
    $destination = $target.closest('.comment-upvote').children('.comment-score')

    $.ajax({
      url: path,
      type: 'PUT'
    }).then(function(response) {
      $destination.html(response)
    })
  })

});