import 'package:common/common.dart';
import 'package:grpc/grpc.dart';

import 'repositories/albums_repository.dart';
import 'repositories/todos_repository.dart';

void main(List<String> arguments) async {
  final ClientChannel channel = ClientChannel(
    'localhost',
    port: 3000,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      codecRegistry: CodecRegistry(
        codecs: [GzipCodec()],
      ),
    ),
  );
  if (arguments[0] == 'albums') {
    final AlbumsRepository albumsRepository = AlbumsRepository(channel);
    final List<Album> albums = await albumsRepository.getAlbums();
    print(albums);
  } else if (arguments[0] == 'todos') {
    final TodosRepository todosRepository = TodosRepository(channel);
    if (arguments.length == 1) {
      final List<Todo> todos = await todosRepository.getTodos();
      print(todos);
    } else if (arguments.length == 2) {
      try {
        final Todo todo =
            await todosRepository.getTodoById(int.parse(arguments[1]));
        if (todo.id > 0) {
          print(todo);
        } else {
          print('No Todos found');
        }
      } catch (e) {
        print('Invalid ID. Please use only numeric values');
      }
    } else {
      showHelp();
    }
  }
  await channel.shutdown();
}

void showHelp() {
  print('Available options:\n"albums"\n"todos [id]"');
}
