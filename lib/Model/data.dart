class Data {
  final String? quistion;
  final String? answer;
  Data({
    required this.quistion,
    required this.answer,
  });

  Data copyWith({
    String? quistion,
    String? answer,
  }) {
    return Data(
      quistion: quistion ?? this.quistion,
      answer: answer ?? this.answer,
    );
  }
}

class AppState {
  final List<Data> data;
  AppState({
    required this.data,
  });
  AppState.initialState() : data = List.unmodifiable(<Data>[]);
}
