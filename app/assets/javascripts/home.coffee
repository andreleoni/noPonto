$(document).ready ->
  ## Code Here ##
  $('#search').on 'click', ->
    Noponto.open_sidebar()

  $('#close-sidebar').click ->
    Noponto.close_sidebar()

this.Noponto =
  show_sp_map: ->

  search_route_by_line: ->

  render_route_on_map: ->

  render_stops_on_map_by_line: ->

  open_sidebar: ->
    $('#sidebar').show('fast')
    $('#wrapper').css('margin-right', '250px')

  close_sidebar: ->
    $('#sidebar').hide('fast')
    $('#wrapper').css('margin-right', '0')

  render_stops_on_sidebar: ->

    # $.ajax '/exchange',
    # type: 'POST'
    # dataType: 'json'
    # data: {
    #         currency: $("#currency").val(),
    #         currency_destination: $("#currency_destination").val(),
    #         quantity: $("#quantity").val()
    #       }
    #
    # error: (jqXHR, textStatus, errorThrown) ->
    #   alert textStatus
    #   $('.refresh-icon').fadeOut('slow')
    #
    # success: (data, text, jqXHR) ->
    #   $('#result').val(data.value)
    #   $('.refresh-icon').fadeOut('slow')
    #
    # return false
