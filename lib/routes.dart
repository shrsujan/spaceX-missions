import 'package:flutter/material.dart';
import 'package:spaceX/screens/all_launches.screen.dart';
import 'package:spaceX/screens/launch_details.screen.dart';

class Routes {
  static const root = '/';
  static const launchDetails = '/launchDetails';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case root:
        return MaterialPageRoute(
          builder: (context) => AllLaunchesScreen(),
        );

      case launchDetails:
        final LaunchDetailsScreenArgs args = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => LaunchDetailsScreen(launch: args.launch),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => AllLaunchesScreen(),
        );
    }
  }
}
