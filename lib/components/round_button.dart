import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:route_ready/consts.dart';

class RoundButton extends HookWidget {
  const RoundButton({
    Key? key, 
    required this.text,
    this.btnWidth,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final double? btnWidth;
  final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    
    return Container(
      margin: const EdgeInsets.only(top: 30.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(DARK_PURPLE),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          )
        ),
        child: SizedBox(
          width:  btnWidth ?? width/10 * 2,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: BUTTON_TEXT_SIZE,
            ),
          ),
        ),
      ),
    );
  }
}
