$(document).ready(function() {

  $('.new-comment-form').hide();
  $('.new-feedback-form').hide();

  $('.container').on('click', '.new-comment-button', function(event) {
    event.preventDefault();

    $target = $(event.target);
    $target.closest('.feedback-container').children('.new-comment-form').show();
    $target.hide();
  })

  $('.container').on('submit', '.new_comment', function(event) {
    event.preventDefault();

    $form = $(event.target);

    $.ajax({
      url: $form.attr('action'),
      type: 'POST',
      data: $form.serialize()
    }).then(function(response) {
      $form.closest('.feedback-container').children('.feedback-comments-container').append(response);
      $form.trigger('reset')
    })
  })

  $('.container').on('click', '.new-feedback-button', function(event) {
    event.preventDefault();

    $target = $(event.target);
    $target.closest('.feedback-listing-container').children('.new-feedback-form').show();
    $target.hide();
  })

  $('.container').on('submit', '.new_feedback', function(event) {
    event.preventDefault();

    $form = $(event.target);

    $.ajax({
      url: $form.attr('action'),
      type: 'POST',
      data: $form.serialize()
    }).then(function(response) {
      $form.closest('.feedback-listing-container').children('.feedback-listing').append(response);
      $form.closest('.feedback-listing-container').find('.feedback-container').last().children('.new-comment-form').hide();
      $form.trigger('reset')
    })
  })

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