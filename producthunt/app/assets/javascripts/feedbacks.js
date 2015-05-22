$(document).ready(function() {

  $('.container').on('click', '.comment-upvote-button', function(event) {

    event.preventDefault();
    event.stopPropagation();

    var $target = $(event.target);
    var path = $target.closest('.comment-upvote').children('a').attr('href');
    var $voteDestination = $target.closest('.comment-upvote').children('.comment-score')
    var userId = $target.closest('.feedback-comment').find('.user-karma').data('userId')

    $.ajax({
      url: path,
      type: 'PUT'
    }).then(function(response) {
      respArray = response.split('|');
      var voteCount = respArray[0];
      var karmaCount = respArray[1];
      $voteDestination.html(voteCount);
      $('*[data-user-id="' + userId + '"]').html(karmaCount);
    })
  })

});