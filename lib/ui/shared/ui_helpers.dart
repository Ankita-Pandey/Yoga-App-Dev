// Horizontal Spacing
import 'package:flutter/material.dart';
import 'package:yoga/app/router_names.dart';
import 'package:yoga/ui/shared/constants.dart';
import 'package:yoga/ui/shared/styles.dart';

const Widget horizontalSpaceTiny = SizedBox(width: 5.0);
const Widget horizontalSpaceSmall = SizedBox(width: 10.0);
const Widget horizontalSpaceRegular = SizedBox(width: 18.0);
const Widget horizontalSpaceMedium = SizedBox(width: 25.0);
const Widget horizontalSpaceLarge = SizedBox(width: 50.0);

const Widget verticalSpaceTiny = SizedBox(height: 5.0);
const Widget verticalSpaceSmall = SizedBox(height: 10.0);
const Widget verticalSpaceRegular = SizedBox(height: 18.0);
const Widget verticalSpaceMedium = SizedBox(height: 25.0);
const Widget verticalSpaceLarge = SizedBox(height: 50.0);

// Screen Size helpers

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;

Widget termsCondition(BuildContext context) {
  return Center(
    child: SizedBox(
      width: screenWidth(context) / 1.2,
      child: const Text(
        'By continuing, You confirm that I have read & agree to the Terms & conditions and Privacy policy',
      ),
    ),
  );
}

class ListFormTile extends StatelessWidget {
  final String text, btnText;
  final Function() onTapped;
  final bool isBusy;
  const ListFormTile({
    Key? key,
    required this.text,
    required this.btnText,
    required this.onTapped,
    required this.isBusy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: screenWidth(context) / 2,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      title: ElevatedButton(
        onPressed: onTapped,
        child: isBusy
            ? Row(
                children: [
                  Image.asset(
                    Assets.doneimg,
                    fit: BoxFit.scaleDown,
                    height: 20,
                    width: 30,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('Selected'),
                ],
              )
            : Text(btnText),
      ),
    );
  }
}

AppBar logoAppBar() {
  return AppBar(
    backgroundColor: appbg,
    title: SizedBox(
      height: 50,
      child: Image.asset(
        Assets.firebase,
        fit: BoxFit.scaleDown,
      ),
    ),
    centerTitle: true,
  );
}

class RidersCard extends StatelessWidget {
  final int index;
  final String name;
  final String start;
  final String end;
  final String mobileNo;
  final String date;
  final String time;

  const RidersCard({
    Key? key,
    required this.index,
    required this.name,
    required this.start,
    required this.date,
    required this.time,
    required this.mobileNo,
    required this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          children: [
            verticalSpaceSmall,
            Text(
              'Click to view Rider ${index + 1} on map',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            verticalSpaceTiny,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Name:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            verticalSpaceTiny,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mobile No:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  mobileNo,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            verticalSpaceTiny,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Time:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            verticalSpaceTiny,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Date:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            verticalSpaceTiny,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Start:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(1),
                  width: 150,
                  height: 50,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      start,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpaceTiny,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'End:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  padding: const EdgeInsets.all(1),
                  width: 150,
                  height: 50,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      end,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpaceSmall,
          ],
        ),
      ),
    );
  }
}

class NotAvailable extends StatelessWidget {
  const NotAvailable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text(
            'No ride available Now!',
            style: TextStyle(fontSize: 18),
          ),
        ),
        // Center(
        //   child: Text(
        //     'Start your booking now!',
        //     style: TextStyle(fontSize: 18),
        //   ),
        // ),
      ],
    );
  }
}

class PendingButton extends StatelessWidget {
  final bool busy;
  final void Function() onButtonTapped;

