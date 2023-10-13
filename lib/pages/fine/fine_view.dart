import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:route_ready/components/appBarCustom.dart';
import 'package:route_ready/components/round_button.dart';
import 'package:route_ready/consts.dart';
import 'package:route_ready/pages/fine/fine_state.dart';
import 'package:route_ready/pages/fine/fine_summary.dart';
import 'package:route_ready/pages/fine/locationCalculator.dart';
import 'package:route_ready/pages/fine/location_picker.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class FineView extends HookWidget {
  const FineView({
    Key? key, 
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {   
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // String startLocation = "";
    // String endLocation = "";
    Location location1 = Location(latitude: 5.947822, longitude: 80.5482919);; // New York City
    Location location2 = Location(latitude: 6.9388614, longitude: 79.8542005);; 

    FineStore store = FineStore();

    return Scaffold(
      appBar: appBarCustom(),
      backgroundColor: APP_COLOR,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 80, left: 30, right: 30),
          child: Column(
            children: [
              const Text(
                "Fine Summary",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  "Passenger have not scanned the QR code when starting the journey. So the conductor must manually add the details. This process is charging extra LRK $FINE_CHARGE fine charge from the passenger",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 169, 47, 38),
                    fontSize: 18.0,
                  ),
                ),
              ),
              LocationPicker(
                label: "Start Location",
                onTap: (){
                  showDialog(
                    context: context, 
                    builder: (BuildContext context){
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        child: OpenStreetMapSearchAndPick(
                          onPicked: (pickedData){
                            store.setLatLoc1(loc1lat: pickedData.latLong.latitude);
                            store.setLonLoc1(loc1lon: pickedData.latLong.longitude);
                            location1 = Location(latitude: store.loc1lat!, longitude: store.loc1lon!);
                            context.popRoute();
                          },
                          center: LatLong(5, 80),
                          buttonColor: DARK_PURPLE,
                          buttonText: 'Set Current Location',
                        ),
                      );
                    }
                  );
                },
              ),
              LocationPicker(
                label: "End Location",
                onTap: (){
                  showDialog(
                    context: context, 
                    builder: (BuildContext context){
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        child: OpenStreetMapSearchAndPick(
                          onPicked: (pickedData){
                            store.setLatLoc2(loc2lat: pickedData.latLong.latitude);
                            store.setLonLoc2(loc2lon: pickedData.latLong.longitude);
                            location2 = Location(latitude: store.loc2lat!, longitude: store.loc2lon!);
                            context.popRoute();
                          },
                          center: LatLong(23, 89),
                          buttonColor: DARK_PURPLE,
                          buttonText: 'Set Current Location',
                        ),
                      );
                    }
                  );
                },
              ),
              RoundButton(
                text: "Calculate Total",
                btnWidth: width,
                onPressed: (){
                  double distance = calculateDistance(location1, location2);
                  int total = priceCalculatorForDistance(distance: distance, isFineRequired: true);
                  store.setTotalPrice(totalPrice: total);
                  store.setShowSummary(showSummary: true);
                },
              ),
              Observer(
                builder: (context){
                  return store.showSummary ? FineSummary(store: store,) : SizedBox();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
