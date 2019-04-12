import 'package:flutter/material.dart';
import 'package:appflutter/model/Condition.dart';
import 'package:appflutter/model/WeatherData.dart';

import 'package:appflutter/res/Res.dart';
import 'package:appflutter/store/WeatherStore.dart';
import 'package:appflutter/ui/widgets/TextWithExponent.dart';
import 'package:flutter_flux/flutter_flux.dart';


class Weather extends StoreWatcher {
  @override
  Widget build(BuildContext context, Map<StoreToken, Store> stores) {
    WeatherStore store = stores[weatherStoreToken];
    WeatherData weatherData = store.weatherData;



    return new Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
          image: new AssetImage($Asset.backgroundParis),
          fit: BoxFit.cover,
        )),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new WeatherInfo(weatherData),
            ),
          ],
        ));
  }

  @override
  void initStores(ListenToStore listenToStore) {
    listenToStore(weatherStoreToken);
    actionUpdateWeather.call(); // Initial load
  }
}

class WeatherInfo extends StatelessWidget {
  WeatherInfo(WeatherData this._weather);
  final WeatherData _weather;

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
          new Text(roundedTemperature,
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
