import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class WorldTime {
  String location = ""; // location name for UI
  String time = ""; // time in that location
  String flag = ' '; //url to and asset flag icon
  String url = ""; // location url
  WorldTime({this.location = "", this.flag = "", this.url = ""});

  Future<void> getTime() async {
    try {
      Response response =
      await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      time = now.toString();
    } catch (e) {
      if (kDebugMode) {
        print("something went wrong   $e");
        time = "something went wrong";
      }
    }
  }
}
