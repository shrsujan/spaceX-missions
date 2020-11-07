import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:spaceX/routes.dart';
import 'package:spaceX/constants/api.dart';
import 'package:spaceX/services/api_service.dart';
import 'package:spaceX/repositories/launch.repository.dart';
import 'package:spaceX/services/data_cache.service.dart';

void main() async {
  // required for using SharedPreferences
  WidgetsFlutterBinding.ensureInitialized();

  // set default format for date
  Intl.defaultLocale = 'en_GB';
  await initializeDateFormatting();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(MyApp(
    sharedPreferences: sharedPreferences,
  ));
}

class MyApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  const MyApp({Key key, this.sharedPreferences}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<LaunchRepository>(
      create: (_) => LaunchRepository(
        apiService: APIService(API()),
        dataCacheService: DataCacheService(
          sharedPreferences: sharedPreferences,
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SpaceX Launch Tracker',
        theme: ThemeData.dark().copyWith(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
