import 'package:get_it/get_it.dart';

import '../channels/grpc_channel.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerFactory(() => GrpcChannel());
}
