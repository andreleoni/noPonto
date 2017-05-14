require 'httpclient'
require 'json'

module SptransModule
  class Call
    attr_accessor :token, :access_uri

    def initialize(token)
      self.token = token
      self.access_uri = 'http://api.olhovivo.sptrans.com.br/v0'
      @api_access = HTTPClient.new
    end

    def authenticate_with_api
      @api_access.post("#{self.access_uri}/Login/Autenticar?token=#{self.token}")
    end

    def to_search_lines(search_terms)
      @api_access.get("#{self.access_uri}/Linha/Buscar?termosBusca=#{search_terms}")
    end

    def stop_search(search_terms)
      @api_access.get("#{self.access_uri}/Parada/Buscar?termosBusca=#{search_terms}")
    end
  end
end
