import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:route_ready/components/appBarCustom.dart';
import 'package:route_ready/consts.dart';
import 'package:route_ready/controllers/journey_functions.dart';
import 'package:route_ready/models/ActiveJourney.dart';
import 'package:route_ready/pages/activeJournies.dart/journeyItem.dart';

class ActiveJourneysView extends HookWidget {
  const ActiveJourneysView({
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
          width: width,
          height: height/10*9,
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              const Text(
                  "Active Journeys",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: getCompletedJourneys(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error ${snapshot.error}');
                    }
                    if (snapshot.hasData) {
                      return buildList(context, snapshot.data?.docs);
                    }
                    return const Text("Loading...");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, List<DocumentSnapshot>? snapshot) {
    return ListView.builder(
      itemCount: snapshot!.length,
      itemBuilder: (context, int index) {
        final journey = ActiveJourneyModel.fromSnapshot(snapshot[index]);
        return JourneyItem(
          journeyId: snapshot[index].id, 
          startAt: 'Lat: ${journey.latitude}, Log: ${journey.longitude}',
          startTime: journey.startTime.toString(), 
          passengerId: journey.userId
        );
      },
    );
  }
}
