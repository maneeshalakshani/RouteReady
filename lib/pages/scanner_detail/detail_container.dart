import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DetailContainer extends HookWidget {
  const DetailContainer({
    Key? key, 
    required this.text,
    this.textColor,
  }) : super(key: key);
  final String text;
  final Color? textColor;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    
    return Container(
      width: width/2.5,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18.0,
          color: textColor,
        ),
      ),
    );
  }
}
