import 'dart:convert';

import 'package:Thai_Covid_19/Screens/App/side_menu.dart';
import 'package:Thai_Covid_19/Screens/Login/components/background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as Http;
import 'package:intl/intl.dart';

class StatToday extends StatefulWidget {
  StatToday({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StatTodayState createState() => _StatTodayState();
}

class _StatTodayState extends State<StatToday> {
  var jsonData;
  Map<String, int> data = {};
  final oCcy = new NumberFormat("#,###");

  TextStyle styleNumber = GoogleFonts.prompt(
    fontSize: 20,
  );

  TextStyle styleDesc = GoogleFonts.prompt(
    fontSize: 16,
  );

  TextStyle contentStyle = GoogleFonts.kanit(
    fontSize: 18,
  );

  final keys = [
    'newConfirmed',
    'newDeaths',
    'confirmed',
    'recovered',
    'hospitalized',
    'deaths',
    'newRecovered',
    'newHospitalized',
  ];

  Future<String> _getCovid19TodayAPI() async {
    var response = await Http.get(
      "https://covid19.th-stat.com/api/open/today",
    );

    jsonData = json.decode(utf8.decode(response.bodyBytes));

    data['confirmed'] = jsonData['Confirmed'];
    data['recovered'] = jsonData['Recovered'];
    data['hospitalized'] = jsonData['Hospitalized'];
    data['deaths'] = jsonData['Deaths'];
    data['newConfirmed'] = jsonData['NewConfirmed'];
    data['newRecovered'] = jsonData['NewRecovered'];
    data['newHospitalized'] = jsonData['NewHospitalized'];
    data['newDeaths'] = jsonData['NewDeaths'];

    return "OK";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(
          "Thai Covid-19 Today",
          style: contentStyle,
        ),
        // automaticallyImplyLeading: false,
      ),
      body: Background(
          child: new FutureBuilder(
              future: _getCovid19TodayAPI(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          // color: Colors.lightBlueAccent,
                          color: new Color(0x7134eb),
                          elevation: 1,
                          margin: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: new Container(
                            padding: new EdgeInsets.all(32.0),
                            child: new Column(
                              children: <Widget>[
                                new Text(
                                  '${oCcy.format(data[keys[index]])}',
                                  style: styleNumber,
                                ),
                                new Text(
                                  '${keys[index]}',
                                  style: styleDesc,
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
