import 'package:calc/objects/calc.dart';
import 'package:calc/ui/calcs/math/delta.dart';
import 'package:calc/ui/calcs/math/juros_composto.dart';
import 'package:calc/ui/calcs/math/permutacao.dart';
import 'package:calc/ui/calcs/math/porcentagem.dart';
import 'package:calc/ui/calcs/math/segundo_grau.dart';
import 'package:calc/ui/calcs/physics/imagem_espelho.dart';
import 'package:calc/ui/calcs/physics/velocidade.dart';
import 'package:flutter/material.dart';

class CalcManager{

  List<Calc> calcs = List();

  Map<String, WidgetBuilder> getRoutes() => {
      delta.route : (context) => DeltaUi(),
      jurosComposto.route : (context) => JurosCompostoUi(),
      porcentagem.route : (context) => PorcetangemUI(),
      segundoGrau.route : (context) => SegundoGrauUi(),
      imagemEspelho.route : (context) => ImagemEspelhoUi(),
      permutacao.route : (context) => PermutacaoUI(),
      velocidade.route : (context) => VelocidadeUI(),
  };

  void addAllEquations(){
    calcs.addAll([
      delta,
      jurosComposto,
      porcentagem,
      segundoGrau,
      imagemEspelho,
      permutacao,
      velocidade,
    ]);
  }

  // Matemática

  static var delta = Calc(
    "/delta",
    "Delta",
    Icons.change_history,
  );

  static var jurosComposto = Calc(
    "/juros_composto",
    "Juros Composto",
    Icons.monetization_on,
  );

  static var porcentagem = Calc(
    "/porcentagem",
    "Porcentagem",
    Icons.view_comfy,
  );

  static var segundoGrau = Calc(
    "/segundo_grau",
    "Equação de 2º Grau",
    Icons.looks_two,
  );

  static var permutacao = Calc(
    "/permutacao",
    "Permutação (ex.: P10)",
    Icons.show_chart,
  );

  // Fisica

  static var imagemEspelho = Calc.physic(
    "/segundo_grau",
    "Imagens de um Objeto Entre Dois Espelhos Planos",
    Icons.wallpaper,
  );

  static var velocidade = Calc.physic(
    "/velocidade",
    "Calcular a Velocidade",
    Icons.timer,
  );


  static final CalcManager _singleton = CalcManager._internal();

  factory CalcManager() {
    return _singleton;
  }

  CalcManager._internal(){
    addAllEquations();
  }

}