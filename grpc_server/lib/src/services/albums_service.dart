import 'package:common/common.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc_server/src/utils/grpc_map_converter.dart';

import '../mocks/albums_mock.dart';

class AlbumsService extends AlbumsServiceBase {
  @override
  Future<AlbumsResponse> getAlbums(
      ServiceCall call, AlbumsRequest request) async {
    final albumList = albums
        .map((album) => Album.fromJson(GrpcMapConverter.convert(album)))
        .toList();
    return AlbumsResponse()..albums.addAll(albumList);
  }
}
