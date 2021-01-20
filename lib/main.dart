import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:testapp/app/locator.dart';
import 'package:testapp/app/manager/db_manager.dart';
import 'package:testapp/app/route.gr.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseManager.get.initDb();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.homeView,
      onGenerateRoute: Router(),
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
