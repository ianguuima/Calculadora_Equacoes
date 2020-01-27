import 'package:calc/extensions/math_calcs.dart';
import 'package:calc/main.dart';
import 'package:calc/manager/calcmanager.dart';
import 'package:calc/ui/base.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


class SegundoGrauUi extends StatefulWidget {

  final _equation = _SegundoGrau(
      Colors.orange,
      [Colors.orange[500], Colors.orange[700]],
      Colors.orange[600]
  );

  @override
  _SegundoGrau createState() => CalcManager.segundoGrau.setEquation(_equation);
}

class _SegundoGrau extends Equation {

  _SegundoGrau(defaultColor, List<Color> degradeColors, Color shadowColor) : super(defaultColor, degradeColors, shadowColor);

  @override
  void initState() {
    this.createField("A");
    this.createField("B");
    this.createField("C");
  }

  @override
  dynamic makeCalc() {
    double a = double.parse(fields[0].getText());
    double b = double.parse(fields[1].getText());
    double c = double.parse(fields[2].getText());

    double deltaCalc = delta(a, b, c);
    if (deltaCalc < 0) return "∄";

    String resultadoPositivo = (((- b) + (math.sqrt(deltaCalc))) / (2 * a)).toStringAsFixed(1);
    String resultadoNegativo = (((- b) - (math.sqrt(deltaCalc))) / (2 * a)).toStringAsFixed(1);

    return [resultadoPositivo, resultadoNegativo];
  }
}
