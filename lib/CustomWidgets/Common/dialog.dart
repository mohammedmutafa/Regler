import 'package:flutter/material.dart';
import 'package:flutter_app/Classes/user_data.dart';
import 'package:flutter_app/CustomWidgets/Common/circular_image.dart';

class Dialogs {
  BuildContext buildContext;
  String message = "Loading...";

  Dialogs(this.buildContext);

  void setMessage(String mess) {
    this.message = mess;
  }

  void show() {
    _showDialog();
  }

  void hide() {
    Navigator.pop(buildContext);
  }

  _showDialog() {
    showDialog(
      context: buildContext,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          content: SizedBox(
            height: 45.0,
            child: Center(
              child: Row(
                children: <Widget>[
                  SizedBox(width: 10.0),
                  CircularProgressIndicator(),
                  SizedBox(width: 20.0),
                  Text(
                    message,
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  bool showAlertUserBlock(String title, UserData user) {
    bool res;
    showDialog(
        context: buildContext,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircularImage(
                      NetworkImage(user.url),
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(user.name)
                  ],
                ),
              ],
            ),
            actions: <Widget>[
              RawMaterialButton(
                child: Text(
                  "Yes",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  res = true;
                  Navigator.pop(buildContext);
                },
              ),
              RawMaterialButton(
                child: Text(
                  "No",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  res = false;
                  Navigator.pop(buildContext);
                },
              )
            ],
          );
        });
    return res;
  }
}
