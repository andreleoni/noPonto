require 'httpclient'
require 'json'
require 'uri'

module GoogleMapsModule
  class Call
    attr_accessor :token, :access_uri

    def initialize
      self.token ||= ENV['GMAPS_TOKEN']
      self.access_uri = "https://maps.googleapis.com/maps/api"
      @api_access = HTTPClient.new
    end

    def get_geocode(address)
      uri = URI.encode("#{self.access_uri}/geocode/json?address=#{address}")
      @api_access.get(uri)
    end

    def get_lat_long_by_geocode(address)
      uri = URI.encode("#{self.access_uri}/geocode/json?address=#{address}")
      res = @api_access.get(uri)
      JSON.parse(res.body)['results'][0]['geometry']['location']
    end
  end
end
