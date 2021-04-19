import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:amoc/utilis/constants.dart';
import 'package:flutter/painting.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:intl/intl.dart';

String _chosenValue;
DateTime selectedDate = DateTime.now();
TwilioFlutter twilioFlutter;
class AddAppointment extends StatefulWidget {
  AddAppointment({this.disname});
  final disname;
  @override
  _AddAppointmentState createState() => _AddAppointmentState();
}

class _AddAppointmentState extends State<AddAppointment> {

  String date= DateFormat('dd/MM/yyyy').format(selectedDate);
  final TextEditingController _decriptionController = TextEditingController();
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
        date = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
  }
  void sendSms() async {
    twilioFlutter.sendSMS(
        toNumber: '+916355592698',
        messageBody:
        '\n '+'Appointment Request from $currentuser \n'+
            'Email : '+ '$currentemail' + '\n'+
            'Disease : '+
            widget.disname+'\n'+
            'Description : '+_decriptionController.text + '\n'+
            'Date : '+ '$date' + '\n'+
            'Time : ' + _chosenValue
    );
  }


  @override
  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'AC727cebaaed325b94b16b80dbe12d4440',
        authToken: '1998c5ab6930b259c14458fd86310502',
        twilioNumber: '+18282660080');
    super.initState();
  }
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 20 * Height)),
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
                        ],
                        color: Color(0xffb9f6fc),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 50 * Height),
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
                            child: Center(
                              child: Text(
                                widget.disname,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18 * Width,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
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
                            child: Center(
                              child: Text(
                                'Specialist',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 17 * Width,
                                  fontFamily: "Raleway",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30 * Height),
                            width: 285 * Width,
                            height: 145 * Height,
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
                              maxLines: 10,
                              controller: _decriptionController,
                              decoration: inputdecor("Decription"),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10 * Height),
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
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10 * Width),
                                ),
                                Text(
                                  date,
                                 // "${selectedDate.toLocal()}".split(' ')[0],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18 * Height,
                                    fontFamily: "Raleway",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 100 * Width),
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
                            margin: EdgeInsets.only(top: 10 * Height),
                            padding: EdgeInsets.only(left: 10 * Width),
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
                    Padding(padding: EdgeInsets.only(top: 20 * Height)),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 20 * Width)),
                        Container(
                          width: 100 * Width,
                          height: 40 * Height,
                          child: TextButton(
                            onPressed: () {},
                            child: Center(
                              child: Text(
                                'Cancel !',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15 * Height,
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
                        Padding(padding: EdgeInsets.only(left: 70 * Width)),
                        Container(
                          width: 220 * Width,
                          height: 40 * Height,
                          child: TextButton(
                            onPressed: () {
                              sendSms();
                            },
                            child: Center(
                              child: Text(
                                'Make Appointmnet!',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15 * Height,
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
