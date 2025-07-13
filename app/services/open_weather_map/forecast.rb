require 'httparty'

module OpenWeatherMap
  class Forecast
    BASE_URL = 'https://api.openweathermap.org/data/2.5'

    def initialize(api_key)
      @api_key = api_key
    end

    def forecast(city)
      @city = city
      HTTParty.get("#{BASE_URL}/forecast?lat=#{lat}&lon=#{lon}&appid=#{@api_key}")
    end

    def retrieve_current_weather_conditions(city)
      @city = city
      HTTParty.get("#{BASE_URL}/weather?q=#{@city}&appid=#{@api_key}")
    end

    private

    def lat
      geocoded_city_response.first['lat'] if geocoded_city_response.present?
    end

    def lon
      geocoded_city_response.first['lon'] if geocoded_city_response.present?
    end

    def geocoded_city_response
      @geocoded_city_response ||= Geocode.new(@api_key).geocode(@city)
    end
  end
end
