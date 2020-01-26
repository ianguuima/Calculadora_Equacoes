import 'package:calc/manager/calcmanager.dart';
import 'package:calc/ui/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PorcetangemUI extends StatefulWidget{

  final _equation = _Porcentagem(
      Colors.cyan,
      [Colors.cyan[500], Colors.cyan[700]],
      Colors.cyan[600]
  );

  @override
  _Porcentagem createState() => CalcManager.porcentagem.setEquation(_equation);
}

class _Porcentagem extends Equation{

  _Porcentagem(defaultColor, List<Color> degradeColors, Color shadowColor) : super(defaultColor, degradeColors, shadowColor);

  @override
  void initState() {
    this.createField("porcentagem");
    this.createField("numero");
  }

  @override
  Widget generateAnswer(response) {
    String answer = response;

    double fontSize = 42;
    if (answer.length > 16) fontSize = 32;

    return Text(
      "$response",
      style: TextStyle(fontSize: fontSize, color: Colors.white),
    );
  }

  @override
  makeCalc() {
    double porcentagem = double.parse(fields[0].getText());
    double numero = double.parse(fields[1].getText());

    String resultado = (numero * (porcentagem / 100)).toStringAsFixed(2);

    return "$porcentagem% de $numero é $resultado";
  }

}