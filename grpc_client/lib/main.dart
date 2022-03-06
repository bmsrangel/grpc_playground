import 'package:flutter/material.dart';
import 'package:grpc_client/src/config/get_it_config.dart';
import 'package:grpc_client/src/pages/albums/albums_page.dart';
import 'package:grpc_client/src/pages/todos/todos_page.dart';
import 'package:grpc_client/src/pages/todos_stream/todos_stream_page.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'gRPC Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'gRPC Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Todos'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TodosPage(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Todos Stream'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TodosStreamPage(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Albums'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AlbumsPage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
