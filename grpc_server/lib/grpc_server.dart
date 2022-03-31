import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:grpc_server/src/services/albums_service.dart';
import 'package:grpc_server/src/services/file_upload_service.dart';
import 'package:grpc_server/src/services/greeter_service.dart';
import 'package:grpc_server/src/services/todos_service.dart';

class GrpcServer {
  GrpcServer() {
    _server = Server(
      [
        GreeterService(),
        TodosService(),
        AlbumsService(),
        FileUploadService(),
      ],
      <Interceptor>[
        authInterceptor,
      ],
      CodecRegistry(
        codecs: [
          GzipCodec(),
          // IdentityCodec(),
        ],
      ),
    );
  }
  late final Server _server;

  Future<void> run() async {
    await _server.serve(port: 3000);
    print('Server listening on port ${_server.port}');
  }

  FutureOr<GrpcError?> authInterceptor(
    ServiceCall call,
    ServiceMethod<dynamic, dynamic> method,
  ) {
    return (ServiceCall call, ServiceMethod<dynamic, dynamic> method) async {
      if (call.clientMetadata!.keys.contains('authorization')) {
        print('Method name: ${method.name}');
        print('Token: ${call.clientMetadata!['authorization']}');
        return null;
      } else {
        return GrpcError.permissionDenied('Unauthorized user');
      }
    }(call, method);
  }
}
