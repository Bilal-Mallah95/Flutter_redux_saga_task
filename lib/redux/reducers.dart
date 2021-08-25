import 'package:task_redux_saga/Model/data.dart';
import 'package:task_redux_saga/redux/actions.dart';

AppState appstatereducer(AppState state, action) {
  return AppState(data: datareducer(state.data, action));
}

List<Data> datareducer(List<Data> state, action) {
  if (action is AddItem) {
    return []
      ..addAll(state)
      ..add(Data(quistion: action.quistion, answer: action.answer));
  }
  return state;
}
