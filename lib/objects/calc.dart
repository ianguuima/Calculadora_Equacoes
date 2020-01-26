import 'package:calc/enums/equationtype.dart';
import 'package:calc/ui/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calc{

  EquationType equationType;
  String route, name;
  IconData icon;
  Equation _equation;

  Calc(this.route, this.name, this.icon){
    this.equationType = EquationType.math;
  }

  Calc.physic(this.route, this.name, this.icon){
    this.equationType = EquationType.physic;
  }

  Equation setEquation(Equation equation){
    this._equation = equation;
    _setEquationIcon();
    return equation;
  }

  void _setEquationIcon(){
    this._equation.icon = Icon(
      icon,
      color: Colors.white,
      size: 64,
    );
  }


}