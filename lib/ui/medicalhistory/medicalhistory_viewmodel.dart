import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yoga/api/firestore_api.dart';
import 'package:yoga/app/app.locator.dart';
import 'package:yoga/app/app.logger.dart';
import 'package:yoga/services/user_service.dart';
import 'package:yoga/ui/dashboard/dashboard_view.dart';

class MedicalHistoryViewModel extends BaseViewModel {
  String text = '';
  final log = getLogger('MedicalHistoryViewModel');
  final _navigationService = locator<NavigationService>();
  final firestoreApi = locator<FirestoreApi>();
  final userService = locator<UserService>();
  void setText(String val) {
    text = val;
    notifyListeners();
  }

  void submitText() async {
    firestoreApi.updateUser(
      data: {
        'medical': text,
        'onBoard': true,
      },
      user: userService.currentUser!.id,
    );
    print('updated user');
    _navigationService.clearTillFirstAndShowView(DashboardView());
  }
}
