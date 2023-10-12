import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:route_ready/pages/fine/fine_state.dart';

class FineSummary extends HookWidget {
  const FineSummary({
    Key? key, 
    required this.store,
  }) : super(key: key);
  final FineStore store;


  @override
  Widget build(BuildContext context) {   
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(
              builder: (context){
                return Text(
                  "Passenger total is LRK ${store.totalPrice}",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 42, 108, 44),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
