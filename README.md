# gRPC Playground
## Project Structure
This repository contains some code related to gRPC studies.

It is basically divided into 3 parts:
- common: contains all `.proto` files and generated files by `protoc` plugin;
- grpc_server: contains the code related to the gRPC Dart server;
- grpc_client: contains the code for Flutter client application.

This project uses the "monorepo" pattern, and which is useful because both grpc_client and grpc_server need to access all generated files. So, instead of having a copy of these files in both applications, they were concentrated in `common` package and both client and server depend on it.

## Requirements
To run this project you'll need either Dart SDK, if you want to run only the server application, or the Flutter SDK, if you want to run both server and client.
**PS: Flutter SDK already contains the Dart SDK, so it's not necessary to install both**.

## gRPC?
From the [documentation](https://www.grpc.io), "gRPC is a modern open source high performance Remote Procedure Call (RPC) framework that can run in any environment. It can efficiently connect services in and across data centers with pluggable support for load balancing, tracing, health checking and authentication. It is also applicable in last mile of distributed computing to connect devices, mobile applications and browsers to backend services."

It can be used as an alternative to REST for API constructions and one of its benefits is the usage of the HTTP/2.

Details about how it works can be found [here](https://www.grpc.io/docs/what-is-grpc/introduction/).

## Running the project
First, start from the _common_ folder. Navigate to it and run the _pub get_ command:
```bash
cd common
dart pub get
```
Then, return to the root folder and navigate to the _grpc_server_ folder and once again run the _pub get_ command:
```bash
cd grpc_server
dart pub get
```
Now, return to the root folder and navigate to the _grpc_client_ folder. Once again, run the _flutter pub get_ command:
```bash
cd grpc_client
flutter pub get
```

To start the server:
```bash
cd grpc_server
dart bin/grpc_server.dart
```

To start the client, start either iOS Simulator or Android Emulator and run the commands below:
```bash
cd grpc_client
flutter run
```

### Important information about gRPC server
To test the _Server streaming gRPC_, it was used a [Hasura GraphQL](https://hasura.io) application. You can either create a Hasura instance and configure it by using the docker-compose file or you can change the TodosService class from:
```dart
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
```
to:
```dart
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
  Stream<TodoResponse> listenTodos(ServiceCall call, TodoRequest request) {
    // TODO: implement listenTodos
    throw UnimplementedError();
  }
}
```

If it's decided to implement the Hasura application, the database will need a table named _items_ containing the fields:
- id (integer, primary key)
- description (text)
- is_completed (boolean, default: false)

It's very important to assure the table name and field names are exactly as described above. You can use this script below by accessing Hasura's console, menu _Data_, option SQL:
```sql
CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    description TEXT NOT NULL,
    is_completed BOOLEAN DEFAULT false
)

INSERT INTO items(description, is_completed) VALUES
('Todo 1', false),
('Todo 2', true),
('Todo 3', false)
```
Also, you can replace the environment variable "HASURA_URL" by your URL.
