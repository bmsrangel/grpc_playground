import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';

import '../../channels/grpc_channel.dart';

class TodosStreamPage extends StatefulWidget {
  const TodosStreamPage({Key? key}) : super(key: key);

  @override
  _TodosStreamPageState createState() => _TodosStreamPageState();
}

class _TodosStreamPageState extends State<TodosStreamPage> {
  late final TodosClient stub;
  late final ClientChannel channel;

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
      body: StreamBuilder<TodoResponse>(
        stream: stub.listenTodos(TodoRequest()),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
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
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
