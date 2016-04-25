$(document).ready(function(event) {
  var setLat;
  var setLng;

  $.getScript(gon.url, function() {
    createMap();
  });

})
var createMap = function initMap() {
  var latLng = {
    lat: gon.lat,
    lng: gon.long
  };
  var map;
  var geocoder = new google.maps.Geocoder();
  var infowindow = new google.maps.InfoWindow();

  function initialize() {
    var mapOptions = {
      zoom: 15,
      center: latLng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map(document.getElementById('jsMap'), mapOptions);

    var marker = new google.maps.Marker({
      position: latLng,
      map: map,
      draggable: true
    });
    geocoder.geocode({
      'latLng': latLng
    }, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        if (results[0]) {
          $('#latitude,#longitude').show();
          $('#address').val(results[0].formatted_address);
          $('#latitude').val(marker.getPosition().lat());
          $('#longitude').val(marker.getPosition().lng());
          infowindow.setContent(results[0].formatted_address);
          infowindow.open(map, marker);
        }
      }
    });

    google.maps.event.addListener(marker, 'dragend', function() {

      geocoder.geocode({
        'latLng': marker.getPosition()
      }, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          if (results[0]) {
            $('#address').val(results[0].formatted_address);
           setLat = $('#latitude').val(marker.getPosition().lat());
           setLng = $('#longitude').val(marker.getPosition().lng());
            infowindow.setContent(results[0].formatted_address);
            infowindow.open(map, marker);
          }
        }
      });
    });

  }
  google.maps.event.addDomListener(window, 'load', initialize);
};

$(document).on('click', '#update_loc', function(event) {
  event.preventDefault();
  var locationParams = {
    latitude: setLat.val(),
    longitude: setLng.val(),
    id: gon.id
  }
  var request = $.ajax({
    method: 'put',
    url: '/attractions/update_location',
    data: locationParams
  });

  request.done(function(data) {
    if (data.message == 'success') {
      alert('You updated the location.')
    } else if (data.message == 'failure') {
      alert('Something went wrong. Contace site administrator.')
    }
  });
});