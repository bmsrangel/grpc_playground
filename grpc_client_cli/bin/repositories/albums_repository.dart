import 'package:common/common.dart';
import 'package:grpc/grpc.dart';

class AlbumsRepository {
  AlbumsRepository(this.channel, [this.options]) {
    stub = AlbumsServiceClient(
      channel,
      options: options,
    );
  }

  final ClientChannel channel;
  late final AlbumsServiceClient stub;
  final CallOptions? options;

  Future<List<Album>> getAlbums() async {
    final AlbumsResponse response = await stub.getAlbums(AlbumsRequest());
    // final AlbumsResponse response =
    // await stub.getAlbums(AlbumsRequest(), options: options);
    return response.albums;
  }
}
