import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location = ""; // location name for UI
  String time = ""; // time in that location
  bool isDayTime = false; // time in that location
  String flag = ' '; //url to and asset flag icon
  String url = ""; // location url
  WorldTime(
      {this.location = "",
      this.flag = "",
      this.url = "",
      this.isDayTime = false});

  Future<void> getTime() async {
    try {
      final result = await InternetAddress.lookup('worldtimeapi.org');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        Response response =
            await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
        Map data = jsonDecode(response.body);
        String datetime = data['datetime'];
        String offset = data['utc_offset'].substring(1, 3);
        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));
        isDayTime = now.hour > 6 && now.hour < 20;
        time = DateFormat.jm().format(now);
      }
    } catch (e) {
      print("something went wrong   $e");
      time = "something went wrong $e";
    }
  }
}
