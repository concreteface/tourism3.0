$(function() {
  $('.c_form').submit(function(event) {
    event.preventDefault();
    var body = $(this).serializeArray()[4]['value']
    var attrId = $(this).serializeArray()[2]['value']
    var toAppend = $(this).parent().prev();
    addComment(body, attrId, toAppend);
  });
})

var addComment = function(body, attraction, toAppend) {
  visitParams = {
    body: body,
    attraction_id: attraction,
    user_id: gon.user.id
  }

  var request = $.ajax({
    method: 'POST',
    url: '/comments',
    data: visitParams
  });

  request.done(function(data) {
    if (data.message == 'success') {
      toAppend.append("<div>" + gon.user.username + "</div>" + "<div>" + body + "</div>")
      body = '';
    } else {
      alert('Write Something Before You Press That Button!')
    }
  });
}