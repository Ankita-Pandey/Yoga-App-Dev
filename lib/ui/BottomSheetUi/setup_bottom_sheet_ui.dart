import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yoga/app/app.locator.dart';
import 'package:yoga/app/router_names.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.floating: (context, sheetRequest, completer) =>
        FloatingBoxBottomSheet(request: sheetRequest, completer: completer),
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}

class FloatingBoxBottomSheet extends StatefulWidget {
  final SheetRequest? request;
  final Function(SheetResponse)? completer;

  const FloatingBoxBottomSheet({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  _FloatingBoxBottomSheetState createState() => _FloatingBoxBottomSheetState();
}

class _FloatingBoxBottomSheetState extends State<FloatingBoxBottomSheet> {
  int selectedIndex = 0;
  bool isbusy = false;
  @override
  Widget build(BuildContext context) {
    Future<bool> _onBackPressed() {
      return Future.delayed(const Duration(milliseconds: 200), () {
        return false;
      });
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: const Text('data'),
      ),
    );
  }
}
