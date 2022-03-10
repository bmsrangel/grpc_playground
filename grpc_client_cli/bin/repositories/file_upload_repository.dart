import 'dart:io';

import 'package:common/common.dart';
import 'package:grpc/grpc.dart';

class FileUploadRepository {
  FileUploadRepository(this.channel, this.filePath) {
    stub = FileUploadClient(channel);
  }
  final String filePath;
  UploadStatusCode? status;

  final ClientChannel channel;
  late final FileUploadClient stub;

  Future upload() async {
    final file = File(filePath);
    final bytes = file.openRead();
    final response =
        await stub.upload(bytes.asyncMap((event) => Chunk(content: event)));
    print('Upload status: ${response.code}');
  }
}
