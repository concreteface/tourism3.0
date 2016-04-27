$(document).on('click', '.not-visited', function(event) {
  event.preventDefault();
  // debugger;
  attrId = $(this).attr('id')
  pDelete = $(this).parent()
  tDelete = $(this).parent().prev()
  cancelVisit(attrId, pDelete, tDelete);
})


var cancelVisit = function(visitId, photo, title) {

  var cancelParams = {
    user_id: gon.id
  };

  var request = $.ajax({
    url: '/visits/' + visitId,
    method: 'delete',
    data: cancelParams
  });

  request.done(function(data) {
    if (data.message == 'success') {
      photo.remove()
      title.remove()
    } else {
      alert('Something went wrong. Contact site administrator.')
    }

  });
};