import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:route_ready/consts.dart';

class JourneyItem extends HookWidget {
  const JourneyItem({
    Key? key, 
    required this.journeyId,
    required this.startAt,
    required this.startTime,
    required this.passengerId,
  }) : super(key: key);
  final String journeyId;
  final String startAt;
  final String startTime;
  final String passengerId;

  @override
  Widget build(BuildContext context) {      
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: DARK_PURPLE, width: 1.5),
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Column(
        children: [
          JourneyItemRow(text: journeyId, label: "Journey ID"),
          JourneyItemRow(text: passengerId, label: "Passenger ID"),
          JourneyItemRow(text: startAt, label: "Starts At"),
          JourneyItemRow(text: startTime, label: "Start Time"),
        ],
      ),
    );
    
  }
}

class JourneyItemRow extends HookWidget {
  const JourneyItemRow({
    Key? key, 
    required this.text,
    required this.label,
  }) : super(key: key);
  final String text;
  final String label;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: width/5*1.5,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          width: width/5*2.5,
          child: Text(
            text,
          ),
        )
      ],
    ); 
  }
}
