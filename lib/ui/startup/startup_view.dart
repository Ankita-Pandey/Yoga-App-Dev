import 'package:flutter/scheduler.dart';
import 'package:yoga/ui/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      onModelReady: (model) async {
        SchedulerBinding.instance?.addPostFrameCallback((timeStamp) async {
          await model.runStartupLogic();
        });
      },
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: model.isBusy
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                )
              : Center(
                  child: ElevatedButton(
                    onPressed: () {
                      model.logout();
                    },
                    child: Text('logout'),
                  ),
                ),
        ),
      ),
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}
