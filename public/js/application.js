$(document).ready(function() {

  $('.upvote-button').on('click', function (event) {
    event.preventDefault();
    var link = $(this).children().attr('href')
    console.log(link)
    $.ajax({
      url :
    })
  })
});
