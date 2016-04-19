$(function() {
  $(document).on('click','.delete', function(event) {
    event.preventDefault();
    var body = $(this).parent();
    var user = $(this).parent().prev();
    var toDelete = $(this).parent().text().replace('Delete', '').trim()
    deleteComment(body, user, toDelete);
  });
})

var deleteComment = function(body, user, commentBody) {
  var deleteParams = {
    body_string: commentBody
  };

  var request = $.ajax({
    type: 'get',
    url: '/comments/jsdelete',
    data: deleteParams
  });

  request.done(function(data) {
    if (data.message == 'success') {
      user.remove();
      body.remove();
    } else {
      alert('Something went wrong. Contact site administrator.')
    }
  });
}