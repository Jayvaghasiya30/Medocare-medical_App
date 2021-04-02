import 'package:flutter/material.dart';

class textbox extends StatelessWidget {
  const textbox(this.str) ;
  final str ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: inputdecor(str) ,
    );
  }


}
InputDecoration inputdecor(strr) {
  return InputDecoration(
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.all(10.0),
    hintText: strr,
    hintStyle: TextStyle(
      color: Colors.grey,
    ),
    border: OutlineInputBorder(
      borderRadius:  BorderRadius.all(
        Radius.circular(8),
      ),
      borderSide: BorderSide.none,
    ),
  );
}

BoxDecoration boxDecoration(colorr) {
  return BoxDecoration(
borderRadius: BorderRadius.circular(8),
boxShadow: [
  BoxShadow(
    color: Color(0x3f000000),
    blurRadius: 4,
    offset: Offset(0, 4),
  ),
],

color: colorr,
);
}