import 'package:cloud_firestore/cloud_firestore.dart';

class ActiveJourneyModel {
  late String userId;
  late num longitude;
  late num latitude;
  late DateTime startTime;

  late DocumentReference documentReference;

  ActiveJourneyModel({required this.userId, required this.longitude, required this.latitude, required this.startTime});

  ActiveJourneyModel.fromMap(Map<String, dynamic> map, {required this.documentReference}){
    userId = map["userId"];
    longitude = map["longitude"];
    latitude = map["latitude"];
    startTime = map["startTime"];
  }

  ActiveJourneyModel.fromSnapshot(DocumentSnapshot snapshot)
      :this.fromMap(
      snapshot.data() as Map<String, dynamic>,
      documentReference: snapshot.reference
  );

  toJson(){
    return {'userId': userId, 'longitude': longitude, 'latitude': latitude, 'startTime': startTime};
  }
}