/* 
    https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    
    {
  "coord": {
    "lon": -122.08,
    "lat": 37.39
  },
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 282.55,
    "feels_like": 281.86,
    "temp_min": 280.37,
    "temp_max": 284.26,
    "pressure": 1023,
    "humidity": 100
  },
  "visibility": 10000,
  "wind": {
    "speed": 1.5,
    "deg": 350
  },
  "clouds": {
    "all": 1
  },
  "dt": 1560350645,
  "sys": {
    "type": 1,
    "id": 5122,
    "message": 0.0139,
    "country": "US",
    "sunrise": 1560343627,
    "sunset": 1560396563
  },
  "timezone": -25200,
  "id": 420006353,
  "name": "Mountain View",
  "cod": 200
  }

  http://openweathermap.org/img/wn/10d@2x.png
    */

import 'package:flutter/cupertino.dart';

class WeatherResponse {
  final String description;
  final double temp;
  final double feelsLike;
  final String icon;

  WeatherResponse(
      {required this.description,
      required this.temp,
      required this.feelsLike,
      required this.icon});

  String get inconUrl {
    return 'https://openweathermap.org/img/wn/${this.icon}@2x.png';
  }

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final description = json['weather'][0]['description'];
    final temp = json['main']['temp'];
    final feelsLike = json['main']['feels_like'];
    final icon = json['weather'][0]['icon'];

    return WeatherResponse(
        description: description, temp: temp, feelsLike: feelsLike, icon: icon);
  }
}
