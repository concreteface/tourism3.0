$(function() {
  $(".hidden").hide();
  $('.visitb').click(function(event) {
    event.preventDefault();
    addVisit(this);
  });
})

var addVisit = function(element) {
  var toRemove = element
  var insertAfter = $(element).parent().prev()
  var toShow = $(element).next()
  var attractionId = $(element).attr('id');
  var userId = gon.user.id;
  var visitParams = {
    user_id: userId,
    attraction_id: attractionId
  };
  var request = $.ajax({
    method: 'POST',
    url: '/visits',
    data: visitParams
  });

  request.done(function(data) {
    if (data.message == 'success') {
      $(toRemove).remove()
      $(toShow).fadeIn(200)
    } else {
      alert('Something went wrong...contact site administrator.')
    }
  });
};