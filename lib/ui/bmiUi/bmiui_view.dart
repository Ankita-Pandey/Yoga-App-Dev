import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:stacked/stacked.dart';
import 'package:yoga/ui/bmiUi/bmiui_viewmodel.dart';
import 'package:yoga/ui/shared/ui_helpers.dart';

class BmiUiView extends StatelessWidget {
  BmiUiView({Key? key}) : super(key: key);
  List<String> programmingList = [
    "Fluuter Tutorial",
    "Java",
    "PHP",
    "C++",
    "C"
  ];
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BmiUiViewModel>.reactive(
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
                        'Lets calculate',
                        style: TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'your BMI',
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
                    keyboardType: TextInputType.number,
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
                          width: 3,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                      ),
                      label: Text('Enter your age'),
                    ),
                    onTap: () {
                      print('object');
                    },
                    onChanged: (value) {
                      print(value);
                      var myDouble = double.parse(value);
                      assert(myDouble is double);
                      print(myDouble);
                      model.setAge(myDouble);
                    },
                    onFieldSubmitted: (value) {
                      print(value);
                      var myDouble = double.parse(value);
                      assert(myDouble is double);
                      print(myDouble);
                      model.setAge(myDouble);
                    },
                  ),
                ),
                verticalSpaceRegular,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter weight number';
                      }
                      if (value.length >= 11) {
                        return 'Please enter less number';
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
                          width: 3,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                      ),
                      label: const Text('Enter your weight in KG'),
                    ),
                    onTap: () {
                      print('object');
                    },
                    onChanged: (String value) {
                      print(value);
                      var myDouble = double.parse(value);
                      assert(myDouble is double);
                      print(myDouble);
                      model.setWeight(myDouble);
                    },
                    onFieldSubmitted: (value) {
                      print(value);
                      var myDouble = double.parse(value);
                      assert(myDouble is double);
                      print(myDouble);
                      model.setWeight(myDouble);
                    },
                  ),
                ),
                verticalSpaceRegular,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter height in centimeter';
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
                      label: Text('Enter your height in cms'),
                    ),
                    onTap: () {
                      print('object');
                    },
                    onChanged: (String value) {
                      var myDouble = double.parse(value);
                      assert(myDouble is double);
                      print(myDouble);
                      model.setHeight(myDouble);
                    },
                    onFieldSubmitted: (value) {
                      var myDouble = double.parse(value);
                      assert(myDouble is double);
                      print(myDouble);
                      model.setHeight(myDouble);
                      model.calculateBmi();
                    },
                  ),
                ),
                verticalSpaceMedium,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      model.setBusy(true);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Calculating BmI'),
                        ),
                      );
                      model.setBusy(false);
                      model.calculateBmi();
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
      viewModelBuilder: () => BmiUiViewModel(),
    );
  }
}

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}
