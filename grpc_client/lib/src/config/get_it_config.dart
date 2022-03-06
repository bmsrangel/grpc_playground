import 'package:get_it/get_it.dart';
import 'package:grpc_client/src/repositories/todos_repository.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerFactory(() => GrpcChannel());
}
