import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yoga/ui/dashboard/dashboard_viewmodel.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        body: Container(
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                model.logout();
              },
              child: Text('logout'),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => DashboardViewModel(),
    );
  }
}
