module ApplicationHelper
  
  def get_image_by_weather(value)
    case value

    when "clear sky"
      "https://kamleshyadav.com/templatemonster-html/weather/assets/images/wea-icons/icon-06.png"
    when "rain", "shower rain"
      "https://kamleshyadav.com/templatemonster-html/weather/assets/images/wea-icons/icon-03.png"
    when "light rain"
      "https://kamleshyadav.com/templatemonster-html/weather/assets/images/wea-icons/icon-04.png"
    when "few clouds"
      "https://kamleshyadav.com/templatemonster-html/weather/assets/images/wea-icons/icon-07.png"
    when "thunderstorm"
      "https://kamleshyadav.com/templatemonster-html/weather/assets/images/wea-icons/icon-02.png"
    when "overcast clouds", "scattered clouds"
      "https://kamleshyadav.com/templatemonster-html/weather/assets/images/wea-icons/icon-01.png"
    when "broken clouds"
      "https://kamleshyadav.com/templatemonster-html/weather/assets/images/wea-icons/icon-08.png"
    else
    end
  end
end
