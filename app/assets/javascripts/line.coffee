class Line
  constructor: (code) ->
    @code = code

  waypoints: (waypoints) ->
    @waypoints = waypoints

  origin: (origin) ->
    @origin = origin

  destination: (destination) ->
    @destination = destination

  label: (label) ->
    @label = label

  way: (way) ->
    @way = way

  type: (type) ->
    @type = type

  stops: ->
    $.ajax "/stop_search_by_line/#{@code}",
      type: 'GET'
      dataType: 'json'
      success: (response) ->
        return response

  vehicles_position: ->
    $.ajax "/vehicles_position/#{@code}",
      type: 'GET'
      dataType: 'json'
      success: (response) ->
        response

  map_route: ->
    $.ajax "/map_route",
      type: 'GET'
      data: {
        origin: @origin
        destination: @destination
        line_code: @code
      }
      dataType: 'json'
      success: (response) ->
        return response

  @find: (lines, code) ->
    for line in lines
      if line.code == parseInt(code)
        return line

window.Line = Line
