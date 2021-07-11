// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class NotificationList extends StatefulWidget {
//   @override
//   _NotificationListState createState() => _NotificationListState();
// }

// class _NotificationListState extends State<NotificationList> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//             splashRadius: 20,
//             icon: Icon(
//               Icons.arrow_back_ios,
//               color: Colors.indigo,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             }),
//         title: Text(
//           'Notifications',
//           style: GoogleFonts.lato(
//             color: Colors.indigo,
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:ui';
// import 'package:appoint/screens/searching.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:appoint/firestore-data/appointmentHistoryList.dart';
// import 'package:appoint/screens/userSettings.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatefulWidget {
  const About({Key key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<About> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  User user;

  Future<void> _getUser() async {
    user = _auth.currentUser;
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowGlow();
            return;
          },
          child: ListView(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: const DecorationImage(
                            image: NetworkImage(
                                'https://scontent-hkg4-2.xx.fbcdn.net/v/t1.6435-0/p600x600/71577599_2415684162032383_1656605298799935488_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=e3f864&_nc_ohc=S0z1O1qhGN8AX-CwsRB&_nc_oc=AQkde-K2xCRkqTz_3VCxGRjdW-mtN017U47Mg38SHL2t-UgTBAVhJUuMs1NHxDL41Jc&_nc_ht=scontent-hkg4-2.xx&tp=6&oh=13f16b98c46a7a82c04fb1e5484062b2&oe=60EB2735'),
                            fit: BoxFit.fill,
                          ),
                          border: Border.all(
                            color: Colors.blue,
                            width: 5,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: MediaQuery.of(context).size.height / 5,
                        // child: Container(
                        //   padding: EdgeInsets.only(top: 10, right: 7),
                        //   alignment: Alignment.topRight,
                        //   child: IconButton(
                        //     icon: Icon(
                        //       FlutterIcons.gear_faw,
                        //       color: Colors.white,
                        //       size: 20,
                        //     ),
                        //     onPressed: () {},
                        //   ),
                        // ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 5,
                        padding: EdgeInsets.only(top: 75),
                        child: Text(
                          'Ngô Nguyễn Thiện Tâm',
                          style: GoogleFonts.lato(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/thientam.jpg'),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.teal[50],
                          width: 5,
                        ),
                        shape: BoxShape.circle),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                padding: EdgeInsets.only(left: 20),
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey[50],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            height: 27,
                            width: 27,
                            color: Colors.red[900],
                            child: IconButton(
                              icon: Icon(
                                Icons.mail_rounded,
                                color: Colors.white,
                                size: 10,
                              ),
                              onPressed: () async => _launchUrl(
                                  "mailto:ngonguyenthientam@gmail.com?subject=Feedback&body=Dear Mr. Tam,"),
                            ),

                            // child: Icon(
                            //   Icons.mail_rounded,
                            //   color: Colors.white,
                            //   size: 16,
                            // ),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        // Container(
                        //   child: getEmail(),
                        // )
                        TextButton(
                          child: Text(
                            'ngonguyenthientam@gmail.com',
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () async => _launchUrl(
                              "mailto:ngonguyenthientam@gmail.com?subject=Feedback&body=Dear Mr. Tam,"),
                        ),
                        // Text(
                        //   'ngonguyenthientam@gmail.com',
                        //   style: GoogleFonts.lato(
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.w600,
                        //     color: Colors.black54,
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            height: 27,
                            width: 27,
                            color: Colors.blue[800],
                            child: IconButton(
                              icon: Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 12,
                              ),
                              onPressed: () async =>
                                  _launchUrl("tel:0378993114"),
                            ),

                            // child: Icon(
                            //   Icons.phone,
                            //   color: Colors.white,
                            //   size: 16,
                            // ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        TextButton(
                          child: Text(
                            "0378993114",
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                          onPressed: () async => _launchUrl("tel:0378993114"),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            height: 27,
                            width: 27,
                            color: Colors.blue[800],
                            child: IconButton(
                              icon: Icon(
                                Icons.message,
                                color: Colors.white,
                                size: 12,
                              ),
                              onPressed: () async =>
                                  _launchUrl("sms:0378993114"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            height: 27,
                            width: 27,
                            color: Colors.blue[800],
                            child: Icon(
                              Icons.school,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "I am a student at HCMUS",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(left: 15, right: 15, top: 20),
              //   padding: EdgeInsets.only(left: 20, top: 20),
              //   height: MediaQuery.of(context).size.height / 7,
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.blueGrey[50],
              //   ),
              //   child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           ClipRRect(
              //             borderRadius: BorderRadius.circular(30),
              //             child: Container(
              //               height: 27,
              //               width: 27,
              //               color: Colors.indigo[600],
              //               child: Icon(
              //                 FlutterIcons.pencil_ent,
              //                 color: Colors.white,
              //                 size: 16,
              //               ),
              //             ),
              //           ),
              //           // SizedBox(
              //           //   width: 10,
              //           // ),
              //           // Text(
              //           //   'Health Insurance',
              //           //   style: GoogleFonts.lato(
              //           //     fontSize: 16,
              //           //     fontWeight: FontWeight.bold,
              //           //     color: Colors.black,
              //           //   ),
              //           // ),
              //         ],
              //       ),
              //       Container(
              //         child: getBio(),
              //       )
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(left: 15, right: 15, top: 20),
              //   padding: EdgeInsets.only(left: 20, top: 20),
              //   height: MediaQuery.of(context).size.height / 7,
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.blueGrey[50],
              //   ),
              //   child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           ClipRRect(
              //             borderRadius: BorderRadius.circular(30),
              //             child: Container(
              //               height: 27,
              //               width: 27,
              //               color: Colors.indigo[600],
              //               child: Icon(
              //                 FlutterIcons.pencil_ent,
              //                 color: Colors.white,
              //                 size: 16,
              //               ),
              //             ),
              //           ),
              //           SizedBox(
              //             width: 10,
              //           ),
              //           Text(
              //             'Social Insurance',
              //             style: GoogleFonts.lato(
              //               fontSize: 16,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.black,
              //             ),
              //           ),
              //           Expanded(
              //             child: Container(
              //               padding: EdgeInsets.only(right: 10),
              //               alignment: Alignment.centerRight,
              //               child: SizedBox(
              //                 height: 30,
              //                 child: TextButton(
              //                   onPressed: () {
              //                     Navigator.push(context, MaterialPageRoute(
              //                         builder: (BuildContext context) {
              //                       return WebHealth();
              //                     }));
              //                   },
              //                   child: Text('Searching'),
              //                 ),
              //               ),
              //             ),
              //           )
              //         ],
              //       ),
              //       Container(
              //         child: getSocial(),
              //       )
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(left: 15, right: 15, top: 20),
              //   padding: EdgeInsets.only(left: 20, top: 20),
              //   height: MediaQuery.of(context).size.height / 3,
              //   width: MediaQuery.of(context).size.width,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(10),
              //     color: Colors.blueGrey[50],
              //   ),
              //   child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           ClipRRect(
              //             borderRadius: BorderRadius.circular(30),
              //             child: Container(
              //               height: 27,
              //               width: 27,
              //               color: Colors.green[900],
              //               child: Icon(
              //                 FlutterIcons.history_faw,
              //                 color: Colors.white,
              //                 size: 16,
              //               ),
              //             ),
              //           ),
              //           SizedBox(
              //             width: 10,
              //           ),
              //           Text(
              //             "Appointment History",
              //             style: GoogleFonts.lato(
              //               fontSize: 16,
              //               fontWeight: FontWeight.bold,
              //               color: Colors.black,
              //             ),
              //           ),
              //           Expanded(
              //             child: Container(
              //               padding: EdgeInsets.only(right: 10),
              //               alignment: Alignment.centerRight,
              //               child: SizedBox(
              //                 height: 30,
              //                 child: TextButton(
              //                   onPressed: () {},
              //                   child: Text(''),
              //                 ),
              //               ),
              //             ),
              //           )
              //         ],
              //       ),
              //       SizedBox(
              //         height: 10,
              //       ),
              //       Expanded(
              //         child: Scrollbar(
              //           child: Container(
              //             padding: EdgeInsets.only(left: 35, right: 15),
              //             child: SingleChildScrollView(
              //               child: AppointmentHistoryList(),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBio() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        var userData = snapshot.data;
        return Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 10, left: 36),
          child: Text(
            userData['number'] == null ? "No Number" : userData['number'],
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black54,
            ),
          ),
        );
      },
    );
  }

  Widget getName() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        var userData = snapshot.data;
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 4, bottom: 20),
          child: Text(
            userData['name'] == null ? "No Number" : userData['name'],
            style: GoogleFonts.lato(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
        );
      },
    );
  }

  Widget getPhone() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        var userData = snapshot.data;
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 4, bottom: 2),
          child: Text(
            userData['phone'] == null ? "No Number" : userData['phone'],
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
        );
      },
    );
  }

  Widget getSocial() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        var userData = snapshot.data;
        return Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 10, left: 36),
          child: Text(
            userData['social insurance'] == null
                ? "No Number"
                : userData['social insurance'],
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black54,
            ),
          ),
        );
      },
    );
  }
}
