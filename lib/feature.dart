// import 'package:appoint/heart.dart/main.dart';
// import 'package:appoint/heart/homePage.dart';
import 'package:appoint/blood_pressure/main.dart';
import 'package:appoint/firestore-data/searchList.dart';
import 'package:appoint/heart/homePage.dart';
import 'package:appoint/macro/pages/home_page.dart';
import 'package:appoint/macro/pages/main.dart';
import 'package:appoint/main.dart';
import 'package:appoint/meditation/main.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:appoint/model/bannerModel.dart';
import 'package:appoint/screens/disease.dart';
import 'package:appoint/screens/diseasedetail.dart';
import 'package:appoint/screens/web_page.dart';
import 'package:appoint/model/more_feature.dart';

import 'call/emergency.dart';

// import 'heart/main.dart';

class Feature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider.builder(
        itemCount: cardmore.length,
        itemBuilder: (context, index, realIndex) {
          return Container(
            //alignment:  Alignment.centerLeft,
            //width: MediaQuery.of(context).size.width,
            height: 140,
            margin: EdgeInsets.only(left: 0, top: 10, right: 50, bottom: 0),
            padding: EdgeInsets.only(left: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                stops: [0.3, 0.7],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: cardmore[index].cardBackground,
              ),
            ),
            child: GestureDetector(
              onTap: () {
                index == 0
                    ? Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                        return Emergency();
                      }))
                    : ((index == 1
                        ? Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                            return MyBlood();
                          }))
                        :(index == 2
                        ? Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                            return MyAppcro();
                          }))
                        : Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                            return MyAppmedi();
                          })))));
                // if (index == 0) {
                //   return Navigator.push(context,
                //       MaterialPageRoute(builder: (BuildContext context) {
                //     return MyAppcro();
                //   }));
                // } else if (index == 1) {
                //   return Navigator.push(context,
                //       MaterialPageRoute(builder: (BuildContext context) {
                //     return WebPage();
                //   }));
                // } else {
                //   return Navigator.push(context,
                //       MaterialPageRoute(builder: (BuildContext context) {
                //     return MyAppcro();
                //   }));
                // }
              },
              child: Stack(
                children: [
                  Image.asset(
                    cardmore[index].image,
                    //'assets/414.jpg',
                    fit: BoxFit.fitHeight,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 7, right: 5),
                    alignment: Alignment.topRight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          cardmore[index].text,
                          //'Check Disease',
                          style: GoogleFonts.lato(
                            color: Colors.lightBlue[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.lightBlue[900],
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          scrollPhysics: ClampingScrollPhysics(),
        ),
      ),
    );
  }
}
