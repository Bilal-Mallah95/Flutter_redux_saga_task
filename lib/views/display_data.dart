import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:task_redux_saga/Model/View_model.dart';
import 'package:task_redux_saga/Model/data.dart';
import 'package:task_redux_saga/Widgets/Insert_data_widget.dart';
import 'package:task_redux_saga/Widgets/data_list_widget.dart';

class DisplayData extends StatefulWidget {
  const DisplayData({Key? key}) : super(key: key);

  @override
  _DisplayDataState createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("data"),
        ),
        body: StoreConnector<AppState, ViewModel>(
            builder: (BuildContext context, ViewModel viewmodel) =>
                Display(model: viewmodel),
            converter: (Store<AppState> store) => ViewModel.create(store)));
  }
}
