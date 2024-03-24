class WeatherState {}

class WeatherInitialState
    extends WeatherState {} // InitialState ==> NoWeatherBody

class WeatherLoadedState extends WeatherState {}

class WeatherFailureState extends WeatherState {
  final String errMessage;

  WeatherFailureState({required this.errMessage});
}
