import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yoga/app/app.locator.dart';
import 'package:yoga/app/app.router.dart';
import 'package:yoga/exceptions/firestore_api_exception.dart';
import 'package:yoga/ui/auth/base/authentication_viewmodel.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

import 'login_view.form.dart';

class LoginViewModel extends AuthenticationViewModel {
  final FirebaseAuthenticationService? _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();
  String pass = "admin";
  String animationType = "idle";
  bool isEmailValid = true, passenable = true, isPasswordValid = true;
  String otp = '', verificationId = '';
  LoginViewModel() : super(successRoute: Routes.startUpView);
  updatePass(String val) {
    pass = val;
    notifyListeners();
  }

  updateAnimationType(String val) {
    animationType = val;
    notifyListeners();
  }

  late Timer timer;
  int timeout = 120;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (timeout == 0) {
          timer.cancel();
        } else {
          timeout--;
          notifyListeners();
        }
      },
    );
  }

  setOtp(String code) {
    otp = code;
    notifyListeners();
  }

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() =>
      _firebaseAuthenticationService!.loginWithEmail(
        email: 'emailValue!',
        password: 'passwordValue!',
      );

  void setPassEnable(bool bool) {
    passenable = bool;
    notifyListeners();
  }

  void navigateToCreateAccount() {
    navigationService.navigateTo(Routes.createAccountView);
  }

  runOtpVerification() {
    FirebaseAuth auth = FirebaseAuth.instance;
    final smsCode = otp;
    final _credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    auth.signInWithCredential(_credential).then((UserCredential result) async {
      await handleAuthenticationResponse(
          FirebaseAuthenticationResult(user: result.user));
      log.v('Auth result is $result');
      navigationService.clearStackAndShow(successRoute);
    }).catchError((e) {
      throw FirestoreApiException(message: '$e');
    });
  }

  runFirebaseLogin(String number, BuildContext context) {
    startTimer();
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds: 120),
      verificationCompleted: (AuthCredential authCredential) {
        _auth.signInWithCredential(authCredential).then((result) {
          log.v('Result after signInWithCredential ${result.user}');
          navigationService.clearStackAndShow(Routes.startUpView);
        }).catchError((e) {
          throw FirestoreApiException(message: '$e');
        });
      },
      verificationFailed: (FirebaseAuthException exception) {
        throw FirestoreApiException(message: '$exception');
      },
      codeSent: (String verificationId, [int? forceResendingToken]) {
        log.wtf('message');
        setVerificationId(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        verificationId = verificationId;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Authentication Timed out, Try again!'),
          ),
        );
        navigationService.back();
      },
    );
  }

  void setVerificationId(String id) {
    verificationId = id;
    notifyListeners();
  }
}
