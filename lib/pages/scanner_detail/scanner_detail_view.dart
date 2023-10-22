import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:route_ready/components/appBarCustom.dart';
import 'package:route_ready/components/round_button.dart';
import 'package:route_ready/consts.dart';
import 'package:route_ready/controllers/journey_functions.dart';
import 'package:route_ready/models/ActiveJourney.dart';
import 'package:route_ready/pages/scanner_detail/detail_row.dart';

class ScannerDetailView extends HookWidget {
  const ScannerDetailView({
    Key? key, 
    required this.journeyDta,
    required this.documentSnapshot,
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
  final DocumentSnapshot documentSnapshot;

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: appBarCustom(),
      backgroundColor: APP_COLOR,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50, left: 30, right: 30),
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
                text: "Lat: ${journeyDta.latitude}\nLon: ${journeyDta.longitude}",
              ),
              DetailContainerRow(
                label: "End Destination",
                text: "Lat: $eLatitude\nLon: $eLongitude",
              ),
              DetailContainerRow(
                label: "Starts At",
                text: "${journeyDta.startTime}",
              ),
              DetailContainerRow(
                label: "Ends At",
                text: "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}\n${DateTime.now().hour} : ${DateTime.now().minute} ${DateTime.now().hour > 12 ? 'PM' : 'AM'}",
              ),
              DetailContainerRow(
                label: "PRICE",
                text: "LRK ${price.toString()}.00",
                textColor: Color.fromARGB(255, 182, 25, 14),
              ),
              RoundButton(
                btnWidth: width,
                text: "Complete Journey", 
                onPressed: (){
                  // addSummaryJourneyData(userId: userId, latitude: eLatitude, longitude: eLongitude, price: price, activeJourney: journeyDta);
                  // deleteActiveJourney(userId: userId);
                  completeJourney(activeJourneyModel: ActiveJourneyModel.fromSnapshot(documentSnapshot), context: context);
                }
              ),
            ],
          ),
        )
      ),
    );
  }
}
