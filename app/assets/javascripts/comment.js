$(function() {
  $('.c_form').submit(function(event) {
    event.preventDefault();
    // debugger;
    // var body = $(this).serializeArray()[4]['value'];
    // var attrId = $(this).serializeArray()[2]['value'];
    // var toAppend = $(this).parent().prev();
    // var toClear = gon.ids.indexOf(parseInt(attrId));
    var body = $(this).find("#body").val();
    var attrId = $(this).find("#attraction_id").val();
    var toAppend = $(this).parent().prev();
    var toClear = $(this).find("input#body");
    addComment(body, attrId, toAppend, toClear);
  });
})

var addComment = function(body, attraction, append, clear) { 
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
      append.append("<div>" + gon.user.username + "</div>" + "<div>" + body + "</div>")
      body = '';
      // $('.c_form')[clear].reset();
      clear.val("");
    } else {
      alert('Write Something Before You Press That Button!')
    }
  });
}