require 'httpclient'
require 'json'

module SptransModule
  class Call
    attr_accessor :token, :access_uri

    def initialize(token)
      self.token = token
      self.access_uri = 'http://api.olhovivo.sptrans.com.br/v0'
      @api_access = HTTPClient.new

       self.authenticate_with_api
    end

    def authenticate_with_api
      @api_access.post("#{self.access_uri}/Login/Autenticar?token=#{self.token}", {})
    end

    #### Linhas #####

    def lines_to_search(search_terms)
      res = @api_access.get("#{self.access_uri}/Linha/Buscar?termosBusca=#{search_terms}", {})
      lines = JSON.parse(res.body)
      return lines
    end

    def lines_load_details(line_code)
      @api_access.get("#{self.access_uri}/Linha/CarregarDetalhes?codigoLinha=#{line_code}", {})
    end

    #### Paradas #####

    def stop_search(search_terms)
      @api_access.get("#{self.access_uri}/Parada/Buscar?termosBusca=#{search_terms}", {})
    end

    def stop_search_by_line(line_code)
      @api_access.get("#{self.access_uri}/Parada/BuscarParadasPorLinha?codigoLinha=#{line_code}", {})
    end

    def stop_search_by_hall(hall_code)
      @api_access.get("#{self.access_uri}/Parada/BuscarParadasPorCorredor?codigoCorredor=#{hall_code}", {})
    end

    #### Corredores #####

    def halls
      @api_access.get("#{self.access_uri}/Corredor", {})
    end

    #### Posição Dos Veículos #####

    def vehicles_position(line_code)
      @api_access.get("#{self.access_uri}/Posicao?codigoLinha=#{line_code}", {})
    end

    #### Previsão De Chegada ####

    def arrive_preview_on_stop_by_line(stop_code, line_code)
      @api_access.get("#{self.access_uri}/Previsao?codigoParada=#{stop_code}&codigoLinha=#{line_code}", {})
    end

    def arrive_preview_on_stop_all_points(line_code)
      @api_access.get("#{self.access_uri}/Previsao/Linha?codigoLinha=#{line_code}", {})
    end

    def arrive_preview_on_stop(stop_code)
      @api_access.get("#{self.access_uri}/Previsao/Parada?codigoParada=#{stop_code}", {})
    end
  end
end
