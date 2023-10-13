import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:route_ready/pages/scanner_detail/detail_container.dart';

class DetailContainerRow extends HookWidget {
  const DetailContainerRow({
    Key? key, 
    required this.text,
    required this.label,
    this.marginTop = 20.0,
    this.textColor,
  }) : super(key: key);
  final String label;
  final String text;
  final double marginTop;
  final Color? textColor;


  @override
  Widget build(BuildContext context) {    
    return Container(
      margin: EdgeInsets.only(top: marginTop, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DetailContainer(
            text: label,
            textColor: textColor,
          ),
          Text(
            ":",
            style: TextStyle(
              fontSize: 18.0,
              color: textColor,
            ),
          ),
          DetailContainer(
            text: text,
            textColor: textColor,
            boldData: true,
          ),
        ],
      ),
    );
  }
}
