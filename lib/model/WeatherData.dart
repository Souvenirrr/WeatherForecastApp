
import 'dart:convert';

import 'package:appflutter/model/Condition.dart';

class WeatherData {
  String temperature;
  Condition condition;
  String name;

  WeatherData(this.name,this.temperature, this.condition);

  static WeatherData deserialize(String json) {
    JsonDecoder decoder = new JsonDecoder();
    var map = decoder.convert(json);

    String description = map["weather"][0]["description"];
    int id = map["weather"][0]["id"];
    Condition condition = new Condition(id, description);

    double temperature = map["main"]["temp"].toDouble();
    String name = map["name"].toString();

    return new WeatherData(name,temperature.toString(), condition);
  }

}

