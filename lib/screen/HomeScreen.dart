import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../model/Logbook.dart';
import '../spedometer/GaugeView.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Logbook> logbookList = [
    Logbook(date: 'Today - May 21 Monday', signed: false, isViolation: true),
    Logbook(date: 'May 20 Sunday',signed: true,isViolation: false),
    Logbook(date: 'May 19 Saturday',signed: false,isViolation: false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7F9),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color(0xFFF6F7F9),
            statusBarIconBrightness: Brightness.dark),
        toolbarHeight: 0,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8, left: 16, right: 16),
              child: SizedBox(
                height: 64,
                child: Row(
                  children: [
                    Card(
                        color: Color(0xFFD2EAD1),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(8),
                            child: SvgPicture.asset(
                              'assets/images/bluetooth.svg',
                              width: 24,
                              height: 24,
                            ))),
                    Padding(
                      padding: EdgeInsets.only(left: 8, top: 12),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Vyacheslav',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 4),
                                child: Text(
                                  'User #1385',
                                  style: TextStyle(
                                      color: Color(0xFF41B631),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                )),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                      color: Color(0xFFE5E7EA),
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: SvgPicture.asset(
                            'assets/images/sun.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Stack(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                          color: Color(0xFFE5E7EA),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 8, bottom: 8),
                            child: SvgPicture.asset(
                              'assets/images/notification.svg',
                              width: 16,
                              height: 24,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF1872F6),
                            ),
                            child: const Center(
                              child: Text(
                                '5',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text('Today Trailers:',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0x661C293E),
                              fontWeight: FontWeight.w600)),
                      const Text(' 3',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF1C293E),
                              fontWeight: FontWeight.w600)),
                      const SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset('assets/images/bottom_vector.svg')
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Shipping IDs:',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0x661C293E),
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(' 5',
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF1C293E),
                              fontWeight: FontWeight.w600)),
                      SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset('assets/images/bottom_vector.svg')
                    ],
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 270,
                  height: 270,
                  child: GaugeView(
                    minSpeed: 0,
                    maxSpeed: 100,
                    speed: 40,
                    animate: true,
                    duration: Duration(seconds: 5),
                    alertSpeedArray: [40, 80, 90],
                    alertColorArray: [Colors.orange, Colors.indigo, Colors.red],
                    gaugeWidth: 15,
                    fractionDigits: 1,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text(
                            'Drive Left',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0x661C293E),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Text(
                            '10:31',
                            style: TextStyle(
                                fontSize: 26,
                                color: Color(0xFF1C293E),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 16, top: 6),
                          child: Stack(
                            children: [
                              Container(
                                width: 77,
                                height: 6,
                                decoration: BoxDecoration(
                                    color: Color(0xFFE6E8ED),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              Container(
                                width: 56,
                                height: 6,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF41B631),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text(
                            'Shift Left',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0x661C293E),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Text(
                            '12:24',
                            style: TextStyle(
                                fontSize: 26,
                                color: Color(0xFF1C293E),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 16, top: 6),
                          child: Stack(
                            children: [
                              Container(
                                width: 77,
                                height: 6,
                                decoration: BoxDecoration(
                                    color: Color(0xFFE6E8ED),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              Container(
                                width: 20,
                                height: 6,
                                decoration: BoxDecoration(
                                    color: Color(0xFFEE324C),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    color: Colors.white,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text(
                            'Cyrcle Left',
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0x661C293E),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Text(
                            '45:31',
                            style: TextStyle(
                                fontSize: 26,
                                color: Color(0xFF1C293E),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 16, top: 6),
                          child: Stack(
                            children: [
                              Container(
                                width: 77,
                                height: 6,
                                decoration: BoxDecoration(
                                    color: Color(0xFFE6E8ED),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              Container(
                                width: 38,
                                height: 6,
                                decoration: BoxDecoration(
                                    color: Color(0xFFFBCA00),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: Color(0xFF41B631),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Current Status',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'Driving',
                              style: TextStyle(
                                  fontSize: 36,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.white,
                          child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 22),
                              child: SvgPicture.asset(
                                  'assets/images/bottom_green.svg')),
                        )
                      ],
                    ),
                  )),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: logbookList.length,
                itemBuilder: (context, index) {
                  Logbook logbook = logbookList[index];
                  double bottomMargin = 16.0;
                  if (index != logbookList.length - 1) {
                    bottomMargin = 0.0;
                  }
                  return Card(
                    elevation: 0,
                    margin: EdgeInsets.only(top: 16, bottom: bottomMargin),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                if(logbook.date != null)
                                Text(
                                  logbook.date!,
                                  style: TextStyle(
                                      color: Color(0xFF1C293E),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ) ,
                                if (logbook.signed)
                                  Container(
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 6),
                                        child: Text('Signed')),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFE8F1FE),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )
                                else
                                  Container(
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 6),
                                        child: Text('Not Signed')),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFE9EAEC),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SvgPicture.asset('assets/images/graph.svg'),
                            const SizedBox(
                              height: 20,
                            ),
                              if(logbook.isViolation)
                              Row(
                                children: <Widget>[
                                  Text(
                                    '6 violations',
                                    style: TextStyle(
                                        color: Color(0xFF1C293E),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  SvgPicture.asset('assets/images/bottom_blue.svg')
                                ],
                              ),
                          ]),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
