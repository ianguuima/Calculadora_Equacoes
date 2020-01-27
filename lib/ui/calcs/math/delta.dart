import 'package:calc/extensions/math_calcs.dart';
import 'package:calc/main.dart';
import 'package:calc/manager/calcmanager.dart';
import 'package:calc/ui/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DeltaUi extends StatefulWidget {

  final _equation = _Delta(
      Colors.green,
      [Colors.green[500], Colors.green[700]],
      Colors.green[600]
  );

  @override
  _Delta createState() => CalcManager.delta.setEquation(_equation);
}

class _Delta extends Equation{

  _Delta(defaultColor, List<Color> degradeColors, Color shadowColor) : super(defaultColor, degradeColors, shadowColor);

  @override
  void initState() {
    this.createField("A");
    this.createField("B");
    this.createField("C");
  }

  @override
  double makeCalc() {
    double a = double.parse(fields[0].getText());
    double b = double.parse(fields[1].getText());
    double c = double.parse(fields[2].getText());
    return delta(a, b, c);
  }

}