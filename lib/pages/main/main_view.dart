import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:route_ready/components/round_button.dart';
import 'package:route_ready/consts.dart';
import 'package:route_ready/functions.dart';

class MainView extends HookWidget {
  const MainView({
    Key? key, 
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: APP_COLOR,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          height: height,
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
                text: "Scan the QR code", 
                btnWidth: width/2,
                onPressed: ()async {
                  // String? cameraScanResult = await scanner.scan();
                  checkCameraPermission().then((value) async{
                    String? cameraScanResult = await scanner.scan();
                    print("RESULT>>> $cameraScanResult");
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
