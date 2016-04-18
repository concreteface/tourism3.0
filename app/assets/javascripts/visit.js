$(function() {
  $('.visited').click(function(event) {
    event.preventDefault();
    addVisit(this);
  });
})

var getAttractionId = function(input) {
  var str = $(input).parent().siblings()[1].innerHTML
  var reg = /\/\d+\//;
  var array = reg.exec(str)
  return (array[0].split('/')[1])
}

var addVisit = function(element) {
  var toRemove = element
  var attractionId = getAttractionId(element);
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
      $(toRemove).hide(200, function() {
        $(this).remove();
      });
    } else {
      alert('Something went wrong...contact site administrator.')
    }
  });
};