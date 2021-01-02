import 'package:flutter/material.dart';
import 'package:Flutter_auth/Screens/Login/login_screen.dart';
import 'package:Flutter_auth/Screens/Signup/components/background.dart';
import 'package:Flutter_auth/Screens/Signup/components/or_divider.dart';
import 'package:Flutter_auth/Screens/Signup/components/social_icon.dart';
import 'package:Flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:Flutter_auth/components/rounded_button.dart';
import 'package:Flutter_auth/components/rounded_input_field.dart';
import 'package:Flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String firstName = "";
    String lastName = "";
    String email = "";
    String password = "";

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "First Name",
              onChanged: (value) {
                firstName = value;
              },
            ),
            RoundedInputField(
              hintText: "Last Name",
              onChanged: (value) {
                lastName = value;
              },
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {
                return showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      // Retrieve the text the that user has entered by using the
                      // TextEditingController.
                      content: Text("Name : " +
                          firstName +
                          "\nLast : " +
                          lastName +
                          "\nemail : " +
                          email +
                          "\npassword : " +
                          password),
                    );
                  },
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
