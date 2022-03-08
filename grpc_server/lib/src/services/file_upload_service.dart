import 'dart:io';

import 'package:common/common.dart';
import 'package:grpc/grpc.dart';
import 'package:path/path.dart' as path;

class FileUploadService extends FileUploadServiceBase {
  @override
  Future<UploadStatus> upload(ServiceCall call, Stream<Chunk> request) async {
    final File file = File(path.join(
        'public', '${DateTime.now().millisecondsSinceEpoch.toString()}.pdf'));
    List<int> bytes = [];
    await for (var chunk in request) {
      bytes.addAll(chunk.content);
    }
    try {
      await file.writeAsBytes(bytes);
      return UploadStatus(
          message: 'File upload successfully', code: UploadStatusCode.ok);
    } catch (e) {
      return UploadStatus(message: e.toString(), code: UploadStatusCode.failed);
    }
  }
}
