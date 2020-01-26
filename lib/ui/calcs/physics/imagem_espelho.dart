import 'package:calc/main.dart';
import 'package:calc/manager/calcmanager.dart';
import 'package:calc/ui/base.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ImagemEspelhoUi extends StatefulWidget {

  final _equation = _ImagemEspelho(
      Colors.brown,
      [Colors.brown[500], Colors.brown[700]],
      Colors.brown[600]
  );

  @override
  _ImagemEspelho createState() => CalcManager.imagemEspelho.setEquation(_equation);
}

class _ImagemEspelho extends Equation {

  _ImagemEspelho(defaultColor, List<Color> degradeColors, Color shadowColor) : super(defaultColor, degradeColors, shadowColor);

  @override
  void initState() {
    createField("angulo formado");
  }

  Widget generateAnswer(dynamic response){
    return Text(
      "$response imagens",
      style: TextStyle(fontSize: 54, color: Colors.white),
    );
  }

  @override
  dynamic makeCalc() {
    double a = double.parse(fields[0].getText());

    double calc = (360 / a) - 1;
    return calc.toInt();
  }
}
