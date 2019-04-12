import 'package:appflutter/ui/forecast/Forecast.dart';
import 'package:appflutter/ui/weather/Weather.dart';
import 'package:flutter/material.dart';
import 'package:appflutter/ui/weather/Weather1.dart';
class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                showSearch(context: context, delegate: DataSearch());
              }
          )
        ],
      ),
      drawer: Drawer(),
      body: new Container(
          child: new Column(
            children: <Widget>[
              new AspectRatio(child: new Weather(), aspectRatio: 750.0/805.0),
              new Expanded(child: new Forecast()),
            ],
          )
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String>{

  final cities = [
    "An Giang",
    "Bà Rịa - Vũng Tàu",
    "Bac Giang",
    "Bắc Kạn",
    "Bạc Liêu",
    "Bắc Ninh",
    "Bến Tre",
    "Bình Định",
    "Bình Dương",
    "Bình Phước",
    "Bình Thuận",
    "Cà Mau",
    "Cao Bằng",
    "Đắk Lắk",
    "Đắk Nông",
    "Điện Biên",
    "Đồng Nai",
    "Đồng Tháp",
    "Gia Lai",
    "Hà Giang",
    "Hà Nam",
    "Hà Tĩnh",
    "Hải Dương",
    "Hậu Giang",
    "Hòa Bình",
    "Hưng Yên",
    "Khánh Hòa",
    "Kiên Giang",
    "Kon Tum",
    "Lai Châu",
    "Lâm Đồng",
    "Lạng Sơn",
    "Lào Cai",
    "Long An",
    "Nam Dinh",
    "Nghệ An",
    "Ninh Bình",
    "Ninh Thuận",
    "Phu Tho",
    "Quảng Bình",
    "Quảng Nam",
    "Quảng Ngãi",
    "Quảng Ninh",
    "Quảng Trị",
    "Sóc Trăng",
    "Sơn La",
    "Tây Ninh",
    "Thái Bình",
    "Thai Nguyen",
    "Thanh Hóa",
    "Thừa Thiên Huế",
    "Tiền Giang",
    "Trà Vinh",
    "Tuyên Quang",
    "Vĩnh Long",
    "Vĩnh Phúc",
    "Yên Bái",
    "Phú Yên",
    "Cần Thơ",
    "Đà Nẵng",
    "Hải Phòng",
    "Hà Nội",
    "TP HCM",
  ];

  final recentCities = [
    "Thai Nguyen",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () {
      query= "";
    } )];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return new Scaffold(
      body: new Container(
          child: new Weather1()
          )
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
     final suggestionList = query.isEmpty ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) =>ListTile(
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0,query.length),
              style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.bold
              ),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey)
                )
              ]
          ),
        ),
        onTap: () {
          close(context, suggestionList.toString());
        },

      ),
      itemCount: suggestionList.length,
    );
  }

  String city(){
    String a = "Ca Mau";
    if(query.startsWith(query).toString() == "Bac Giang"){
      a = "Bac Giang";
    }else if(query.startsWith(query).toString() == "Ca Mau"){
      a = "Ca Mau";
    }
    debugPrint(a);
    return a;
  }
}