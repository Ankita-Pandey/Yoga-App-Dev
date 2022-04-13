import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yoga/api/firestore_api.dart';
import 'package:yoga/app/app.locator.dart';
import 'package:yoga/app/app.logger.dart';
import 'package:yoga/app/app.router.dart';
import 'package:yoga/services/user_service.dart';
import 'package:yoga/ui/medicalhistory/medicalhistory_view.dart';

class BmiUiViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final firestoreApi = locator<FirestoreApi>();
  final userService = locator<UserService>();
  final log = getLogger('BmiUiViewModel');
  double weight = 0.0;
  double age = 0.0;
  double height = 0.0;
  String mbitype = '';

  setWeight(double val) {
    weight = val;
    notifyListeners();
  }

  setAge(double val) {
    age = val;
    notifyListeners();
  }

  setHeight(double val) {
    height = val;
    notifyListeners();
  }

  void startAnimation(ScrollController controller) {
    // when using more than one animation, use async/await
    Future.delayed(const Duration(milliseconds: 5000), () async {
      await controller.animateTo(controller.position.maxScrollExtent,
          duration: Duration(milliseconds: 8000), curve: Curves.linear);

      await controller.animateTo(controller.position.minScrollExtent,
          duration: Duration(milliseconds: 1250),
          curve: Curves.fastLinearToSlowEaseIn);
    });
  }

  void calculateBmi() {
    log.wtf(height);
    log.wtf(weight);
    log.wtf(age);
    var meterHeight = (height / 100);
    var totalHeight = (meterHeight * meterHeight);
    final bmi = weight / meterHeight;
    log.wtf(totalHeight);
    log.wtf(bmi);
    if (bmi <= 18.5) {
      mbitype = 'under weight';
      notifyListeners();
      savedata();
      return;
    } else if (bmi <= 24.9) {
      mbitype = 'normal weight';
      notifyListeners();
      savedata();
      return;
    } else if (bmi <= 29.9) {
      mbitype = 'pre-obesity';
      notifyListeners();
      savedata();
      return;
    } else if (bmi <= 40) {
      mbitype = 'Obesity';
      notifyListeners();
      savedata();
      return;
    } else if (bmi > 40) {
      mbitype = 'Severly Obesity';
      notifyListeners();
      savedata();
      return;
    } else {
      log.wtf('Enter valid data');
    }
  }

  void savedata() {
    firestoreApi.updateUser(
      data: {
        'bmi': mbitype,
      },
      user: userService.currentUser!.id,
    );
    _navigationService.replaceWithTransition(MedicalHistoryView(
      bmi: mbitype,
    ));
  }
}
