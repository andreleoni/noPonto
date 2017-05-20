class NoPonto

  @lines: (lines) ->
    sl = []
    for line in lines
      l = new Line(line.CodigoLinha)
      l.origin = line.DenominacaoTPTS
      l.destination = line.DenominacaoTSTP
      l.label = line.Letreiro
      l.way = line.Sentido
      l.type = line.Tipo
      sl.push(l)
    return sl

  @search_lines: (term) ->
    $.ajax "/search_lines/#{term}",
      type: "GET"
      success: (lines) ->
        lines

      error: (jqXHR, textStatus, errorThrown) ->
        textStatus

window.NoPonto = NoPonto
