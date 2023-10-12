import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LocationPicker extends HookWidget {
  const LocationPicker({
    Key? key, 
    required this.label,
    required this.onTap,
  }) : super(key: key);
  final String label;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {   
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String startLocation = "pick location";
    // String endLocation = "";

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
                    width: width,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Center(
                      child: Text(
                        startLocation,
                        textAlign: TextAlign.center,
                        style: const TextStyle(),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
