import 'package:base_app/routes/routes.gr.dart';
import 'package:flutter/material.dart';

final _appRouter = AppRouter();

void main() => runApp(MaterialApp.router(
  //remove debug_banner
  debugShowCheckedModeBanner: false,

  routerDelegate: _appRouter.delegate(),
  routeInformationParser: _appRouter.defaultRouteParser(),
));
