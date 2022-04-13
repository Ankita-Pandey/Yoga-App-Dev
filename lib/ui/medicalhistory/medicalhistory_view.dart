import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yoga/ui/bmiUi/bmiui_viewmodel.dart';
import 'package:yoga/ui/medicalhistory/medicalhistory_viewmodel.dart';
import 'package:yoga/ui/shared/ui_helpers.dart';

class MedicalHistoryView extends StatefulWidget {
  final String bmi;
  MedicalHistoryView({Key? key, required this.bmi}) : super(key: key);

  @override
  State<MedicalHistoryView> createState() => _MedicalHistoryViewState();
}

class _MedicalHistoryViewState extends State<MedicalHistoryView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MedicalHistoryViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        // appBar: AppBar(
        //   iconTheme: IconThemeData(
        //     color: Colors.white,
        //   ),
        //   title: Text('BMI Calculator',style: TextStyle(color: Colors.white),),
        //   backgroundColor: Colors.black,
        // ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            color: Colors.black,
            child: ListView(
              children: [
                verticalSpaceRegular,
                verticalSpaceRegular,
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Your bmi is:',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        widget.bmi,
                        style: const TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpaceMedium,
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'Lets enter',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'medical history',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpaceMedium,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter age number';
                      }
                      if (value.length >= 11) {
                        return 'Please enter less number';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
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
                          width: 3,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                      ),
                      label: Text('Enter your medical history'),
                    ),
                    onTap: () {
                      print('object');
                    },
                    onChanged: (value) {
                      model.setText(value);
                    },
                    onFieldSubmitted: (value) {
                      model.setText(value);
                      model.submitText();
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                ),
                verticalSpaceRegular,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      // model.setBusy(true);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Calculating BmI'),
                        ),
                      );
                      model.setBusy(false);
                      model.setText(model.text);
                      model.submitText();
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
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => MedicalHistoryViewModel(),
    );
  }
}
