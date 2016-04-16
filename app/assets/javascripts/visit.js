$(function() {
  $('.visited').click(function(event) {
    event.preventDefault();
    addVisit(this);
  });
})

var getAttractionId = function(input) {
  var str = input.parentElement.parentElement.firstElementChild.nextElementSibling.innerHTML
  var reg = /\/\d+\//;
  var array = reg.exec(str)
  return (array[0].split('/')[1])
}

var addVisit = function(attrStr) {
  var attractionId = getAttractionId(attrStr);
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
      alert('you did it')
    } else {
      alert('something went wrong')
    }


  });

};