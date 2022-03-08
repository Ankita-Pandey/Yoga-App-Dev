import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:yoga/app/app.router.dart';
import 'package:yoga/services/push_notification_service.dart';
import 'package:yoga/ui/BottomSheetUi/setup_bottom_sheet_ui.dart';
import 'app/app.locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  setPathUrlStrategy();
  setupBottomSheetUi();
  final _pushNotification = locator<PushNotificationService>();
  _pushNotification.initializePushNotificationService();
  runApp(
    VxState(
      store: MyStore(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        primaryColor: Colors.black,
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}

class MyStore extends VxStore {
  Map<String, dynamic> data = {};
}

class Increment extends VxMutation<MyStore> {
  final Map<String, dynamic> data;

  Increment(this.data);
  @override
  perform() {
    store!.data.addAll(data);
  }
}
