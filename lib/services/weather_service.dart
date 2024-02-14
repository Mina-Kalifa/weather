import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  Dio dio = Dio();
  Future<WeatherModel> getWeather(String cityName) async {
    try {
      Response response = await dio.get(
          'https://api.weatherapi.com/v1/forecast.json?key=da8484957fb54acaa96175149240402&q=$cityName&days=1');
      print(response);
      Map<String, dynamic> data = response.data;
      return WeatherModel.formjson(data);
    } on DioException catch (e) {
      print("Dio error: $e");
      throw e;
    } catch (e) {
      print("Unexpected error: $e");
      throw e;
    }
  }
}
