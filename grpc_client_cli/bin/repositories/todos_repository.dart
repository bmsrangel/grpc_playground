import 'package:common/common.dart';
import 'package:grpc/grpc.dart';

class TodosRepository {
  TodosRepository(this.channel) {
    stub = TodosClient(channel);
  }
  final ClientChannel channel;
  late final TodosClient stub;

  Future<List<Todo>> getTodos() async {
    final TodoResponse response = await stub.getTodos(TodoRequest());
    return response.todos;
  }

  Future<Todo> getTodoById(int id) async {
    final SingleTodoResponse response =
        await stub.getTodoById(TodoRequest(id: id));
    return response.todo;
  }

  Stream<List<Todo>> listedTodos() {
    final ResponseStream response = stub.listenTodos(TodoRequest());
    return response.asyncMap<List<Todo>>((event) => event);
  }
}
