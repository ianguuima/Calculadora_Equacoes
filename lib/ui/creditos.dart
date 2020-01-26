import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import 'drawer.dart';

class Creditos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        backgroundColorStart: Colors.red,
        backgroundColorEnd: Colors.redAccent,
        elevation: 0,
      ),
      drawer: MainDrawer(),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            child: AnimatedSwitcher(
              child: Text(
                "Creditos",
                style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              duration: Duration(milliseconds: 400),
              switchInCurve: Curves.fastOutSlowIn,
            ),
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.redAccent, Colors.red]),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red,
                    blurRadius: 0,
                    spreadRadius: 0,
                    offset: Offset(
                      0,
                      5,
                    ),
                  )
                ],
                color: Colors.red,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 100.0))),
          ),
          Container(
            margin: EdgeInsets.only(top: 200),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    "O aplicativo foi criado por Ian Guimarães.",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Qualquer problema, me contate em uma dessas redes sociais.",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 16
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      _getSocialMedia(
                          "https://www.facebook.com/profile.php?id=100003208055890",
                          "images/social_media/facebook.png"
                      ),
                      _getSocialMedia(
                          "https://www.linkedin.com/in/ianguuima/",
                          "images/social_media/linkedin.png"
                      ),
                      _getSocialMedia(
                          "https://github.com/ianguuima",
                          "images/social_media/github.png"
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget _getSocialMedia(String url, String image){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Image.asset(image, width: 100),
        onTap: () => _launchURL(url),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
