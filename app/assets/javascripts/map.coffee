map = undefined

@initMap = ->
  map = new (google.maps.Map)(document.getElementById('map'),
    center:
      lat: -23.542010
      lng: -46.634753
    zoom: 12)
  return