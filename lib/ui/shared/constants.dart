import 'package:flutter/material.dart';

class Assets {
  static const String _imagesRoot = "assets/images/";
  static String firebase = _imagesRoot + "rider.png";
  static String bgimg = _imagesRoot + "bgimg.png";
  static String btnbgimg = _imagesRoot + "btnbg.png";
  static String loadinimg = _imagesRoot + "loading.jpg";
  static String doneimg = _imagesRoot + "checked.png";

  static String getPaymentLink =
      'https://us-central1-unique-nuance-310113.cloudfunctions.net/getPaymentLink';
  static String getNotifyLink =
      'https://us-central1-unique-nuance-310113.cloudfunctions.net/sendNotification';
  static const double fourBy1 = 4.0;
  static const double fourBy2 = 8.0;
  static const double fourBy3 = 12.0;
  static const double fourBy4 = 16.0;

  static const double eightBy1 = 8.0;
  static const double eightBy2 = 16.0;
  static const double eightBy3 = 24.0;
  static const double eightBy4 = 32.0;

  static const double sixteenBy1 = 16.0;
  static const double sixteenBy2 = 32.0;
  static const double sixteenBy3 = 48.0;
  static const double sixteenBy4 = 64.0;
}

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      width: 2.0,
      color: Colors.amber,
    ),
  ),
);

const carTypes = [
  'Family Ride 7 Seater Car',
  'Oga Ride 5 Seater Car',
  'Flixi 5 Seater Airport',
  "Flixi 5 Seater School Runner",
  'Picnic Tour 7 Seaters Car',
  'Picnic Tour 5 Seaters Car',
  'Oga Ride Private any seaters 4 to 7',
  'Self Drive Any Seaters',
  'Aven 17 Seater mini bus',
  'Aven 17 Seater Van',
  'Aven 17 seater executive',
];
const boatTypes = [
  'White Boat Oga Ride',
  'White Boat Family Ride',
  'White Boat Picnic Tour',
  'Banana Boat Flixi Ride',
  'Banana Boat Family  Ride',
  'Banana charter service',
];

class WaterLoc {
  final String loc;

  WaterLoc(this.loc);
}

List<WaterLoc> boatLoc = [
  WaterLoc('AA Rano'),
  WaterLoc('Ajah'),
  WaterLoc('Apapa'),
  WaterLoc('Badagry'),
  WaterLoc('Badore'),
  WaterLoc('Bariga'),
  WaterLoc('Beta Jetty'),
  WaterLoc('Bond'),
  WaterLoc('CMS'),
  WaterLoc('Coconut'),
  WaterLoc('Ebute Ero'),
  WaterLoc('Fairway Buoy'),
  WaterLoc('Five Cowries'),
  WaterLoc('Folawiyo'),
  WaterLoc('Gbaji'),
  WaterLoc('Heyden'),
  WaterLoc('Ibru'),
  WaterLoc('Ijegun'),
  WaterLoc('Ikorodu'),
  WaterLoc('Karma Jetty'),
  WaterLoc('Lagos State Jetty'),
  WaterLoc('Lekki Addax'),
  WaterLoc('Liverpool Jetty'),
  WaterLoc('Mile 2'),
  WaterLoc('MRS Oil Jetty'),
  WaterLoc('NACJ'),
  WaterLoc('Nigerdock'),
  WaterLoc('Ojo'),
  WaterLoc('Paradise'),
  WaterLoc('PWA'),
  WaterLoc('Rain Oil Jetty'),
  WaterLoc('Sabokoji'),
  WaterLoc('SBM Lagos'),
  WaterLoc('Snake Island'),
  WaterLoc('Tincan'),
  WaterLoc('Tolu'),
  WaterLoc('Volswagen'),
  WaterLoc('Eleganza Private Jetty'),
  WaterLoc('Festac Jetty'),
];

String addtwostrings(String st1, String st2) {
  final d1 = double.parse(st1);
  final d2 = double.parse(st2);
  final d3 = d1 + d2;
  return d3.toString();
}
