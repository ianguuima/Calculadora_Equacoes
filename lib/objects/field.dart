import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Field {

  String value;
  TextEditingController controller;
  bool number = false;


  Field(this.value, { this.number }){
    if (!number) {
      controller = TextEditingController();
    } else controller = MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');
  }

  String getText(){
    return controller.text.replaceAll(",", ".");
  }

  Widget generate(Color defaultColor){

    String newValue = "${value.substring(0, 1).toUpperCase()}${value.substring(1)}";

    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: "$newValue",
          hintText: "Coloque o valor de $value",
          labelStyle: TextStyle(color: Colors.black45, fontSize: 20),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: defaultColor, width: 3.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black45, width: 3.0),
          ),
        ),
        style: TextStyle(color: Colors.black87, fontSize: 18),
        textAlign: TextAlign.left,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
      ),
    );
  }

}