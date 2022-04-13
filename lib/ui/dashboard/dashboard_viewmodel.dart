import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yoga/api/firestore_api.dart';
import 'package:yoga/app/app.locator.dart';
import 'package:yoga/app/app.logger.dart';
import 'package:yoga/app/app.router.dart';
import 'package:yoga/services/user_service.dart';

class DashboardViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final firestoreApi = locator<FirestoreApi>();
  final userService = locator<UserService>();
  final log = getLogger('BmiUiViewModel');

  Future<void> logout() async {
    await userService.logout;
    log.v('Successfully Loggeg out');
    _navigationService.clearStackAndShow(Routes.startUpView);
  }
}
