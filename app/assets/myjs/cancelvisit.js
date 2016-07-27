$(document).on('click', '.not-visited', function(event) {
  event.preventDefault();
  attrId = $(this).attr('id')
  bDelete = $(this).parent()
  pDelete = $(this).parent().prev()
  tDelete = $(this).parent().prev().prev()
  cancelVisit(attrId, pDelete, tDelete, bDelete);
})


var cancelVisit = function(visitId, photo, title, button) {

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
      button.fadeOut(200)
      photo.fadeOut(200)
      title.fadeOut(200)
    } else {
      alert('Something went wrong. Contact site administrator.')
    }

  });
};