import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:task_redux_saga/Model/data.dart';
import 'package:task_redux_saga/Widgets/Insert_data_widget.dart';
import 'package:task_redux_saga/redux/reducers.dart';
import 'package:task_redux_saga/views/display_data.dart';
import 'Model/View_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store =
        Store<AppState>(appstatereducer, initialState: AppState.initialState());
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'data insertion'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DisplayData()),
                  );
                },
                icon: Icon(Icons.visibility))
          ],
        ),
        body: StoreConnector<AppState, ViewModel>(
            builder: (BuildContext context, ViewModel viewmodel) => Column(
                  children: [AddData(model: viewmodel)],
                ),
            converter: (Store<AppState> store) => ViewModel.create(store)));
  }
}
