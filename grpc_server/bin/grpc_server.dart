import 'package:grpc_server/grpc_server.dart' as grpc_server;

void main(List<String> arguments) async {
  final server = grpc_server.GrpcServer();
  await server.run();
}
