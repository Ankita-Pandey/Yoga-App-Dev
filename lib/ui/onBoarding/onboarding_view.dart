import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yoga/ui/onBoarding/onboarding_viewmodel.dart';
import 'package:yoga/ui/shared/ui_helpers.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnBoardingViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  verticalSpaceRegular,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => model.navigateToLogin(),
                        child: Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(28, 28, 30, 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              'Already a User?',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  verticalSpaceRegular,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Yogiction',
                        style: TextStyle(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceLarge,
                  const SelectionCard(
                    text1: 'Home Coach Guidance',
                    text2: 'Diet Plans',
                  ),
                  verticalSpaceRegular,
                  const SelectionCard(
                    text1: 'Naturopath Physician',
                    text2: 'Ayurvedic Therapist',
                  ),
                  verticalSpaceRegular,
                  const SelectionCard(
                    text1: 'Count Calories',
                    text2: 'Home Workout',
                  ),
                  // Container(
                  //   height: 120,
                  //   width: screenWidth(context) / 2.4,
                  //   decoration: BoxDecoration(
                  //     color: Colors.black,
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: Card(
                  //     elevation: 5,
                  //     color: Colors.black,
                  //     shadowColor: Colors.white.withOpacity(0.3),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => OnBoardingViewModel(),
    );
  }
}

class SelectionCard extends StatefulWidget {
  const SelectionCard({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);
  final String text1;

  final String text2;
  @override
  State<SelectionCard> createState() => _SelectionCardState();
}

class _SelectionCardState extends State<SelectionCard> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isSelected1 = !isSelected1;
            });
          },
          child: Container(
            height: 120,
            width: screenWidth(context) / 2.3,
            decoration: BoxDecoration(
              // color: const Color.fromRGBO(28, 28, 30, 1),
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  isSelected1
                      ? Color.fromARGB(255, 191, 90, 242)
                      : Color.fromRGBO(28, 28, 30, 1),
                  isSelected1
                      ? Color.fromARGB(255, 94, 92, 230)
                      : Color.fromRGBO(28, 28, 30, 1),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.text1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.7,
                  ),
                ),
                verticalSpaceSmall,
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              isSelected2 = !isSelected2;
            });
          },
          child: Container(
            height: 120,
            width: screenWidth(context) / 2.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  isSelected2
                      ? Color.fromARGB(255, 191, 90, 242)
                      : Color.fromRGBO(28, 28, 30, 1),
                  isSelected2
                      ? Color.fromARGB(255, 94, 92, 230)
                      : Color.fromRGBO(28, 28, 30, 1),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.text2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.7,
                  ),
                ),
                verticalSpaceSmall,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
