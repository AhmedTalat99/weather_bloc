import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '2266eb3f236245828ec130326241203';
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'opps there was an error, try later';
      throw Exception(errMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('opps there was an error, try later');
    }
  }
}
