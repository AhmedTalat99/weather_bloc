class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String weatherCondition;

  WeatherModel({
    required this.cityName,
    required this.date,
   required this.image,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherCondition,
  });
  factory WeatherModel.fromJson(Map<String, dynamic> jsonData) {
    return WeatherModel(
      image: jsonData['forecast']['forecastday'][0]['day']['condition']['icon'],
      cityName: jsonData['location']['name'],
      date: DateTime.parse(jsonData['current']['last_updated']),
      temp: jsonData['forecast']['forecastday'][0]['day']['avgtemp_c'],
      minTemp: jsonData['forecast']['forecastday'][0]['day']['mintemp_c'],
      maxTemp: jsonData['forecast']['forecastday'][0]['day']['maxtemp_c'],
      weatherCondition: jsonData['current']['condition']['text'],
   //another way   weatherCondition: jsonData['forecast']['forecastday'][0]['day']['condition']['text'],
    );
  }
}
