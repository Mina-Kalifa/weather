class WeatherModel {
  final String city;
  final double tempreture;
  final double minTempreture;
  final double maxTempreture;
  final String iconImage;
  final String condition;
  final DateTime lastTime;

  WeatherModel(
      {required this.city,
      required this.tempreture,
      required this.minTempreture,
      required this.maxTempreture,
      required this.iconImage,
      required this.condition,
      required this.lastTime});
  factory WeatherModel.formjson(json) {
    return WeatherModel(
      city: json['location']['name'],
      tempreture: json['current']['temp_c'],
      maxTempreture: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTempreture: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      iconImage: json['current']['condition']['icon'],
      condition: json['current']['condition']['text'],
      lastTime: DateTime.parse(json['current']['last_updated']),
    );
  }
}
