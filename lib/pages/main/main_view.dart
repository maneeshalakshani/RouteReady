import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:route_ready/components/appBarCustom.dart';
import 'package:route_ready/components/round_button.dart';
import 'package:route_ready/consts.dart';
import 'package:route_ready/functions.dart';
import 'package:route_ready/pages/main/journey_functions.dart';
import 'package:route_ready/routes/routes.gr.dart';

class MainView extends HookWidget {
  const MainView({
    Key? key, 
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: appBarCustom(),
      backgroundColor: APP_COLOR,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          height: height/10 * 9,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "To scan the customer's QR code, click the below button. You should scan the qr code 2 times to calculate the distance(When getting in and getting off)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: DEFAULT_TITLE_SIZE,
                  letterSpacing: 1.0
                ),
              ),
              RoundButton(
                text: "Scan the QR code for Start", 
                btnWidth: width/2* 1.5,
                onPressed: ()async {
                  requestCameraPermission().then((value) async{
                    String? cameraScanResult = await scanner.scan();
                    qrValidity(qrData: cameraScanResult!, context: context);
                    // result ? context.router.push(const ScannerDetailRoute()) : context.popRoute();
                  });
                },
              ),
              RoundButton(
                text: "Scan the QR code for End", 
                btnWidth: width/2 * 1.5,
                onPressed: ()async {
                  requestCameraPermission().then((value) async{
                    String? cameraScanResult = await scanner.scan();
                    qrValidity(qrData: cameraScanResult!, context: context, isEndOfJourney: true);
                    // result ? context.router.push(const ScannerDetailRoute()) : context.popRoute();
                  });
                },
              ),
              RoundButton(
                text: "View All Active Journeys", 
                btnWidth: width/2 * 1.5,
                onPressed: ()async {
                  context.router.push(const ActiveJourneysRoute());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
