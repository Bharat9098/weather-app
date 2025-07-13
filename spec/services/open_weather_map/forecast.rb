# Author RSpec specs for this class
require 'rails_helper'

RSpec.describe OpenWeatherMap::Forecast do
  let(:api_key) { Rails.application.credentials.open_weather_map[:api_key] }
  let(:service) { described_class.new(api_key) }
  let(:city) { 'London' }

  describe '#forecast', :vcr do
    subject { service.forecast(city) }

    it 'returns a hash with the weather forecast' do
      expect(subject['list']).to be_a(Array)
      expect(subject['list'].first).to eq({
       'dt' => 1_680_026_400,
       'main' => {
         'temp' => 281.39,
         'feels_like' => 278.28,
         'temp_min' => 280.42,
         'temp_max' => 281.39,
         'pressure' => 1012,
         'sea_level' => 1012,
         'grnd_level' => 1011,
         'humidity' => 78,
         'temp_kf' => 0.97
       },
       'weather' => [
         {
           'id' => 804,
           'main' => 'Clouds',
           'description' => 'overcast clouds',
           'icon' => '04d'
         }
       ],
       'clouds' => {
         'all' => 100
       },
       'wind' => {
         'speed' => 5.66, 'deg' => 199, 'gust' => 13.62
       },
       'visibility' => 10_000,
       'pop' => 0.74,
       'sys' => { 'pod' => 'd' },
       'dt_txt' => '2023-03-28 18:00:00'
     })
    end
  end
end
