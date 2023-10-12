import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:route_ready/components/round_button.dart';
import 'package:route_ready/consts.dart';
import 'package:route_ready/pages/main/journey_functions.dart';
import 'package:route_ready/pages/models/ActiveJourney.dart';
import 'package:route_ready/pages/scanner_detail/detail_row.dart';
import 'package:route_ready/routes/routes.gr.dart';

class ScannerDetailView extends HookWidget {
  const ScannerDetailView({
    Key? key, 
    required this.journeyDta,
    required this.eLatitude,
    required this.eLongitude,
    required this.price,
    required this.userId,
  }) : super(key: key);
  final ActiveJourneyModel journeyDta;
  final num eLatitude;
  final num eLongitude;
  final num price;
  final String userId;

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
              // const DetailContainerRow(
              //   label: "Passenger Name",
              //   text: "Maneesha Lakshani",
              //   marginTop: 80.0,
              // ),
              DetailContainerRow(
                label: "Passenger ID",
                text: userId,
              ),
              DetailContainerRow(
                label: "Start Destination",
                text: "Lat: ${journeyDta.latitude}, Lon: ${journeyDta.longitude}",
              ),
              DetailContainerRow(
                label: "End Destination",
                text: "Lat: $eLatitude, Lon: $eLongitude",
              ),
              DetailContainerRow(
                label: "Starts At",
                text: "${journeyDta.startTime}",
              ),
              DetailContainerRow(
                label: "Ends At",
                text: "${DateTime.now()}",
              ),
              DetailContainerRow(
                label: "PRICE",
                text: price.toString(),
                textColor: Color.fromARGB(255, 182, 25, 14),
              ),
              RoundButton(
                btnWidth: width,
                text: "Complete Journey", 
                onPressed: (){
                  addSummaryJourneyData(userId: userId, latitude: eLatitude, longitude: eLongitude, price: price, activeJourney: journeyDta);
                  deleteActiveJourney(userId: userId);
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
