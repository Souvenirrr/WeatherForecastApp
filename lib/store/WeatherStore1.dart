import 'dart:async';

import 'package:flutter_flux/flutter_flux.dart';
import 'package:appflutter/model/Condition.dart';

import 'package:appflutter/model/WeatherData1.dart';
import 'package:appflutter/network/ApiClient.dart';

class WeatherStore1 extends Store {

  WeatherData1 weatherData1;

  WeatherStore1() {
    // TODO make loading widget from here
    this.weatherData1 = new WeatherData1("","", new Condition(0, "Loading"));

    triggerOnAction(actionUpdateWeather, (dynamic) {
      _updateWeather();
    });
  }

  void _updateWeather() {
    var apiClient = ApiClient.getInstance();
    Future<WeatherData1> fWeatherData = apiClient.getWeather1();
    fWeatherData
        .then((content) {
      this.weatherData1 = content;
      trigger();
    }).catchError((e) {
      this.weatherData1 = null;
      // todo trigger error
    });
  }
}

// Token and actions
final Action actionUpdateWeather = new Action();
final StoreToken weatherStoreToken1 = new StoreToken(new WeatherStore1());