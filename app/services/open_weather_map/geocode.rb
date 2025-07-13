require 'httparty'

module OpenWeatherMap
  class Geocode
    include HTTParty
    BASE_URL = 'http://api.openweathermap.org/geo/1.0'

    def initialize(api_key)
      @api_key = api_key
    end

    def geocode(city)
      HTTParty.get("#{BASE_URL}/direct?q=#{city}&appid=#{@api_key}")
    end
  end
end
