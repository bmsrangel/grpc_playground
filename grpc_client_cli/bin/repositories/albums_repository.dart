import 'package:common/common.dart';
import 'package:grpc/grpc.dart';

class AlbumsRepository {
  AlbumsRepository(this.channel) {
    stub = AlbumsServiceClient(channel);
  }

  final ClientChannel channel;
  late final AlbumsServiceClient stub;

  Future<List<Album>> getAlbums() async {
    final AlbumsResponse response = await stub.getAlbums(AlbumsRequest());
    return response.albums;
  }
}
