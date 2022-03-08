import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:yoga/ui/auth/phoneAuth/phone_auth_view.form.dart';
import 'package:yoga/ui/auth/phoneAuth/phone_auth_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'mobileNo'),
])
class PhoneAuthView extends StatelessWidget with $PhoneAuthView {
  PhoneAuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhoneAuthViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => PhoneAuthViewModel(),
    );
  }
}
