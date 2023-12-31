import 'package:auto_route/auto_route.dart';
import 'package:route_ready/pages/activeJournies.dart/activeJournies_view.dart';
import 'package:route_ready/pages/fine/fine_view.dart';
import 'package:route_ready/pages/main/main_view.dart';
import 'package:route_ready/pages/scanner_detail/scanner_detail_view.dart';
import 'package:route_ready/pages/welcome/welcome_view.dart';

/// Need to run the following command
///    flutter packages pub run build_runner watch --delete-conflicting-outputs

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: [
    MaterialRoute(page: WelcomeView, initial: true),
    MaterialRoute(page: MainView),
    MaterialRoute(page: ScannerDetailView),
    MaterialRoute(page: FineView),
    MaterialRoute(page: ActiveJourneysView),
  ],
)
class $AppRouter {}
