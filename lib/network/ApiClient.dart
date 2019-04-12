import 'package:http/http.dart' as http;

import 'package:appflutter/model/WeatherData.dart';
import 'package:appflutter/model/WeatherData1.dart';
import 'package:appflutter/model/ForecastData.dart';
import 'package:appflutter/ui/HomePage.dart';
import 'dart:async';

class ApiClient {
  static ApiClient _instance;
  static DataSearch dataSearch = new DataSearch();
  var a ="Thai Nguyen";
  var b = dataSearch.city().toString();
  static ApiClient getInstance() {
    if (_instance == null) {
      _instance = new ApiClient();
    }
    return _instance;
  }


  Future<WeatherData> getWeather() async {
    http.Response response = await http.get(
      Uri.encodeFull(Endpoints.WEATHER+a),
      headers: {
        "Accept": "application/json"
      }
    );

    return WeatherData.deserialize(response.body);
  }
  Future<WeatherData1> getWeather1() async {
    http.Response response = await http.get(
        Uri.encodeFull(Endpoints.WEATHER+b),
        headers: {
          "Accept": "application/json"
        }
    );

    return WeatherData1.deserialize(response.body);
  }

  Future<ForecastData> getForecast() async {
    http.Response response = await http.get(
      Uri.encodeFull(Endpoints.FORECAST),
      headers: {
        "Accept": "application/json"
      }
    );
    return ForecastData.deserialize(response.body);
  }

}

class Endpoints {
  static const _ENDPOINT = "http://api.openweathermap.org/data/2.5";
  static const WEATHER = _ENDPOINT + "/weather?APPID=f49c2b733f39830026e95b6356bb30d8&units=metric&q=";
  static const FORECAST = _ENDPOINT + "/forecast?APPID=f49c2b733f39830026e95b6356bb30d8&units=metric&q=Thai+Nguyen";
}