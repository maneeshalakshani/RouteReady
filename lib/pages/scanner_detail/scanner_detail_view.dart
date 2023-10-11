import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:route_ready/components/round_button.dart';
import 'package:route_ready/consts.dart';
import 'package:route_ready/pages/scanner_detail/detail_row.dart';
import 'package:route_ready/routes/routes.gr.dart';

class ScannerDetailView extends HookWidget {
  const ScannerDetailView({
    Key? key, 
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: APP_COLOR,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 100, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Journey Summary",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const DetailContainerRow(
                label: "Passenger Name",
                text: "Maneesha Lakshani",
                marginTop: 80.0,
              ),
              const DetailContainerRow(
                label: "Passenger ID",
                text: "GDJDO234",
              ),
              const DetailContainerRow(
                label: "Start Destination",
                text: "Colombo",
              ),
              const DetailContainerRow(
                label: "End Destination",
                text: "Galle",
              ),
              const DetailContainerRow(
                label: "Starts At",
                text: "8:30 AM",
              ),
              const DetailContainerRow(
                label: "Ends At",
                text: "11.30 AM",
              ),
              const DetailContainerRow(
                label: "PRICE",
                text: "LRK 600",
                textColor: Color.fromARGB(255, 182, 25, 14),
              ),
              RoundButton(
                btnWidth: width,
                text: "Complete Journey", 
                onPressed: (){
                  context.router.push(const MainRoute());
                }
              ),
            ],
          ),
        )
      ),
    );
  }
}
