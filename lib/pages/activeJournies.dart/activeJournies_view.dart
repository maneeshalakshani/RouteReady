import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:route_ready/components/appBarCustom.dart';
import 'package:route_ready/consts.dart';
import 'package:route_ready/pages/activeJournies.dart/journeyItem.dart';

class ActiveJourneysView extends HookWidget {
  const ActiveJourneysView({
    Key? key, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {   
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final journeyList = [
      {"edfaRDRD6234dfs", "Colombo", "10:30 AM", "wejOIIW23423"},
      {"HRDvafref9005ed", "Matara", "8:30 AM", "wejOIIW23423"},
      {"FSFQsefwe232hss", "Kandy", "5:00 PM", "wejOIIW23423"},
      {"OKPWddefwefaewf", "Galle", "10:30 AM", "wejOIIW23423"},
      {"wesfwe65aeevrev", "Gampaha", "10:30 PM", "wejOIIW23423"},
      {"TRHhgfhef372637", "Kaluthara", "10:00 AM", "wejOIIW23423"},
      {"afefDJYT873hghh", "Jaffna", "11:30 AM", "wejOIIW23423"},
    ];

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
                Container(
                  width: width,
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  padding: const EdgeInsets.only(top: 10),
                  height: height/10* 7.5,
                  child: ListView.separated(
                    itemCount: 5,
                    itemBuilder: (context, i){
                      return JourneyItem(
                        startAt: journeyList[i].elementAt(1),
                        journeyId: journeyList[i].elementAt(0),
                        startTime: journeyList[i].elementAt(2),
                        passengerId: journeyList[i].elementAt(3),
                      );
                    },
                    separatorBuilder: (context, i){
                      return const Divider();
                    },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
