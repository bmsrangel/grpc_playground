import 'dart:io';

import 'package:common/common.dart';
import 'package:grpc/grpc.dart';
import 'package:path/path.dart' as path;

class FileUploadService extends FileUploadServiceBase {
  @override
  Future<UploadStatus> upload(ServiceCall call, Stream<Chunk> request) async {
    final File file = File(
      path.join(
        'public',
        '${DateTime.now().millisecondsSinceEpoch.toString()}.pdf',
      ),
    );
    try {
      final IOSink writer = file.openWrite();
      final Stream<List<int>> dataStream =
          request.asyncMap((chunk) => chunk.content);
      await writer.addStream(dataStream);
      await writer.close();
      await writer.done;
      return UploadStatus(
          message: 'File upload successfully', code: UploadStatusCode.ok);
    } catch (e) {
      return UploadStatus(message: e.toString(), code: UploadStatusCode.failed);
    }
  }
}
