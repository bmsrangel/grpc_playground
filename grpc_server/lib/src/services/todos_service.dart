import 'package:common/common.dart';
import 'package:dotenv/dotenv.dart' show load, env;
import 'package:grpc/grpc.dart';
import 'package:grpc_server/src/utils/grpc_map_converter.dart';
import 'package:hasura_connect/hasura_connect.dart';

final todos = [
  {
    'id': 1,
    'description': 'Todo 1',
    'is_completed': false,
  },
  {
    'id': 2,
    'description': 'Todo 2',
    'is_completed': true,
  },
  {
    'id': 3,
    'description': 'Todo 3',
    'is_completed': false,
  },
];

class TodosService extends TodosServiceBase {
  TodosService() {
    load();
    _hasuraUrl = env['HASURA_URL'];
    _hasura = HasuraConnect(_hasuraUrl!);
  }

  late final String? _hasuraUrl;
  late final HasuraConnect _hasura;

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
    final response = await _hasura.subscription('''
      subscription {
        items(order_by: {description: asc}) {
          id
          description
          is_completed
        }
      }
    ''');
    final Stream<List> itemsListStream =
        response.map((event) => event['data']['items']);
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
