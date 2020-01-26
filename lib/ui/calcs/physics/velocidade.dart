import 'dart:ui';

import 'package:calc/manager/calcmanager.dart';
import 'package:calc/ui/base.dart';
import 'package:flutter/material.dart';

class VelocidadeUI extends StatefulWidget {

  final _equation = _Velocidade(
      Colors.amber,
      [Colors.amber[500], Colors.amber[700]],
      Colors.amber[600]
  );

  @override
  _Velocidade createState() => CalcManager.velocidade.setEquation(_equation);
}

class _Velocidade extends Equation{

  _Velocidade(defaultColor, List<Color> degradeColors, Color shadowColor) : super(defaultColor, degradeColors, shadowColor);

  @override
  void initState() {
    this.createField("km percorridos");
    this.createField("tempo (minutos)");
  }

  Widget generateAnswer(dynamic response){
    return Text(
      "$response",
      style: TextStyle(fontSize: 26, color: Colors.white),
    );
  }
  
  @override
  makeCalc() {
    double km = double.parse(fields[0].getText());
    double tempo = double.parse(fields[1].getText()) / 60;

    double velocidade = km / tempo;

    return "A velocidade é de $velocidade km/h";
  }

}