import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:amoc/screens/userinfo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xff5fb1df),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(0), topRight: Radius.circular(40), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xff70ddde), Color(0x0070ddde)], ),
          ),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[

              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.account_circle),
                    tooltip: 'Increase volume by 10',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return UserInfo();
                          },
                        ),
                      );
                    },
                    iconSize: 41,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20,left: 30),
                    height: 80,
                    child: Text(
                      "USERNAME\nLOCATION",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              SidebarItem(icun: FontAwesomeIcons.stethoscope ,name: "Consult Now!",),
              SidebarItem(icun: FontAwesomeIcons.capsules ,name: "Buy Medicines",),
              SidebarItem(icun: FontAwesomeIcons.fileAlt ,name: "Manage Lab Reports",),
              SidebarItem(icun: FontAwesomeIcons.syringe ,name: "Get Testes",),
              SidebarItem(icun: FontAwesomeIcons.moneyBillWave ,name: "Invoices ",),
              SidebarItem(icun: FontAwesomeIcons.bookmark ,name: "Bookmarks ",),
              SidebarItem(icun: FontAwesomeIcons.cog ,name: "Bookmarks ",),
              SidebarItem(icun: FontAwesomeIcons.exclamationCircle ,name: "Abouts Us ",),
              // SidebarItem(icun: Icons.settings,name: "Get Testes",),
              // SidebarItem(icun: Icons.receipt,name: "Invoices",),
              // SidebarItem(icun: Icons.bookmarks_outlined,name: "Bookmarks",),
              // SidebarItem(icun: Icons.settings,name: "Settings",),
              // SidebarItem(icun: Icons.settings,name: "Abouts Us",),




            ],
          ),
        ),
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  SidebarItem({this.icun,this.name});
  final icun;
  final name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25),
      child: InkWell(
        // onTap: (){
        //   Navigator.of(context).push(
        //     MaterialPageRoute(
        //       builder: (context) {
        //         return UserInfo();
        //       },
        //     ),
        //   );
        // },
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 10)),
            FaIcon(
                icun,
              size: 30,
            ),
            Padding(padding: EdgeInsets.only(left: 10)),
            Text(
              name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: "Raleway",
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
