import 'package:flutter/material.dart';
import 'package:route_ready/consts.dart';
PreferredSizeWidget appBarCustom({
  String? title
}){
  return AppBar(
    title: Text(
      title ?? APP_NAME,
    ),
    backgroundColor: DARK_PURPLE,
  );
}