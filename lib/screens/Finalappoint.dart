import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:amoc/utilis/constants.dart';
import 'package:flutter/painting.dart';
import 'package:table_calendar/table_calendar.dart';


String _chosenValue;

class AddAppointment extends StatefulWidget {
  AddAppointment({this.disname});
  final disname;
  @override
  _AddAppointmentState createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {
  DateTime selectedDate = DateTime.now();
  bool _decideWhichDayToEnable(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))) &&
        day.isBefore(DateTime.now().add(Duration(days: 10))))) {
      return true;
    }
    return false;
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
      selectableDayPredicate: _decideWhichDayToEnable,
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    double Width = MediaQuery.of(context).size.width / 411;
    double Height = MediaQuery.of(context).size.height / 731;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "A Few More Steps..",
          //if(disname==null){}
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: "Raleway",
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(0),
            //   topRight: Radius.circular(0),
            //   bottomLeft: Radius.circular(20 * Width / 411),
            //   bottomRight: Radius.circular(20 * Width / 411),
            //),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Color(0xff71e1de), Color(0x0071e1de)],
            ),
          ),
        ),
      ),
      body: Container(
        width: 411 * Width,
        height: 731 * Height,
        color: Color(0xff5fb1df),
        // padding: const EdgeInsets.only(
        //   bottom: 94,
        // ),
        child: Stack(
          children: [
            Container(
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
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Container(
                    margin: EdgeInsets.only(
                        left: 25 * Width,
                        right: 20 * Width,
                        bottom: 25 * Height),
                    width: 365 * Width,
                    height: 498 * Height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
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
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          width: 285,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              widget.disname,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 285,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Specialist',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30),
                          width: 285,
                          height: 145,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            maxLines: 8,
                            decoration: inputdecor("Decription"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: 285,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                              ),
                              Text(
                                "${selectedDate.toLocal()}".split(' ')[0],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 130),
                              ),
                              IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () {
                                  _selectDate(context);
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.only(left: 10),
                          width: 285 * Width,
                          height: 40 * Height,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                            color: Colors.white,
                          ),
                          child: Dropdown(),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 20)),
                      Container(
                        width: 100,
                        height: 40,
                        child: TextButton(
                          onPressed: () {},
                          child: Center(
                            child: Text(
                              'Cancel !',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.red),
                      ),
                      Padding(padding: EdgeInsets.only(left: 70)),
                      Container(
                        width: 200,
                        height: 40,
                        child: TextButton(
                          onPressed: () {},
                          child: Center(
                            child: Text(
                              'Make Appointmnet!',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: "Raleway",
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Dropdown extends StatefulWidget {
  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      focusColor: Colors.white,
      value: _chosenValue,
      elevation: 5,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontFamily: "Raleway",
        fontWeight: FontWeight.w600,
      ),
      iconEnabledColor: Colors.black,
      items: <String>[
        '10 A.M. to 12 P.M.',
        '6 P.M. TO 8 P.M.',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: Colors.black),
          ),
        );
      }).toList(),
      hint: Text(
        "Please choose a Time Slot",
        style: TextStyle(
          color: Colors.grey,
          fontSize: 18,
          fontFamily: "Raleway",
          fontWeight: FontWeight.w600,
        ),
      ),
      onChanged: (String value) {
        setState(() {
          _chosenValue = value;
        });
      },
    );
  }
}
//
// Padding(padding: EdgeInsets.only(top: 20)),
// Container(
// margin: EdgeInsets.only(
// left: 25 * Width,
// right: 20 * Width,
// bottom: 25 * Height),
// width: 365 * Width,
// height: 498 * Height,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
// boxShadow: [
// BoxShadow(
// color: Color(0x3f000000),
// blurRadius: 4,
// offset: Offset(0, 4),
// ),
// BoxShadow(
// color: Color(0x3f000000),
// blurRadius: 4,
// offset: Offset(0, 4),
// ),
// ],// child: Column(
// // children: [
// //
// // Container(
// // margin: EdgeInsets.only(top: 50),
// // width: 285,
// // height: 40,
// // decoration: BoxDecoration(
// // borderRadius: BorderRadius.circular(8),
// // boxShadow: [
// // BoxShadow(
// // color: Color(0x3f000000),
// // blurRadius: 4,
// // offset: Offset(0, 4),
// // ),
// // ],
// // color: Colors.white,
// // ),
// // child: Center(
// // child: Text(
// // widget.disname,
// // style: TextStyle(
// // color: Colors.black,
// // fontSize: 18,
// // fontFamily: "Raleway",
// // fontWeight: FontWeight.w600,
// // ),
// // ),
// // ),
// // ),
// // Container(
// // margin: EdgeInsets.only(top: 10),
// // width: 285,
// // height: 40,
// // decoration: BoxDecoration(
// // borderRadius: BorderRadius.circular(8),
// // boxShadow: [
// // BoxShadow(
// // color: Color(0x3f000000),
// // blurRadius: 4,
// // offset: Offset(0, 4),
// // ),
// // ],
// // color: Colors.white,
// // ),
// // child: Center(
// // child: Text(
// // 'Specialist',
// // style: TextStyle(
// // color: Colors.black,
// // fontSize: 18,
// // fontFamily: "Raleway",
// // fontWeight: FontWeight.w600,
// // ),
// // ),
// // ),
// // ),
// // Container(
// // margin: EdgeInsets.only(top: 30),
// // width: 285,
// // height: 145,
// // decoration: BoxDecoration(
// // borderRadius: BorderRadius.circular(8),
// // boxShadow: [
// // BoxShadow(
// // color: Color(0x3f000000),
// // blurRadius: 4,
// // offset: Offset(0, 4),
// // ),
// // ],
// // color: Colors.white,
// // ),
// // child: TextFormField(
// // // maxLines: 10,
// // maxLines: 8,
// // decoration: inputdecor("Decription"),
// // ),
// // ),
// // Container(
// // margin: EdgeInsets.only(top: 10),
// // width: 285,
// // height: 40,
// // decoration: BoxDecoration(
// // borderRadius: BorderRadius.circular(8),
// // boxShadow: [
// // BoxShadow(
// // color: Color(0x3f000000),
// // blurRadius: 4,
// // offset: Offset(0, 4),
// // ),
// // ],
// // color: Colors.white,
// // ),
// // child: Row(
// // children: [
// // Padding(padding:EdgeInsets.only(left: 10),),
// // Text(
// // "${selectedDate.toLocal()}".split(' ')[0],
// // style: TextStyle(
// // color: Colors.black,
// // fontSize: 18,
// // fontFamily: "Raleway",
// // fontWeight: FontWeight.w600,
// // ),
// // ),
// // Padding(padding:EdgeInsets.only(left: 130),),
// // IconButton(
// // icon: Icon(Icons.calendar_today),
// // onPressed: (){
// // _selectDate(context);
// // // Navigator.of(context).push(
// // //   MaterialPageRoute(
// // //     builder: (context) {
// // //       return TableBasicsExample();
// // //     },
// // //   ),
// // // );
// // },
// // ),
// color: Color(0xffb9f6fc),
// ),

// ],
// ),
//
// ),
// Container(
// margin: EdgeInsets.only(top: 10),
// padding: EdgeInsets.only(left: 10),
// width: 285*Width,
// height: 40*Height,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(8),
// boxShadow: [
// BoxShadow(
// color: Color(0x3f000000),
// blurRadius: 4,
// offset: Offset(0, 4),
// ),
// ],
// color: Colors.white,
// ),
// child: Dropdown(),
// ),
//
// ],
// ),
// ),
// Container(
// width: 200,
// height: 40,
// child: TextButton(
// onPressed: (){
// // Navigator.of(context).push(
// //   MaterialPageRoute(
// //     builder: (context) {
// //       return Appoint(disname: disname);
// //     },
// //   ),
// // );
// },
// child: Center(
// child: Text(
// 'Consult Now!',
// style: TextStyle(
// color: Colors.black,
// fontSize: 20,
// fontFamily: "Raleway",
// fontWeight: FontWeight.w600,
// ),
// ),
// ),
// ),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(30),
// color: Colors.red
// ),
// ),
