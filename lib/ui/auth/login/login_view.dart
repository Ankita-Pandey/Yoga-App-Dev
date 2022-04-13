import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:yoga/ui/shared/ui_helpers.dart';
import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'mobileno'),
])
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                height: screenHeight(context) / 1.1,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 250,
                      child: Lottie.network(
                        'https://assets2.lottiefiles.com/packages/lf20_oncjxjbd.json',
                      ),
                    ),
                    verticalSpaceRegular,
                    // Card(
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(20.0),
                    //   ),
                    //   color: const Color.fromRGBO(28, 28, 30, 1),
                    //   child: Container(
                    //     padding: const EdgeInsets.symmetric(
                    //       horizontal: 20,
                    //       vertical: 10,
                    //     ),
                    //     child: Form(
                    //       key: _formKey,
                    //       child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.end,
                    //         children: [
                    //           verticalSpaceSmall,
                    //           TextFormField(
                    //             keyboardType: TextInputType.phone,
                    //             controller: mobilenoController,
                    //             style: const TextStyle(
                    //               color: Colors.white,
                    //             ),
                    //             validator: (String? value) {
                    //               if (value == null || value.isEmpty) {
                    //                 return 'Please enter mobile number';
                    //               }
                    //               if (value.length <= 9) {
                    //                 return 'Please enter valid number';
                    //               }
                    //               if (value.length >= 11) {
                    //                 return 'Please enter less number';
                    //               }
                    //               return null;
                    //             },
                    //             textInputAction: TextInputAction.next,
                    //             decoration: InputDecoration(
                    //               prefix: SizedBox(
                    //                 width: 50,
                    //                 child: Row(
                    //                   mainAxisAlignment: MainAxisAlignment.end,
                    //                   children: const [
                    //                     horizontalSpaceSmall,
                    //                     Text(
                    //                       '+91',
                    //                       style: TextStyle(
                    //                         color: Colors.white,
                    //                       ),
                    //                     ),
                    //                     horizontalSpaceTiny,
                    //                   ],
                    //                 ),
                    //               ),
                    //               enabledBorder: OutlineInputBorder(
                    //                 borderRadius: BorderRadius.circular(25.0),
                    //                 borderSide: const BorderSide(
                    //                   color: Color.fromARGB(255, 191, 90, 242),
                    //                   width: 1.5,
                    //                 ),
                    //               ),
                    //               focusedBorder: OutlineInputBorder(
                    //                 borderRadius: BorderRadius.circular(25.0),
                    //                 borderSide: const BorderSide(
                    //                   color: Color.fromARGB(255, 191, 90, 242),
                    //                   width: 2,
                    //                 ),
                    //               ),
                    //               labelStyle: TextStyle(
                    //                 color: Colors.white.withOpacity(0.8),
                    //               ),
                    //               label: SizedBox(
                    //                 width: 270,
                    //                 child: Row(
                    //                   mainAxisAlignment:
                    //                       MainAxisAlignment.start,
                    //                   children: const [
                    //                     Icon(
                    //                       Icons.phone,
                    //                       color: Colors.white,
                    //                     ),
                    //                     horizontalSpaceRegular,
                    //                     Text('Enter your mobile number'),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             onFieldSubmitted: (value) {
                    //               if (_formKey.currentState!.validate()) {
                    //                 FocusScope.of(context).unfocus();
                    //                 model.setBusy(true);
                    //                 ScaffoldMessenger.of(context).showSnackBar(
                    //                   const SnackBar(
                    //                     content: Text(
                    //                         'Otp has been sent to this mobile number'),
                    //                   ),
                    //                 );
                    //                 model.setBusy(false);
                    //                 model.loginwithMobile(
                    //                     '+91' + mobilenoController.text,
                    //                     context);
                    //               }
                    //             },
                    //           ),
                    //           verticalSpaceRegular,
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // verticalSpaceSmall,
                    GestureDetector(
                      onTap: () {
                        model.useGoogleAuthentication(type: '');
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
                                  'Google  Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
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
