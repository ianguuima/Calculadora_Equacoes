import 'package:calc/manager/calcmanager.dart';
import 'package:calc/ui/calcs/math/delta.dart';
import 'package:calc/ui/creditos.dart';
import 'package:calc/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
  home: HomePage(),
  initialRoute: "/",
  theme: ThemeData(
    textTheme: GoogleFonts.robotoTextTheme()
  ),
  routes: {
    ...CalcManager().getRoutes(),
    "/creditos" : (context) => Creditos(),
  }
));