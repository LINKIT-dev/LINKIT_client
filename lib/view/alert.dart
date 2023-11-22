import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, String errormessageT,
    String errormessageM, String OK) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xffd6c2d6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Text(
          errormessageT,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          errormessageM,
          style: const TextStyle(
            color: Colors.white70,
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              OK,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<bool> showErrorDialog_TF(BuildContext context, String errormessageT,
    String errormessageM, String trueMessage, String falseMessage) async {
  return await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xffd6c2d6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: Text(
              errormessageT,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              errormessageM,
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  trueMessage,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(true); // true 반환
                },
              ),
              TextButton(
                child: Text(
                  falseMessage,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(false); // false 반환
                },
              ),
            ],
          );
        },
      ) ??
      false; // showDialog가 null을 반환하는 경우 false를 반환
}
