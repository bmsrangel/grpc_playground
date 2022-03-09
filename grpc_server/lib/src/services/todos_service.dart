import 'package:common/common.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc_server/src/utils/grpc_map_converter.dart';

import '../mocks/stream_mock.dart';
import '../mocks/todos_mock.dart';

class TodosService extends TodosServiceBase {
  @override
  Future<SingleTodoResponse> getTodoById(
      ServiceCall call, TodoRequest request) async {
    final int id = request.id;
    final List<Map<String, dynamic>> filteredTodos =
        todos.where((todo) => todo['id'] == id).toList();

    return SingleTodoResponse()
      ..todo = Todo.fromJson(GrpcMapConverter.convert(filteredTodos.first));
  }

  @override
  Future<TodoResponse> getTodos(ServiceCall call, TodoRequest request) async {
    final todoList =
        todos.map((todo) => GrpcMapConverter.convert(todo)).toList();
    return TodoResponse()
      ..todos.addAll(todoList.map((todo) => Todo.fromJson(todo)).toList());
  }

  @override
  Stream<TodoResponse> listenTodos(
    ServiceCall call,
    TodoRequest request,
  ) async* {
    final itemsListStream = StreamMock().stream;
    final Stream<List<Todo>> todoListStream = itemsListStream.asyncMap((event) {
      return event
          .map((e) => Todo.fromJson(GrpcMapConverter.convert(e)))
          .toList();
    });

    await for (var item in todoListStream) {
      yield TodoResponse()..todos.addAll(item);
    }
  }
}
