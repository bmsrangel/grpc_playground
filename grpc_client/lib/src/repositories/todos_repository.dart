import 'package:grpc/grpc.dart';

class GrpcChannel {
  final ClientChannel channel = ClientChannel(
    '192.168.1.102',
    port: 3000,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(),
    ),
  );
}
