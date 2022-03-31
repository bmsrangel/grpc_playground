import 'dart:io';

import 'package:grpc/grpc.dart';

class JwtServerCredentials extends ServerCredentials {
  @override
  // TODO: implement securityContext
  SecurityContext? get securityContext => throw UnimplementedError();
}
