import 'package:calc/enums/equationtype.dart';
import 'package:calc/manager/calcmanager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                color: Colors.blue
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    "Calculadora de Equações",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      fontWeight: FontWeight.w500
                    )
                ),
                Text(
                    "Escolha qual conta deseja realizar",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                    )
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 30,)
              ],
            ),
          ),
          ...createDivider("Matemática"),
          ..._generateTiles(EquationType.math),
          ...createDivider("Física"),
          ..._generateTiles(EquationType.physic),
          _generateTile(
              "Créditos",
              Icons.info,
              () => Navigator.pushNamed(context, "/creditos")
          )

        ],
      ),
    );
  }


  List<Widget> createDivider(String subject){
    return [
      Divider(),
      Text(
        subject,
        style: TextStyle(color: Colors.black38, fontSize: 14),
        textAlign: TextAlign.center,
      ),
    ];
  }

  List<Widget> _generateTiles(EquationType equationType){
    var calcs = CalcManager().calcs.where((c) => c.equationType == equationType).toList();
    var tiles = List<Widget>();

    for (var calc in calcs) {
      var tile = _generateTile(
          calc.name,
          calc.icon,
          () => Navigator.pushNamed(context, calc.route)
      );

      tiles.add(tile);
    }

    return tiles;
  }


  Widget _generateTile(String text, IconData icon, Function function){
    return ListTile(
      leading: Icon(icon),
      title: Text(text, style: TextStyle(fontSize: 18)),
      onTap: function,
    );
  }
}

