import 'package:flutter/material.dart';
import 'package:flutter_money_management_app/constants/color_constant.dart';
import 'package:flutter_money_management_app/models/card_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        print("Drawer Tapped!");
                      },
                      child: Image.asset('assets/images/bar.png'),
                    ),
                    Container(
                      height: 59,
                      width: 59,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage('assets/images/user.png'))),
                    )
                  ]),
            ),
            SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 16,),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Good Morning', style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: kBlackColor
                  ),), 
                  Text('Amanda Alex', style: GoogleFonts.inter(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: kBlackColor
                  ))
                  ],
              ),
            ),

            Container(
              height: 199,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16, right: 6),
                itemCount: cards.length,
                itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 199,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Color(int.parse(cards[index].cardBackground)),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: SvgPicture.asset(cards[index].cardElementTop)
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: SvgPicture.asset(cards[index].cardElementBottom)
                      ),
                      Positioned(
                        left: 29,
                        top: 48,
                        child: Text('CARD NUMBER', style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: kWhiteColor
                        ),),
                      ),
                      Positioned(
                        left: 29,
                        top: 68,
                        child: Text(cards[index].cardNumber, style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: kWhiteColor
                        ),),
                      ),
                      Positioned(
                        right: 21,
                        top: 35,
                        child: Image.asset(cards[index].cardType)
                      ),
                      Positioned(
                        left: 29,
                        bottom: 45,
                        child: Text('CARD HOLDERNAME', style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: kWhiteColor
                        ))
                      ),
                      Positioned(
                        left: 29,
                        bottom: 21,
                        child: Text(cards[index].user, style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: kWhiteColor
                        ))
                      ),
                    ]
                  )
                );
              }),
            )

          ],
        ),
      ),
    );
  }
}
