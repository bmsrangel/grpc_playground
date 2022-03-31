import 'package:common/common.dart';
import 'package:grpc/grpc.dart';

import 'auth/custom_jwt_authenticator.dart';
import 'repositories/albums_repository.dart';
import 'repositories/file_upload_repository.dart';
import 'repositories/todos_repository.dart';

void main(List<String> arguments) async {
  // final Map<String, dynamic> serviceAccountJson = {
  //   'client_email': 'bmsrangel.dev@gmail.com',
  //   'client_id': '1',
  //   'private_key': 's3cr3t',
  //   'type': 'service_account',
  // };
  // final credentials =
  //     JwtServiceAccountAuthenticator.fromJson(serviceAccountJson);
  final credentials = CustomJwtAuthenticator();
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
    // final AlbumsRepository albumsRepository = AlbumsRepository(channel);
    final AlbumsRepository albumsRepository = AlbumsRepository(
      channel,
      credentials.toCallOptions,
    );
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
  } else if (arguments[0] == 'stream') {
    final TodosRepository todosRepository = TodosRepository(channel);
    final Stream<List<Todo>> todoStream = todosRepository.listenTodos();
    await for (var todo in todoStream) {
      print(todo);
    }
  } else if (arguments[0] == 'upload') {
    if (arguments.length == 2) {
      final String filePath = arguments[1];
      final FileUploadRepository fileUploadRepository =
          FileUploadRepository(channel, filePath);
      await fileUploadRepository.upload();
    } else {
      showHelp();
    }
  } else if (arguments[0] == 'help') {
    showHelp();
  } else {
    print('Invalid option!\n');
    showHelp();
  }
  await channel.shutdown();
}

void showHelp() {
  print(
    'Available commands:\n\n\talbums\n\ttodos [id]\n\tstream\n\tupload <file path>',
  );
}
