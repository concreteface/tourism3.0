$(document).ready(function() {
  $('.comment').hide();
})

$(function(event) {
  $('.show').click(function(event) {
    $(this).parent().parent().find('.comment').show()
  })
})