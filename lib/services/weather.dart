import '../services/location.dart';
import '../services/networking.dart';

const apiKey = '78724ecfebbfb267c0c413fe99c2cad0'; // use your api key here
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'Thunder 🌩';
    } else if (condition < 400) {
      return 'Cloudy 🌧';
    } else if (condition < 600) {
      return 'Rainy ☔️';
    } else if (condition < 700) {
      return '☃ ';
    } else if (condition < 800) {
      return '🌫 Humid and Cloudy';
    } else if (condition == 800) {
      return 'Sunny ☀️';
    } else if (condition <= 804) {
      return 'Cloudy ☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
