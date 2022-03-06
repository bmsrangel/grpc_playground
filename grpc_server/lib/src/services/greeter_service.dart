import 'package:common/common.dart';
import 'package:grpc/grpc.dart';

class GreeterService extends GreeterServiceBase {
  @override
  Future<HelloReply> sayHello(ServiceCall call, HelloRequest request) async {
    return HelloReply()..message = 'Hello, ${request.name}!';
  }

  @override
  Future<HelloReply> sayHelloAgain(
    ServiceCall call,
    HelloRequest request,
  ) async {
    return HelloReply()..message = 'Hello again, ${request.name}';
  }
}
