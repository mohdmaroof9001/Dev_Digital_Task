import 'package:flutter/material.dart';

get25FontSize() {
  return 25.0;
}

get20FontSize() {
  return 20.0;
}

get15FontSize() {
  return 15.0;
}

BorderRadius getNormalBorderRadius() {
  return BorderRadius.circular(5);
}

Text addText(text, size, color, fontWeight) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}

TextField textFieldMethod(controller, {hintText, fontSize, keyboardType}) {
  return TextField(
    controller: controller,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(fontSize: fontSize),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 5),
      ),
    ),
  );
}

Container buttonMethod(text) {
  return Container(
    height: 60,
    decoration: BoxDecoration(
        color: Colors.green, borderRadius: getNormalBorderRadius()),
    child: Center(
      child: addText(text, get20FontSize(), Colors.white, FontWeight.w500),
    ),
  );
}
