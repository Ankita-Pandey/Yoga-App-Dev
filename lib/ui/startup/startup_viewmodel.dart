import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yoga/api/firestore_api.dart';
import 'package:yoga/app/app.locator.dart';
import 'package:yoga/app/app.logger.dart';
import 'package:yoga/app/app.router.dart';
import 'package:yoga/services/push_notification_service.dart';
import 'package:yoga/services/user_service.dart';
import 'package:yoga/ui/bmiUi/bmiui_view.dart';
import 'package:yoga/ui/dashboard/dashboard_view.dart';

class StartUpViewModel extends BaseViewModel {
  final log = getLogger('StartUpViewModel');
  final userService = locator<UserService>();
  final _navigationService = locator<NavigationService>();
  final firestoreApi = locator<FirestoreApi>();
  final _notifyService = locator<PushNotificationService>();
  String userId = '';
  Future<void> runStartupLogic() async {
    setBusy(true);
    if (userService.hasLoggedInUser) {
      log.v('We have a user session on disk. Sync the user profile ...');
      await userService.syncUserAccount();
      final currentUser = userService.currentUser;
      if (currentUser == null) {
        log.v('No user on disk, navigate to the LoginView');
        setBusy(false);
        _navigationService.replaceWith(Routes.loginView);
      } else {
        if (!currentUser.onBoarding!) {
          log.v('New user');
          setBusy(false);
          if (currentUser.onBoard == false) {
            _navigationService.clearTillFirstAndShowView(BmiUiView());
          } else {
            _navigationService.clearTillFirstAndShowView(DashboardView());
          }
        } else {
          userId = currentUser.id;
          log.v('User sync complete. User profile');
          if (userService.currentUser!.pushToken != _notifyService.pushToken) {
            firestoreApi.updateUser(
              data: {
                'pushToken': _notifyService.pushToken,
              },
              user: userService.currentUser!.id,
            );
          }
          if (!userService.currentUser!.onBoarding!) {
            print('user arrived');
          }
          setBusy(false);
        }
      }
    } else {
      log.v('No user on disk, navigate to the LoginView');
      setBusy(false);
      _navigationService.replaceWith(Routes.loginView);
    }
  }

  Future<void> logout() async {
    await userService.logout;
    log.v('Successfully Loggeg out');
    runStartupLogic();
  }
}
