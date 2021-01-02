import 'dart:convert';

import 'package:Flutter_auth/Screens/App/side_menu.dart';
import 'package:Flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as Http;

class StatByCase extends StatefulWidget {
  StatByCase({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StatByCaseState createState() => _StatByCaseState();
}

class _StatByCaseState extends State<StatByCase> {
  var jsonData;
  List<ThaiCovidData> dataList = [];

  TextStyle appbarStyle = GoogleFonts.kanit(
    fontSize: 18,
  );

  TextStyle contentStyle = GoogleFonts.sarabun(
    height: 1.8,
    fontSize: 16,
  );

  TextStyle desctStyle = GoogleFonts.sarabun(
    height: 1.8,
    fontSize: 14,
  );

  Future<String> _getCovid19API() async {
    var response = await Http.get(
      "https://covid19.th-stat.com/api/open/cases",
    );

    jsonData = json.decode(utf8.decode(response.bodyBytes));

    int count = 0;
    for (var u in jsonData['Data']) {
      ThaiCovidData data = ThaiCovidData(
          u['ConfirmDate'], u['Gender'], u['Nation'], u['Province']);
      dataList.add(data);

      count += 1;
      if (count > 20) {
        break;
      }
    }
    return "OK";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(
          "Thai Covid-19 by Case",
          style: appbarStyle,
        ),
        // automaticallyImplyLeading: false
      ),
      body: Background(
        child: new FutureBuilder(
            future: _getCovid19API(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: new Color(0x7134eb),
                      margin:
                          EdgeInsets.symmetric(horizontal: 1.0, vertical: 10.0),
                      child: new InkWell(
                        onTap: () {},
                        child: ListTile(
                          leading: FlutterLogo(),
                          title: Text(
                            'สัญชาติ: ${dataList[index].nation},\n'
                            'เพศ: ${dataList[index].gender}\n'
                            'จังหวัด: ${dataList[index].province}',
                            style: contentStyle,
                          ),
                          subtitle: Text(
                            'วันที่: ${dataList[index].confirmDate}',
                            style: desctStyle,
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ThaiCovidData {
  String confirmDate;
  String gender;
  String nation;
  String province;

  ThaiCovidData(this.confirmDate, this.gender, this.nation, this.province);
}
