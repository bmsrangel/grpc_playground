import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart' hide ConnectionState;

import '../../channels/grpc_channel.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  _TodosPageState createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  late final ClientChannel channel;
  late final TodosClient stub;

  @override
  void initState() {
    channel = GetIt.I<GrpcChannel>().channel;
    stub = TodosClient(channel);
    super.initState();
  }

  @override
  void dispose() {
    channel.shutdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: FutureBuilder<TodoResponse>(
        future: stub.getTodos(TodoRequest()),
        builder: (_, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              return ListView.builder(
                itemCount: snapshot.data!.todos.length,
                itemBuilder: (_, index) {
                  final Todo todo = snapshot.data!.todos[index];
                  return CheckboxListTile(
                    title: Text(todo.description),
                    value: todo.isCompleted,
                    onChanged: (value) => {},
                  );
                },
              );
            default:
              return const Center(
                child: CircularProgressIndicator(),
              );
          }
        },
      ),
    );
  }
}