  const PendingButton({
    Key? key,
    required this.busy,
    required this.onButtonTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onButtonTapped,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red[400]),
          ),
          child: busy
              ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )
              : const Text(
                  'Pending',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
        ),
        const Text(
          '(click above to pay)',
          style: TextStyle(
              color: Colors.black, fontSize: 12, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}

class SuccessButton extends StatelessWidget {
  final void Function() onButtonTapped;

  const SuccessButton({
    Key? key,
    required this.onButtonTapped,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onButtonTapped,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.amber),
      ),
      child: Row(
        children: [
          Image.asset(
            Assets.doneimg,
            fit: BoxFit.scaleDown,
            height: 20,
            width: 30,
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            'Paid',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

class StartLocationLabel extends StatelessWidget {
  final String startLocation;
  final void Function() onMainButtonTapped;

  final String paymentStatus;
  const StartLocationLabel({
    Key? key,
    required this.startLocation,
    required this.paymentStatus,
    required this.onMainButtonTapped,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        paymentStatus == pending
            ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        var baseDialog = BaseAlertDialog(
                            title: "Are you sure?",
                            yesOnPressed: onMainButtonTapped,
                            noOnPressed: () {
                              Navigator.of(context).pop();
                            },
                            yes: "Continue",
                            no: "Cancel");
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => baseDialog);
                      },
                      child: const Icon(Icons.cancel)),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              )
            : const SizedBox(),
        verticalSpaceSmall,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            horizontalSpaceMedium,
            const Text(
              'From:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            horizontalSpaceSmall,
            SizedBox(
              width: screenWidth(context) / 2,
              child: Text(
                startLocation,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class EndLocationLabel extends StatelessWidget {
  final String destination;

  const EndLocationLabel({
    Key? key,
    required this.destination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        horizontalSpaceMedium,
        const Text(
          'To:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        horizontalSpaceSmall,
        SizedBox(
          width: screenWidth(context) / 2,
          child: Text(
            destination,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}

class DateLabel extends StatelessWidget {
  final String scheduledDate;

  const DateLabel({Key? key, required this.scheduledDate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalSpaceMedium,
        const Text(
          'Date:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        horizontalSpaceMedium,
        Text(
          scheduledDate,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

class TimeLabel extends StatelessWidget {
  final String scheduleTime;

  const TimeLabel({Key? key, required this.scheduleTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalSpaceMedium,
        const Text(
          'Time:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        horizontalSpaceMedium,
        Text(
          scheduleTime,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

loadingButton() {
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(Colors.white),
  );
}

class LoadingScrren extends StatelessWidget {
  const LoadingScrren({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

class PaymentStatusLabel extends StatelessWidget {
  final bool busy;
  final void Function() onButtonTapped;
  final String paymentStatus;

  const PaymentStatusLabel({
    Key? key,
    required this.busy,
    required this.onButtonTapped,
    required this.paymentStatus,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        horizontalSpaceMedium,
        const Text(
          'Payment status:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        horizontalSpaceMedium,
        paymentStatus == pending
            ? PendingButton(
                busy: busy,
                onButtonTapped: onButtonTapped,
              )
            : SuccessButton(onButtonTapped: () {}),
      ],
    );
  }
}

@immutable
// ignore: must_be_immutable
class BaseAlertDialog extends StatelessWidget {
  final String _title = '';
  String? _yes;
  String? _no;
  Function? _yesOnPressed;
  Function? _noOnPressed;

  BaseAlertDialog(
      {Key? key,
      required String title,
      String? content,
      required Function yesOnPressed,
      required Function noOnPressed,
      String yes = "Yes",
      String no = "No"})
      : super(key: key) {
    _yesOnPressed = yesOnPressed;
    _noOnPressed = noOnPressed;
    _yes = yes;
    _no = no;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_title),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      actions: <Widget>[
        TextButton(
          child: Text(_yes!),
          onPressed: () {
            _yesOnPressed!();
          },
        ),
        TextButton(
          child: Text(
            _no!,
            style: const TextStyle(
              color: Colors.redAccent,
            ),
          ),
          onPressed: () {
            _noOnPressed!();
          },
        ),
      ],
    );
  }
}
