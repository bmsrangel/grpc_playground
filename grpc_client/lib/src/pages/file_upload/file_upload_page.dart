import 'dart:io';

import 'package:common/common.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:grpc/grpc.dart';

import '../../repositories/todos_repository.dart';

class FileUploadPage extends StatefulWidget {
  const FileUploadPage({Key? key}) : super(key: key);

  @override
  _FileUploadPageState createState() => _FileUploadPageState();
}

class _FileUploadPageState extends State<FileUploadPage> {
  String? filePath;
  UploadStatusCode? status;

  late final ClientChannel channel;
  late final FileUploadClient stub;

  @override
  void initState() {
    channel = GetIt.I<GrpcChannel>().channel;
    stub = FileUploadClient(channel);
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
        title: const Text('File Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(filePath ?? 'No file selected'),
            Text(status?.name ?? 'File not uploaded yet'),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: filePath == null
                  ? null
                  : () async {
                      final file = File(filePath!);
                      final bytes = file.openRead();
                      final response = await stub.upload(
                          bytes.asyncMap((event) => Chunk(content: event)));
                      setState(() {
                        status = response.code;
                      });
                    },
              child: const Text('Upload'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.file_open),
        onPressed: () async {
          final FilePickerResult? filePickerResult =
              await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowMultiple: false,
            allowedExtensions: ['pdf'],
          );
          if (filePickerResult != null) {
            setState(() {
              filePath = filePickerResult.paths.first;
            });
          }
        },
      ),
    );
  }
}
