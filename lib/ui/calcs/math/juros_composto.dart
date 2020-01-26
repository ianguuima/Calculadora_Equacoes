import 'package:calc/manager/calcmanager.dart';
import 'package:calc/ui/base.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_masked_text/flutter_masked_text.dart';


class JurosCompostoUi extends StatefulWidget {

  final _equation = _JurosComposto(
      Colors.purple,
      [Colors.purple[500], Colors.purple[700]],
      Colors.purple[600]
  );

  @override
  _JurosComposto createState() => CalcManager.jurosComposto.setEquation(_equation);
}

class _JurosComposto extends Equation{

  _JurosComposto(defaultColor, List<Color> degradeColors, Color shadowColor) : super(defaultColor, degradeColors, shadowColor);

  @override
  void initState() {
    this.createField("capital", money: true);
    this.createField("taxa de juros");
    this.createField("tempo de aplicação - MESES");
  }

  @override
  makeCalc() {
    MoneyMaskedTextController capitalController = fields[0].controller;

    double capital = capitalController.numberValue;
    double taxaJuros = double.parse(fields[1].getText());
    double tempoAplicacao = double.parse(fields[2].getText());

    double newJuros = taxaJuros / 100;

    double montante = capital * (math.pow((1 + newJuros), tempoAplicacao));
    return montante.toStringAsFixed(2);
  }


}