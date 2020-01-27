

import 'package:calc/manager/calcmanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:calc/extensions/math_calcs.dart';


import '../../base.dart';

class PermutacaoUI extends StatefulWidget {

  final _equation = _Permutacao(
      Colors.lime,
      [Colors.lime[500], Colors.lime[700]],
      Colors.lime[600]
  );

  @override
  _Permutacao createState() => CalcManager.delta.setEquation(_equation);
}

class _Permutacao extends Equation{

  _Permutacao(defaultColor, List<Color> degradeColors, Color shadowColor) : super(defaultColor, degradeColors, shadowColor);

  @override
  void initState() {
    this.createField("numero de elementos");
  }

  @override
  Widget generateAnswer(response) {
    String answer = response;

    double fontSize = 64;
    if (answer.length > 6) fontSize = 48;

    return Text(
      "$response",
      style: TextStyle(fontSize: fontSize, color: Colors.white),
    );
  }

  @override
  makeCalc() {
    double value = double.parse(fields[0].getText());

    return new MaskedTextController(mask: '000.000.000.00', text: value.factorial().toString()).text;
  }

}