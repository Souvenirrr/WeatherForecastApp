
import 'dart:convert';

import 'package:appflutter/model/Condition.dart';

class WeatherData1 {
  String temperature;
  Condition condition;
  String name;

  WeatherData1(this.name,this.temperature, this.condition);

  static WeatherData1 deserialize(String json) {
    JsonDecoder decoder = new JsonDecoder();
    var map = decoder.convert(json);

    String description = map["weather"][0]["description"];
    int id = map["weather"][0]["id"];
    Condition condition = new Condition(id, description);

    double temperature = map["main"]["temp"].toDouble();
    String name = map["name"].toString();

    return new WeatherData1(name,temperature.toString(), condition);
  }

}

