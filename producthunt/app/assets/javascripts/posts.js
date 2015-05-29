$(document).ready(function() {

  $(document).foundation();

  $('.container').on('click', '.single-line-post', function(event) {
    var $target = $(event.target);
    var $post = $target.closest('.single-line-post')
    $('#post-modal').html('');

    $('#post-modal').foundation('reveal','open', $post.data('href'));
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

  $('.container').on('click', '.post-upvote', function(event) {
    event.preventDefault();
    event.stopPropagation();

    var $target = $(event.target);
    var path = $target.closest('.post-upvote').children('a').attr('href');
    var $voteDestination = $target.closest('.post-upvote').children('.post-score')

    $.ajax({
      url: path,
      type: 'PUT'
    }).then(function(response) {
      $voteDestination.html(response);
    })
  })

  $('#betafeed-header').on('click', function(event) {
    event.preventDefault();

    $.get("/", function(response) {
      $('.post-listings-container').html(response);
      $('.post-filter').removeClass('active');
      $('.all-filter').addClass('active');
    })
  })

  $('.container').on('mouseenter', '.post-upvote', function(event) {
    $target = $(event.target);
    $target.closest('.post-upvote').css('cursor', 'pointer')
    $target.closest('.post-upvote').find('.post-upvote-button').css("color", "#008CBA")
  })

  $('.container').on('mouseleave', '.post-upvote', function(event) {
    $target = $(event.target);
    $target.closest('.post-upvote').find('.post-upvote-button').css("color", "#515151")
  })

});