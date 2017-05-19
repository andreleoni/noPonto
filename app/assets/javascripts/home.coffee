$(document).ready ->
  $('#search').on 'click', ->
    search_value = $('#search_input').val()
    history.pushState({}, "search", "#{window.location.pathname}?search=#{search_value}")

    NopontoHome.open_sidebar()

  $('#close-sidebar').click ->
    NopontoHome.close_sidebar()

  $('#items').click (event) ->
    if event.target.id != undefined && event.target.id != ""
      NopontoHome.line_click(event.target.id)

    return false

@NopontoHome =
  show_sp_map: ->

  line_click: (line_code) ->
    this.render_stops_on_map_by_line(line_code)
    this.show_vehicles_position(line_code)

  show_vehicles_position: (line_code) ->
    $.ajax "/vehicles_position/#{line_code}",
    type: 'GET'
    dataType: 'json'
    success: (response) ->
      search_hour = response['hr']

      response['vs'].forEach (vehicle) ->
        vehicle_acessibility = vehicle['a']
        vehicle_prefix = vehicle['p']
        vehicle_py = vehicle['py']
        vehicle_px = vehicle['px']

        NopontoMap.show_vehicles_position_on_map(search_hour, line_code, vehicle_acessibility, vehicle_prefix, vehicle_py, vehicle_px)

  search_route_by_line: ->

  render_route_on_map: ->

  render_stops_on_map_by_line: (line_code) ->
    $.ajax "/stop_search_by_line/#{line_code}",
    type: 'GET'
    dataType: 'json'
    success: (response) ->
      if response.length > 0
        lineCoordinates = []
        response.forEach (bus_stop) ->
          NopontoMap.show_bus_stops(bus_stop)
          lineCoordinates.push(new google.maps.LatLng(bus_stop.Latitude, bus_stop.Longitude))

        NopontoMap.simple_lines(lineCoordinates)

  open_sidebar: ->
    $('#sidebar').show('fast')
    $('#wrapper').css('margin-right', '250px')

  close_sidebar: ->
    $('#sidebar').hide('fast')
    $('#wrapper').css('margin-right', '0')

  render_stops_on_sidebar: ->
