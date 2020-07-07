import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class FormWidget extends StatefulWidget {
  void showConfirm({BuildContext context, String msg, VoidCallback onPressedYes, VoidCallback onPressedNo}) {
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirmação"),
          content: Text(msg),
          actions: [
            FlatButton(
                child: Text("Sim"),
                onPressed: () {
                  if (onPressedYes != null) onPressedYes();
                  Navigator.pop(context);
                }),
            FlatButton(
              child: Text("Não"),
              onPressed: () {
                if (onPressedNo != null) onPressedNo();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void toast(String msg) {
    Fluttertoast.showToast(
        msg: msg, toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 5, fontSize: 16.0);
  }

  void showErros(List<String> erros) {
    toast(erros.join("\n"));
  }

  void navigateTo({BuildContext context, FormWidget form()}) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => form()),
    );
  }

  void closeForm(BuildContext context){
    Navigator.pop(context);
  }
}
