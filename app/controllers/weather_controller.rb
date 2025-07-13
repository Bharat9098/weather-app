# app/controllers/weather_controller.rb
class WeatherController < ApplicationController
  TO_CELC = 273.15

  def index
  end

  def forecast
    api_key = Rails.application.credentials[:development][:open_weather_map][:api_key]
    service = OpenWeatherMap::Forecast.new(api_key)

    flash[:danger] = 'City or Country not available.' and redirect_to request.referer || root_path and return if !(Geocoder.search(params[:city]).present?)

    response = service.forecast(params[:city])

    flash[:danger] = "#{response["message"]}" and redirect_to request.referer || root_path and return if response["cod"] == "400"

    grouped_data = response['list'].group_by { |item| Date.parse(item['dt_txt']).strftime('%Y-%m-%d') }

    # Find the highest and lowest values for each group
    @daily_data = {}
    grouped_data.each do |date, items|
      temps = items.map { |item| item['main']['temp'] }
      @daily_data[date] = {
        'max_temp' => (temps.max - TO_CELC).round(2),
        'min_temp' => (temps.min - TO_CELC).round(2) ,
        'weather' => items.first['weather'][0]['description']
      }
    end

    @respons ||= current_weather_conditions(params[:city]) 

    flash[:danger] = "#{@respons["message"]}" and redirect_to request.referer || root_path and return if @respons["cod"] == "404"    

    if @daily_data.present?
      render :forecast
    else
      render :index
    end
  end

  def current_weather_conditions(city)
    api_key = Rails.application.credentials[:development][:open_weather_map][:api_key]
    service = OpenWeatherMap::Forecast.new(api_key)
    service.retrieve_current_weather_conditions(city)
  end
end
