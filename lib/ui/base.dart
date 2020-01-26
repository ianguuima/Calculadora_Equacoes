import 'package:calc/objects/field.dart';
import 'package:calc/ui/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

abstract class Equation extends State<StatefulWidget>{

  Widget icon;
  dynamic defaultColor;
  List<Color> degradeColors;
  Color shadowColor;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Field> fields = List();

  dynamic makeCalc();

  Widget generateAnswer(dynamic response){
    return Text(
      "$response",
      style: TextStyle(fontSize: 64, color: Colors.white),
    );
  }

  Equation(this.defaultColor, this.degradeColors, this.shadowColor);

  void createField(String fieldName, { bool money }){
    Field field = Field(fieldName, number: money != null ? true : false);
    fields.add(field);
  }

  bool verifyAnswer(){
    for (var value in fields) {
      if (value.controller.text.isEmpty){
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.black54,
          content: Text("Certifique que todos os campos estão preenchidos!",
              style: TextStyle(fontSize: 22, color: Colors.white)),
          elevation: 0,
        ));
        return false;
      }
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: _scaffoldKey,
      appBar: GradientAppBar(
        backgroundColorStart: degradeColors[0],
        backgroundColorEnd: degradeColors[1],
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: AnimatedSwitcher(
                  child: icon,
                  duration: Duration(milliseconds: 400),
                  switchInCurve: Curves.fastOutSlowIn,
                ),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [degradeColors[1], degradeColors[0]]),
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor,
                        blurRadius: 0,
                        spreadRadius: 0,
                        offset: Offset(
                          0,
                          5,
                        ),
                      )
                    ],
                    color: defaultColor,
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 100.0))),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ...fields.map((f) => f.generate(defaultColor)).toList(),
                    _generateCalcButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _generateCalcButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
          BoxShadow(
            color: defaultColor[500],
            blurRadius: 0,
            spreadRadius: 0,
            offset: Offset(
              0,
              7,
            ),
          )
        ]),
        child: FlatButton(
          onPressed: () {
            setState(() {
              if (!verifyAnswer()) return;
              var calc = makeCalc();
              if (calc == null) return;
              icon = generateAnswer(calc);
            });
          },
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          textColor: Colors.white,
          color: defaultColor[400],
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Calcular",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500)),
              Icon(
                Icons.refresh,
                size: 42,
              )
            ],
          ),
        ),
      ),
    );
  }

}

