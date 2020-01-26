import 'package:calc/ui/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        elevation: 0,
        backgroundColorStart: Colors.blue[600],
        backgroundColorEnd: Colors.blue[400],
      ),
      backgroundColor: Colors.white,
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              "Calculador de Equações",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue[400], Colors.blue[600]]
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue[600],
                    blurRadius: 0,
                    spreadRadius: 0,
                    offset: Offset(
                      0,
                      5,
                    ),
                  )
                ],
                color: Colors.blue,
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(
                        MediaQuery.of(context).size.width, 50.0))),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 120),
            color: Colors.white12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "images/icon.png",
                  width: 100,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    "Deslize da esquerda para a direita para acessar"
                    " as equações disponíveis!",
                    style: TextStyle(fontSize: 22, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ),
                Icon(Icons.keyboard_arrow_left, size: 48, color: Colors.black45)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
