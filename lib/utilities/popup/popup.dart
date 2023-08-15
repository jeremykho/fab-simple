import 'package:fab_simple/constants/colors.dart';
import 'package:flutter/material.dart';

class Popup {
  final Widget child;
  final Widget popupButton;

  Popup(this.child, this.popupButton);

  show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return _PopupCall(
          popupButton: popupButton,
          child: child,
        );
      },
    );
  }
}

class _PopupCall extends StatelessWidget {
  final Widget child;
  final Widget popupButton;
  const _PopupCall({
    required this.child,
    required this.popupButton,
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
      actions: <Widget>[
        popupButton,
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
    );
  }
}
