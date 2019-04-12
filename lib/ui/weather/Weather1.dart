import 'package:flutter/material.dart';
import 'package:appflutter/model/Condition.dart';

import 'package:appflutter/model/WeatherData1.dart';
import 'package:appflutter/ui/HomePage.dart';
import 'package:appflutter/res/Res.dart';
import 'package:flutter_flux/flutter_flux.dart';
import 'package:appflutter/store/WeatherStore1.dart';


class Weather1 extends StoreWatcher {
  @override
  Widget build(BuildContext context, Map<StoreToken, Store> stores) {
    WeatherStore1 store = stores[weatherStoreToken1];
    WeatherData1 weatherData1 = store.weatherData1;



    return new Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage($Asset.backgroundParis),
              fit: BoxFit.cover,
            )),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new WeatherInfo(weatherData1),
            ),
          ],
        ));
  }

  @override
  void initStores(ListenToStore listenToStore) {
    listenToStore(weatherStoreToken1);
    actionUpdateWeather.call();
  }
}

class WeatherInfo extends StatelessWidget {
  WeatherInfo(WeatherData1 this._weather);

  final WeatherData1 _weather;

  @override
  Widget build(BuildContext context) {
    final roundedTemperature = this._weather.temperature.split(".")[0] + "°C";
    final condition = '${this._weather.condition.description[0]
        .toUpperCase()}${this._weather
        .condition.description.substring(1)}';
    final name = this._weather.name;

    return new Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            name,
            style: new TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.w700,
                color: $Colors.blueParis),
          ),
          new Text(
            condition,
            style: new TextStyle(
              fontSize: 18.0,
              color: $Colors.blueParis,
            ),
          ),
          new Text(
              roundedTemperature,
              style: new TextStyle(
                  fontSize: 72.0,
                  color: $Colors.blueParis,
                  fontFamily: "Roboto")),
        ],
      ),
      padding: new EdgeInsets.only(left: 64.0),
    );
  }
}
