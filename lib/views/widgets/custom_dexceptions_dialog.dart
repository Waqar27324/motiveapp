import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:permission_handler/permission_handler.dart';

Future<void> exceptionDialog(
  BuildContext context,
  String title,
  String message,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.end,
        actionsPadding: EdgeInsets.only(right: 15.w, left: 12.w),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok', style: TextStyle(color: Colors.red)),
            onPressed: () async {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> permissionDialog(
  BuildContext context,
  String title,
  String message,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext ctx) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.end,
        actionsPadding: EdgeInsets.only(right: 15.w, left: 12.w),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok', style: TextStyle(color: Colors.red)),
            onPressed: () async {
              //  openAppSettings();
            },
          ),
        ],
      );
    },
  );
}
