$(function() {
  $('.c_form').submit(function(event) {
    event.preventDefault();
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
      append.append("<div>" + gon.user.username + "<div class='hidden' id=" + data.id + "></div>"  + "</div>" + "<div>" + body + "<button name='delete_comment' class='delete tiny hollow button'>Delete</button>" + "</div>" )
      body = '';
      clear.val("");
    } else {
      alert('Write Something Before You Press That Button!')
    }
  });
}

// "<div>" + gon.user.username + "<div class='hidden' id=" + data.id + "></div>" + "</div>" + "<div>" + body + "<button name='delete_comment' class='delete tiny hollow button'>Delete</button>" + "</div>"


// "<div>" + gon.user.username + "<div class='hidden' id=" + data.id + "></div>"  + "</div>" + "<div>" + body + "<button name='delete_comment' class='delete tiny hollow button'>Delete</button>" + "</div>"

