import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/data.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    final queryParameters = {
      'q': city,
      'appid': '43cff8960e99ae74a53bf96a86711931',
      'units': 'metric'
    };
    final uri = Uri.https(
        'api.openweathermap.org', 'data/2.5/weather', queryParameters);
    final response = await http.get(uri);

    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}
