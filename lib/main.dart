import 'package:flutter/material.dart';
import 'package:route_ready/routes/routes.gr.dart';

final _appRouter = AppRouter();

void main() => runApp(MaterialApp.router(
  //remove debug_banner
  debugShowCheckedModeBanner: false,

  routerDelegate: _appRouter.delegate(),
  routeInformationParser: _appRouter.defaultRouteParser(),
));
