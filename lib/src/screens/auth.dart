import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../providers/authntication.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  Authentication _authentication;

  double screenWidth;
  double screenHeight;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _authentication = Provider.of<Authentication>(context, listen: false);
    _authentication.getRequestToken();

    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return Scaffold(
      body: Container(
          width: screenWidth,
          height: screenHeight,
          child: Stack(
            overflow: Overflow.clip,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 280,
                  child: Image.asset(
                      'assets/pics/intro/${Random().nextInt(10) + 1}.png'),
                ),
              ),
              Container(
                width: screenWidth,
                height: screenHeight,
                color: Color(0xff01d277).withOpacity(0.4),
              ),
              buildInteractiveContent(),
            ],
          )),
    );
  }

  Widget buildInteractiveContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50),
            buildLogo(),
            SizedBox(height: 40),
            buildEmailTextField(),
            SizedBox(height: 20),
            buildPasswordTextField(),
            SizedBox(height: 20),
            MaterialButton(
                child: Text(
                  'Login',
                  style: TextStyle(color: Color(0xff01d277)),
                ),
                elevation: 15,
                color: Color(0xff081c24),
                minWidth: 150,
                onPressed: () {}),
            FlatButton(
                onPressed: () async {
                  signupNewUser();
                },
                child: Text('don\'t have account!! Signup')),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  TextField buildPasswordTextField() {
    return TextField(
      maxLines: 1,
      controller: passController,
      decoration: InputDecoration(
          hintText: 'Your Password',
          labelText: 'Password',
          border: OutlineInputBorder()),
    );
  }

  TextField buildEmailTextField() {
    return TextField(
      maxLines: 1,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'Email Address',
          labelText: 'Email',
          border: OutlineInputBorder()),
    );
  }

  Material buildLogo() {
    return Material(
      color: Color(0xff081c24),
      borderRadius: BorderRadius.circular(10),
      elevation: 15,
      clipBehavior: Clip.hardEdge,
      child: SvgPicture.asset('assets/pics/tmdb.svg',
          color: Color(0xff01d277),
          width: 100,
          height: 100,
          semanticsLabel: 'The Movie DB Logo'),
    );
  }

  void redirectUser() async {
    String url =
        'https://www.themoviedb.org/authenticate/${_authentication.requestToken.request_token}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void signupNewUser() async {
    String url = 'https://www.themoviedb.org/account/signup';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
