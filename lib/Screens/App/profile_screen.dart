import 'package:Flutter_auth/Screens/App/side_menu.dart';
import 'package:Flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class MyProfile extends StatelessWidget {
  MyProfile({Key key}) : super(key: key);

  var sizeBox = 14.0;

  TextStyle bulletStyle = GoogleFonts.prompt(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  TextStyle contentBulletStyle = GoogleFonts.prompt(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  TextStyle appbarStyle = GoogleFonts.kanit(
    fontSize: 18,
  );

  TextStyle contentStyle = GoogleFonts.sarabun(
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: appbarStyle,
        ),
        automaticallyImplyLeading: true,
      ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Center(
                        child: Text(
                          "นายพิศาล สุขขี",
                          style: bulletStyle,
                        ),
                      ),
                    ),
                    SizedBox(height: sizeBox),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(200.0),
                      child: Image.asset(
                        'assets/images/profile.jpg',
                        height: 180.0,
                      ),
                    ),
                    SizedBox(height: sizeBox),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Align(
                        child: new Text(
                          'สาขาวิชาวิทยาการคอมพิวเตอร์\nคณะศิลปศาสตร์และวิทยาศาสตร์',
                          style: contentStyle,
                        ),
                        alignment: Alignment(-1, 0),
                      ),
                    ),
                    SizedBox(height: sizeBox),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "ประวัติการศึกษา",
                        style: contentBulletStyle,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.arrow_forward),
                      title: Align(
                        child: new Text(
                          'วท.ม. (วิทยาการคอมพิวเตอร์) มหาวิทยาลัยศิลปากร',
                          style: contentStyle,
                        ),
                        alignment: Alignment(-1.8, 0),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.arrow_forward),
                      title: Align(
                        child: new Text(
                          'วท.บ. (วิทยาการคอมพิวเตอร์) มหาวิทยาลัยศิลปากร',
                          style: contentStyle,
                        ),
                        alignment: Alignment(-1.8, 0),
                      ),
                    ),
                    SizedBox(height: sizeBox),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "สำหรับติดต่อ",
                        style: contentBulletStyle,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone_android),
                      title: Align(
                        child: new Text(
                          '084-298-2456',
                          style: contentStyle,
                        ),
                        alignment: Alignment(-1, 0),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Align(
                        child: new Text(
                          'www.facebook.com/numvarn',
                          style: contentStyle,
                        ),
                        alignment: Alignment(-1, 0),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.web),
                      title: Align(
                        child: new Text(
                          'www.comsci-sskru.com',
                          style: contentStyle,
                        ),
                        alignment: Alignment(-1, 0),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Align(
                        child: new Text(
                          'phisan.s@sskru.ac.th',
                          style: contentStyle,
                        ),
                        alignment: Alignment(-1, 0),
                      ),
                    ),
                    SizedBox(height: sizeBox),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "ประวัติการทำงาน",
                        style: contentBulletStyle,
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.arrow_forward),
                      title: Align(
                        child: new Text(
                          'อาจารประจำสาขาวิชาวิทยาการคอมพิวเตอร์,\n\nคณะศิลปศาสตร์และวิทยาศาสตร์,\n\nมหาวิทยาลัยราชภัฏศรีสะเกษ',
                          style: contentStyle,
                        ),
                        alignment: Alignment(-1.8, 0),
                      ),
                    ),
                    SizedBox(height: sizeBox),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "ความสามารถพิเศษ",
                        style: contentBulletStyle,
                      ),
                    ),
                    SizedBox(height: sizeBox),
                    ListTile(
                      leading: Icon(Icons.developer_board),
                      title: Align(
                        child: new Text(
                          'เชี่ยวชาญการเขียนโปรแกรมด้วย Python',
                          style: contentStyle,
                        ),
                        alignment: Alignment(-1, 0),
                      ),
                    ),
                    SizedBox(height: sizeBox),
                    ListTile(
                      leading: Icon(Icons.developer_board),
                      title: Align(
                        child: new Text(
                          'เชี่ยวชาญการการพัฒนาเว็บแอพพลิเคชั่นด้วย Django Framework',
                          style: contentStyle,
                        ),
                        alignment: Alignment(-1, 0),
                      ),
                    ),
                    SizedBox(height: sizeBox),
                    ListTile(
                      leading: Icon(Icons.developer_board),
                      title: Align(
                        child: new Text(
                          'การวิเคราะห์ประมวลผลข้อมูลขนาดใหญ่ด้วย Python',
                          style: contentStyle,
                        ),
                        alignment: Alignment(-1, 0),
                      ),
                    ),
                    SizedBox(height: sizeBox),
                    ListTile(
                      leading: Icon(Icons.developer_board),
                      title: Align(
                        child: new Text(
                          'การพัฒนาระบบงานเว็บเชอร์วิสด้วย Django Rest Framework',
                          style: contentStyle,
                        ),
                        alignment: Alignment(-1, 0),
                      ),
                    ),
                    SizedBox(height: sizeBox),
                    ListTile(
                      leading: Icon(Icons.developer_board),
                      title: Align(
                        child: new Text(
                          'การพัฒนาโมบายแอพพลิเคชันด้วย Flutter',
                          style: contentStyle,
                        ),
                        alignment: Alignment(-1, 0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
