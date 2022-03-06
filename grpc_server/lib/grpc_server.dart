import 'package:grpc/grpc.dart';
import 'package:grpc_server/src/services/albums_service.dart';
import 'package:grpc_server/src/services/greeter_service.dart';
import 'package:grpc_server/src/services/todos_service.dart';

class GrpcServer {
  final _server = Server(
    [
      GreeterService(),
      TodosService(),
      AlbumsService(),
    ],
    // const <Interceptor>[],
    // CodecRegistry(
    //   codecs: [
    //     GzipCodec(),
    //     IdentityCodec(),
    //   ],
    // ),
  );

  Future<void> run() async {
    await _server.serve(port: 3000);
    print('Server listening on port ${_server.port}');
  }
}
