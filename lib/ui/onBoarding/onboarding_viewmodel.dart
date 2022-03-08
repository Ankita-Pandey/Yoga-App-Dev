import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yoga/app/app.locator.dart';
import 'package:yoga/app/app.router.dart';

class OnBoardingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  navigateToLogin() {
    _navigationService.navigateTo(Routes.loginView);
  }
}
