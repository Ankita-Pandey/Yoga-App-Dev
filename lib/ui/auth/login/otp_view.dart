import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:yoga/ui/auth/login/login_viewmodel.dart';
import 'package:yoga/ui/shared/ui_helpers.dart';

class OtpView extends StatelessWidget {
  OtpView({Key? key, required this.mobileno}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final String mobileno;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) {
        model.runFirebaseLogin(mobileno, context);
      },
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: screenHeight(context) / 4,
                    ),
                    SizedBox(
                      height: 250,
                      child: Lottie.network(
                        'https://assets2.lottiefiles.com/packages/lf20_gysrp57x.json',
                      ),
                    ),
                    verticalSpaceRegular,
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: const Color.fromRGBO(28, 28, 30, 1),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              verticalSpaceSmall,
                              TextFormField(
                                onChanged: (value) {
                                  model.setOtp(value);
                                },
                                keyboardType: TextInputType.phone,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your otp';
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 191, 90, 242),
                                      width: 1.5,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 191, 90, 242),
                                      width: 2,
                                    ),
                                  ),
                                  labelStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                  label: const Text('Enter Otp'),
                                ),
                                onFieldSubmitted: (value) {
                                  if (_formKey.currentState!.validate()) {
                                    if (model.otp.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text('Enter otp'),
                                        ),
                                      );
                                    } else {
                                      FocusScope.of(context).unfocus();
                                      model.setBusy(true);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Otp has been sent to this mobile number'),
                                        ),
                                      );

                                      model.runOtpVerification();
                                    }
                                  }
                                },
                              ),
                              verticalSpaceSmall,
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Resend in ${model.timeout}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.amberAccent.shade200,
                                  ),
                                ),
                              ),
                              verticalSpaceRegular,
                            ],
                          ),
                        ),
                      ),
                    ),
                    verticalSpaceSmall,
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          FocusScope.of(context).unfocus();
                          if (model.otp.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Enter otp'),
                              ),
                            );
                          } else {
                            model.setBusy(true);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Otp has been sent to this mobile number'),
                              ),
                            );
                            model.runOtpVerification();
                          }
                        }
                      },
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(255, 191, 90, 242),
                              Color.fromARGB(255, 94, 92, 230),
                            ],
                          ),
                        ),
                        child: Center(
                          child: model.isBusy
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'Submit',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    verticalSpaceLarge,
                  ],
                ),
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
