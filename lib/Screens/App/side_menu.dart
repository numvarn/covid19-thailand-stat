import 'package:Thai_Covid_19/Screens/App/bycase_screen.dart';
import 'package:Thai_Covid_19/Screens/App/covid_today_screen.dart';
import 'package:Thai_Covid_19/Screens/App/profile_screen.dart';
import 'package:Thai_Covid_19/Screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavDrawer extends StatefulWidget {
  NavDrawer({Key key}) : super(key: key);

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  TextStyle contentStyle = GoogleFonts.sarabun(
    fontSize: 16,
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'Account',
              style: contentStyle,
            ),
            accountEmail: Text(
              'Email',
              style: contentStyle,
            ),
            currentAccountPicture: CircleAvatar(
              child: FlutterLogo(
                size: 40.0,
              ),
              backgroundColor: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'ติดตามข้อมูลโควิด 19',
              style: contentStyle,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StatToday()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'ข้อมูลรายวันตามเคส',
              style: contentStyle,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StatByCase()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text(
              'ผู้พัฒนา',
              style: contentStyle,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyProfile()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'ออกจากระบบ',
              style: contentStyle,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
