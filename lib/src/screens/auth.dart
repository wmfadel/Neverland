import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../providers/authentication.dart';
import '../providers/account_provider.dart';
import '../models/auth_error.dart';

import 'home_page.dart';
import '../widgets/loading_progress.dart';
import '../utils/dialogs.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  Authentication _authentication;
  AccountProvider _accountProvider;
  Dialogs _dialogs = Dialogs();
  double screenWidth;
  double screenHeight;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  int imageId = 1;
  bool isPassHidden = true;
  bool isLoading = false;
  String loadingMessage = '';

  @override
  void initState() {
    super.initState();
    _authentication = Provider.of<Authentication>(context, listen: false);
    _accountProvider = Provider.of<AccountProvider>(context, listen: false);
    imageId = Random().nextInt(25) + 1;
  }

  @override
  Widget build(BuildContext context) {
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
                      'assets/pics/intro/$imageId.png'),
                ),
              ),
              Container(
                width: screenWidth,
                height: screenHeight,
                color: Color(0xff01d277).withOpacity(0.4),
              ),
              buildInteractiveContent(),
              isLoading ? LoadingProgress(loadingMessage) : Container()
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
                onPressed: isLoading?null:() async {
                  authenticationLogic();
                }),
            FlatButton(
                onPressed: () {
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
      cursorColor: Color(0xff01d277),
      obscureText: isPassHidden,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              icon:
                  Icon(isPassHidden ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  isPassHidden = !isPassHidden;
                });
              }),
          hintText: 'Your Password',
          labelText: 'Password',
          border: OutlineInputBorder()),
    );
  }

  TextField buildEmailTextField() {
    return TextField(
      maxLines: 1,
      controller: emailController,
      cursorColor: Color(0xff01d277),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: 'User Name',
          labelText: 'Name',
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


  void authenticationLogic() async{
    setState(() {
      isLoading = true;
      loadingMessage = 'Getting new Auth Token';
    });
    _authentication.name = emailController.text;
    _authentication.pass = passController.text;
    await _authentication.getRequestToken();
    var logResult;
    setState(() {
      loadingMessage = 'got Token, Logging in';
    });
    await _authentication.login().then((result) {
      logResult = result;
    });
    if (logResult is bool) {
      if (logResult) {
        setState(() {
          loadingMessage = 'Loggend in, creating session';
        });
        await _authentication.createSession();
        setState(() {
          loadingMessage = 'created session, getting user account';
        });
        await _accountProvider.getAccount(_authentication.sessionId);
        setState(() {
          loadingMessage = 'got user account, getting user preferences';
        });
        await _accountProvider.getFavoriteMovies(_authentication.sessionId);
        await _accountProvider.getFavoriteTvs(_authentication.sessionId);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        // show dialog no token found
        setState(() {
          isLoading = false;
          loadingMessage = '';
        });
        _dialogs.showTokenError(context);
      }
    } else if (logResult is AuthError) {
      setState(() {
        isLoading = false;
        loadingMessage = '';
      });
      _dialogs.showLoginError(context, logResult);
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
