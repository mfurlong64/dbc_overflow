$(document).ready(function() {

  $('.upvote-button').on('click', function (event) {
    event.preventDefault();
    var link = $(this).children().attr('href')
    console.log(link)
    $.ajax({
      url: link,
      post: "POST"
    }).done(function(data){
      var id = data['questionId']
      var vote = data['voteId']
      console.log(id)
      console.log(link)
    })
  })
});
