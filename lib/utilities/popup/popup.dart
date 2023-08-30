import 'package:fab_simple/constants/colors.dart';
import 'package:flutter/material.dart';

class Popup {
  final Widget child;
  final List<Widget> actionButtons;

  Popup({
    required this.child,
    required this.actionButtons,
  });

  show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return _PopupCall(
          actionButtons: actionButtons,
          child: child,
        );
      },
    );
  }
}

class _PopupCall extends StatelessWidget {
  final Widget child;
  final List<Widget> actionButtons;
  const _PopupCall({
    required this.child,
    required this.actionButtons,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: lightColor,
      titlePadding: const EdgeInsets.all(0),
      title: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          icon: const Icon(
            Icons.close,
            color: darkColor,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      content: child,
      actions: actionButtons,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
    );
  }
}
