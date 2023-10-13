import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:route_ready/components/round_button.dart';
import 'package:route_ready/consts.dart';
import 'package:route_ready/pages/fine/locationCalculator.dart';
import 'package:route_ready/pages/models/ActiveJourney.dart';
import 'package:route_ready/pages/models/JourneySummary.dart';
import 'package:route_ready/routes/routes.gr.dart';

  getAllRecipes() {
    return FirebaseFirestore.instance.collection(FIRESTORE_ACTIVE_JOURNEY_COLLECTION_NAME).snapshots();
  }

  Future<void> getJourneyByUserId({required String userId, required BuildContext context}) async {
    try {
      QuerySnapshot usersQuery = await FirebaseFirestore.instance
          .collection(FIRESTORE_ACTIVE_JOURNEY_COLLECTION_NAME)
          .where('userId', isEqualTo: userId)
          .get();

      if (usersQuery.docs.isNotEmpty) {
        // Iterate through the results to access the data of matching documents
        usersQuery.docs.forEach((userDoc) {
          ActiveJourneyModel activeJourneyModel = ActiveJourneyModel(
            userId: userDoc.get('userId'), 
            longitude: userDoc.get('longitude'), 
            latitude: userDoc.get('latitude'), 
            startTime: userDoc.get('startTime').toDate() as DateTime,
          );
          double distance = calculateDistance(
            Location(
              latitude: activeJourneyModel.latitude.toDouble(), 
              longitude: activeJourneyModel.longitude.toDouble()
            ), 
            Location(
              latitude: 4.6785, 
              longitude: 80.2346
            )
          );
          num price = priceCalculatorForDistance(distance: distance);
          // addSummaryJourneyData(userId: userId, latitude: 4.6785, longitude: 80.2346, price: price, activeJourney: activeJourneyModel);
          context.router.push(ScannerDetailRoute(
            journeyDta: activeJourneyModel,
            eLatitude: 4.6785,
            eLongitude: 80.2346,
            price: price,
            userId: userId,
          ));
        });
      } else {
        print("No Active Journey with userId $userId found");
        showDialog(
          context: context, 
          builder: (BuildContext context){
            return AlertDialog(
              title: const Text("No Active Journey",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              content: Text(
                "First Start the journey or if the user haven't scanned the QR in onboard.manually calculate",
              ),
              actions: [
                RoundButton(
                  text: "Close",
                  onPressed: () => context.popRoute(),
                ),
                RoundButton(
                  text: "Manual Calculation",
                  btnWidth: 200,
                  onPressed: () => context.router.push(const FineRoute()),
                ),
              ],
            );
          }
        );
      }
    } catch (e) {
      print("Error fetching journey data: $e");
    }
  }


  addActiveJourneyData({required String userId, required num latitude, required num longitude, required DateTime startTime}) async {
    ActiveJourneyModel activeJourneyModel = ActiveJourneyModel(userId: userId, longitude: longitude, latitude: latitude, startTime: startTime);
    try{
      FirebaseFirestore.instance.runTransaction(
         (Transaction transaction) async {
            await FirebaseFirestore.instance.collection(FIRESTORE_ACTIVE_JOURNEY_COLLECTION_NAME).doc().set(activeJourneyModel.toJson());
         }
      );
      Fluttertoast.showToast(
                    msg: "Journey Started",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: const Color.fromARGB(255, 25, 183, 10),
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
    }catch(e){
      print(e.toString());
    }
  }

  addSummaryJourneyData({required String userId, required num latitude, required num longitude, required num price, required ActiveJourneyModel activeJourney}) async {
    // ActiveJourneyModel activeJourneyModel = ActiveJourneyModel(userId: activeJourney, longitude: longitude, latitude: latitude, startTime: startTime)
    JourneySummaryModel journeySummaryModel = JourneySummaryModel(userId: userId, eLongitude: longitude, eLatitude: latitude, price: price, activeJourney: activeJourney, endTime: DateTime.now());
    try{
      FirebaseFirestore.instance.runTransaction(
         (Transaction transaction) async {
            await FirebaseFirestore.instance.collection(FIRESTORE_SUMMARY_JOURNEY_COLLECTION_NAME).doc().set(journeySummaryModel.toJson());
         }
      );
    }catch(e){
      print(e.toString());
    }
  }

  // updateRecipe(Recipe recipe, String title, String description, String ingredients){
  //   try{
  //     FirebaseFirestore.instance.runTransaction((transaction) async {
  //       await transaction.update(recipe.documentReference, {'title': title, 'description': description, 'ingredients': ingredients});
  //     });
  //   }catch(e){
  //     print(e.toString());
  //   }
  // }

  // updateIfEditing(){
  //   if(isEditing){
  //     updateRecipe(currentRecipe, titleController.text, descriptionController.text, ingredientsController.text);
  //     setState(() {
  //       isEditing = false;
  //     });
  //   }
  // }

  deleteActiveJourney({required String userId}) async {
    // FirebaseFirestore.instance.runTransaction(
    //   (Transaction transaction) async {
    //     await transaction.delete(activeJourneyModel.documentReference);
    //   }
    // );

    QuerySnapshot journeyQuery = await FirebaseFirestore.instance
        .collection(FIRESTORE_ACTIVE_JOURNEY_COLLECTION_NAME)
        .where('userId', isEqualTo: userId)
        .get();
    if (journeyQuery.docs.isNotEmpty) {
      // Iterate through the results to delete matching documents
      journeyQuery.docs.forEach((userDoc) {
        userDoc.reference.delete();
      });
    } else {
      print("No journey with userId $userId found to delete.");
    }    
  }

  bool qrValidity({required String qrData, required BuildContext context, bool isEndOfJourney = false}){
    List<String> qrDataList = qrData.split(": ");
    if(qrDataList[0] == "ID"){
      isEndOfJourney
        ? endJourney(endLat: 4.5672, endLon: 80.3453, userId: qrDataList[1], context: context)
        : addActiveJourneyData(userId: qrDataList[1], latitude: 4.2342, longitude: 79.4521, startTime: DateTime.now());
      return true;
    }else{
      showDialog(
        context: context, 
        builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Invalid QR Code",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            content: const Text(
              "The QR code you scanned is invalid",
            ),
            actions: [
              RoundButton(
                text: "Close",
                onPressed: () => context.popRoute(),
              )
            ],
          );
        }
      );
      return false;
    }
  }

  endJourney({required num endLat, required num endLon, required String userId, required BuildContext context}){
    getJourneyByUserId(userId: userId, context: context);
  }
