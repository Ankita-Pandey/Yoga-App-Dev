import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yoga/api/firestore_api.dart';
import 'package:yoga/services/push_notification_service.dart';
import 'package:yoga/services/user_service.dart';
import 'package:yoga/ui/auth/create_account/create_account_view.dart';
import 'package:yoga/ui/auth/login/login_view.dart';
import 'package:yoga/ui/auth/phoneAuth/phone_auth_view.dart';
import 'package:yoga/ui/bmiUi/bmiui_view.dart';
import 'package:yoga/ui/startup/startup_view.dart';

@StackedApp(
  routes: [
    CupertinoRoute(page: StartUpView, initial: true),
    CupertinoRoute(page: CreateAccountView),
    CupertinoRoute(page: PhoneAuthView),
    CupertinoRoute(page: BmiUiView),
    CupertinoRoute(page: LoginView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    Singleton(classType: FirebaseAuthenticationService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: FirestoreApi),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: PushNotificationService),
  ],
  logger: StackedLogger(),
)
class AppSetup {}
