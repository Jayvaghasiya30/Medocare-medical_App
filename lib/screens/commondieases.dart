//import 'dart:html';

import 'package:flutter/material.dart';

class CommonDiseases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width / 411;
    double Height = MediaQuery.of(context).size.height / 731;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(
          'Common Diseases',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: 411 * Width,
          height: 731 * Height,
          color: Color(0xff5fb1df),
          child: Stack(
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 411 * Width,
                    height: 637 * Height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomLeft: Radius.circular(500),
                        bottomRight: Radius.circular(0),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [Color(0xff71e1de), Color(0x0071e1de)],
                      ),
                    ),
                    child: ListView(
                      children: [
                        // TextField(
                        //   decoration: InputDecoration(
                        //     border:
                        //   ),),
                        diseaseContainer(),
                        diseaseContainer(),
                        diseaseContainer(),
                        diseaseContainer(),
                        diseaseContainer(),
                        diseaseContainer(),
                        diseaseContainer(),
                        diseaseContainer(),
                        diseaseContainer(),
                        diseaseContainer(),
                        diseaseContainer(),
                        diseaseContainer(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class diseaseContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width / 411;
    double Height = MediaQuery.of(context).size.height / 731;
    return Container(
      margin: EdgeInsets.only(
          left: 25 * Width, right: 20 * Width, bottom: 25 * Height),
      width: 371 * Width,
      height: 58 * Height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
          BoxShadow(
            color: Color(0x3f000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        color: Color(0xffb9f6fc),
      ),
      child: TextButton(
        onPressed: () {},
        child: Center(
          child: Text(
            'get disease from database',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: "Raleway",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}