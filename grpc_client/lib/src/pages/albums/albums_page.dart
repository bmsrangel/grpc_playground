import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';

import '../../channels/grpc_channel.dart';

class AlbumsPage extends StatefulWidget {
  const AlbumsPage({Key? key}) : super(key: key);

  @override
  _AlbumsPageState createState() => _AlbumsPageState();
}

class _AlbumsPageState extends State<AlbumsPage> {
  late final ClientChannel channel;
  late final AlbumsServiceClient stub;

  @override
  void initState() {
    channel = GetIt.I<GrpcChannel>().channel;
    stub = AlbumsServiceClient(channel);
    super.initState();
  }

  @override
  void dispose() {
    channel.shutdown();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
      ),
      body: FutureBuilder<AlbumsResponse>(
        future: stub.getAlbums(AlbumsRequest()),
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final List<Album> albums = snapshot.data!.albums;
            return ListView.builder(
              itemCount: albums.length,
              itemBuilder: (_, index) {
                final Album album = albums[index];
                return ListTile(
                  title: Text(album.title),
                );
              },
            );
          }
        },
      ),
    );
  }
}
