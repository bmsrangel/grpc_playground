import 'dart:async';

import 'todos_mock.dart';

class StreamMock {
  StreamMock() {
    final List<Map<String, dynamic>> todoList = List.from(todos);
    _controller = StreamController<List<Map<String, dynamic>>>.broadcast();
    _controller.sink.add(todoList);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      final Map<String, dynamic> newTodo = {
        'id': _counter,
        'description': 'Todo $_counter',
        'is_completed': _counter % 2 == 0 ? true : false,
      };
      todoList.add(newTodo);
      _controller.sink.add(todoList);
      _counter++;
      if (timer.tick == 5) {
        timer.cancel();
      }
    });
  }

  late final StreamController<List<Map<String, dynamic>>> _controller;

  int _counter = 4;

  Stream<List<Map<String, dynamic>>> get stream => _controller.stream;
}
