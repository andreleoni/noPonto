map = undefined

@initMap = ->
  map = new (google.maps.Map)(document.getElementById('map'),
    center:
      lat: -23.542010
      lng: -46.634753
    zoom: 12,
    apTypeId: google.maps.MapTypeId.ROADMAP)
  return

@NopontoMap =
  show_vehicles_position_on_map: (search_hour, line_code, vehicle_acessibility, vehicle_prefix, vehicle_py, vehicle_px) ->
    location = new (google.maps.LatLng)(vehicle_py, vehicle_px)

    marker = new (google.maps.Marker)(
      position: location
      map: map
      icon: NopontoMap.createImage('../marker.png')
      animation: google.maps.Animation.DROP
      draggable: false)

    if vehicle_acessibility
      vehicle_acessibility_text = "Possui acessibilidade <img src='with-acessibility.png' class='acessibility-icon'> </img>"
    else
      vehicle_acessibility_text = "Não possui acessibilidade <img src='without-acessibility.png' class='acessibility-icon'> </img>"

    infowindow = new (google.maps.InfoWindow)(
      content: "
        Ultima Atualização: #{search_hour}hrs
        <br> <b> Linha: </b> #{line_code}
        <br> <b> Identificador do Veículo: </b> #{vehicle_prefix}
        <br> <b> #{vehicle_acessibility_text} </b>
        <img tag
        ")

    google.maps.event.addListener marker, 'click', ->
      infowindow.open map, marker
      return
    return

  show_bus_stops: (marker_hash) ->
    location = new (google.maps.LatLng)(marker_hash.Latitude, marker_hash.Longitude)

    marker = new (google.maps.Marker)(
      position: location
      map: map
      icon: NopontoMap.createImage('../bus-station.png')
      animation: google.maps.Animation.DROP
      draggable: false)

    infowindow = new (google.maps.InfoWindow)(
      content: "
        Nome: #{marker_hash.Nome}hrs
        <br> <b> Codigo de Parada: </b> #{marker_hash.CodigoParada}
        <br> <b> Endereco </b> #{marker_hash.Endereco}
        <img tag
        ")

    google.maps.event.addListener marker, 'click', ->
      infowindow.open map, marker
      return
    return

  createInfoWindow: (text) ->
    infowindow = new (google.maps.InfoWindow)(content: text)
    infowindow

  createImage: (url) ->
    image =
      url: url
      size: new (google.maps.Size)(32, 32)
      origin: new (google.maps.Point)(0, 0)
      anchor: new (google.maps.Point)(0, 32)

    image

  draw_route: (line) ->
    directionsService = new (google.maps.DirectionsService)
    directionsDisplay = new (google.maps.DirectionsRenderer)(suppressMarkers: false)
    directionsDisplay.setMap map

    request = travelMode: google.maps.TravelMode.DRIVING

    $.when(line.map_route()).done (r) ->
      request.origin = new google.maps.LatLng(r.origin.lat, r.origin.lng)
      request.destination = new google.maps.LatLng(r.destination.lat, r.destination.lng)

      request.waypoints = []

      for stop in r.stops
        request.waypoints.push
          location: new google.maps.LatLng(stop.Latitude, stop.Longitude)
          stopover: false

      directionsService.route request, (result, status) ->
        if status == google.maps.DirectionsStatus.OK
          directionsDisplay.setDirections result
