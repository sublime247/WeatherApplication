import 'dart:convert';

import 'package:weatherapplication/model/weather_data.dart';
import 'package:http/http.dart' as http;



class WeatherCalls {

  Future<Weather>? getWeather(String city) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=e360a57ee321acaf083d45218a5c39ce&units=metric'));

    if (response.statusCode == 200) {
      final weather = jsonDecode(response.body);
      return Weather.fromJson(weather);
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
