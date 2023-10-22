import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  late String location; // location name for the UI
  late String time; // time in that location
  late String flag; // url to an asset flag icon
  late String url; // location url for api endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try{
      // make request
      Response response =
      await get(Uri.parse("https://worldtimeapi.org/api/timezones/$url"));
      Map data = jsonDecode(response.body);

      //get properties from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3); //01 instead of +01:00

      DateTime now = DateTime.parse(dateTime); // create a new object of datetime
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property
      time = now.toString();

    }
    catch(e){
      print("caught error: $e");
      time = "could not get time data";
  }
  }
}