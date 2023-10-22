import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:route_ready/models/ActiveJourney.dart';

class JourneySummaryModel {
  late String userId;
  late num eLongitude;
  late num eLatitude;
  late num price;
  late ActiveJourneyModel activeJourney;
  late DateTime endTime;

  late DocumentReference documentReference;

  JourneySummaryModel({required this.userId, required this.eLongitude, required this.eLatitude, required this.price, required this.activeJourney, required this.endTime});

  JourneySummaryModel.fromMap(Map<String, dynamic> map, {required this.documentReference}){
    userId = map["userId"];
    eLongitude = map["eLongitude"];
    eLatitude = map["eLatitude"];
    price = map["price"];
    activeJourney = map["activeJourney"];
    endTime = map["endTime"];
  }

  JourneySummaryModel.fromSnapshot(DocumentSnapshot snapshot)
      :this.fromMap(
      snapshot.data() as Map<String, dynamic>,
      documentReference: snapshot.reference
  );

  toJson(){
    return {'userId': userId, 'eLongitude': eLongitude, 'eLatitude': eLatitude, 'price': price, 'activeJourney': activeJourney, 'endTime': endTime,};
  }
}