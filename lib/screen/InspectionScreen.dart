import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class InspectionScreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _InspectionScreenState();
// }
//
// class _InspectionScreenState extends State<InspectionScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:trucker/spedometer/GaugeView.dart';

class InspectionScreen extends StatefulWidget {


  @override
  _IncomingPageState createState() => _IncomingPageState();
}

class _IncomingPageState extends State<InspectionScreen> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("sssss"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 400,
              height: 400,
              padding: EdgeInsets.all(10),
              child: GaugeView(
                minSpeed: 0,
                maxSpeed: 100,
                speed: 40,
                animate: true,
                duration: Duration(seconds: 5),
                alertSpeedArray: [40, 80, 90],
                alertColorArray: [Colors.orange, Colors.indigo, Colors.red],
                gaugeWidth: 20,
                fractionDigits: 1,
              ),
            )
          ],
        ),
      ),
    );
  }
    //   SafeArea(
    //   child: Container(
    //     child: Stack(
    //       children:[
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.end,
    //           children: [
    //
    //             Container(
    //               height: size.height/3,
    //               child: Padding(
    //                 padding: EdgeInsets.all(10),
    //                 child: Row(
    //                   children: [
    //                     Container(
    //                         child:_getRadialGauge("Energy",60)),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //
    //           ],
    //         )
    //       ] ,
    //     ),
    //   ),
    // );
  }

  // Widget _getRadialGauge(String Name,double vlaue) {
  //   return Center(
  //     child: SfRadialGauge(
  //         title: GaugeTitle(text: Name, textStyle: const TextStyle( color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18)),
  //         axes: <RadialAxis>[
  //           RadialAxis(startAngle: 160, endAngle: 20,showTicks: false,showLabels: false,
  //               interval: 10, ranges: <GaugeRange>[
  //                 GaugeRange(
  //                     startValue: 0,
  //                     endValue: 100,
  //                     color: Colors.teal[100],
  //                     startWidth: 10,
  //                     endWidth: 10),
  //               ],
  //               pointers: <GaugePointer>[
  //                 NeedlePointer(value: vlaue,
  //                     needleStartWidth: 1, needleEndWidth: 5,
  //                     knobStyle: KnobStyle(knobRadius: 5,
  //                         sizeUnit: GaugeSizeUnit.logicalPixel, color: Colors.black))
  //               ],
  //               annotations: <GaugeAnnotation>[
  //                 GaugeAnnotation(
  //                     widget: Container(
  //                         child: Text(vlaue.toString()+"kWh",
  //                             style: TextStyle( color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18))),
  //                     angle: 90, positionFactor: 0.5)
  //               ])
  //         ]),
  //   );
  // }
// }