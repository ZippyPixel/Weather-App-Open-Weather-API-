import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather/data.dart';
import 'package:weather/data_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TextEditingController();
  final _dataService = DataService();
  WeatherResponse? _response;

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_response != null)
              Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black26,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          '${_response?.temp.toInt()}°C',
                          style: TextStyle(fontSize: 40),
                        ),
                        Text(
                          'feels like ${_response?.feelsLike.toInt()}°C',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          '${_response?.description.toTitleCase()}',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              backgroundColor: Colors.green),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    Image.network(_response!.inconUrl),
                  ],
                ),
              ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            SizedBox(
              width: 200,
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'example: Dhaka',
                  labelText: 'City',
                ),
              ),
            ),
            ElevatedButton(onPressed: _search, child: Text('Search'))
          ],
        ),
      ),
    ));
  }

  void _search() async {
    final response = await _dataService.getWeather(controller.text);
    setState(() => _response = response);
  }
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
