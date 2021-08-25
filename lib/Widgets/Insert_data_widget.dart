import 'package:flutter/material.dart';
import 'package:task_redux_saga/Model/View_model.dart';
import 'package:task_redux_saga/Model/check_connection.dart';
import 'package:task_redux_saga/Widgets/alert_dialog.dart';

class AddData extends StatefulWidget {
  final ViewModel model;
  const AddData({Key? key, required this.model}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final TextEditingController quistion = new TextEditingController();
  final TextEditingController answer = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        TextField(
          controller: quistion,
          decoration: InputDecoration(labelText: "Quistion"),
        ),
        TextField(
          controller: answer,
          decoration: InputDecoration(labelText: "Answer"),
        ),
        Padding(
          padding: const EdgeInsets.all(22),
          child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[400])),
              onPressed: () {
                if (quistion.text.isNotEmpty && answer.text.isNotEmpty) {
                  hasNetwork().then((value) {
                    if (value) {
                      widget.model.onadd(quistion.text, answer.text);
                      quistion.text = "";
                      answer.text = "";
                    } else {
                      showAlertDialog(context, "No Internet Connection");
                    }
                  });
                } else {
                  showAlertDialog(
                      context, "Please insert quistion and it's Answer");
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Store"), Icon(Icons.add)],
              )),
        )
      ]),
    );
  }
}
