///
//  Generated code. Do not modify.
//  source: file_upload.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'file_upload.pb.dart' as $1;
export 'file_upload.pb.dart';

class FileUploadClient extends $grpc.Client {
  static final _$upload = $grpc.ClientMethod<$1.Chunk, $1.UploadStatus>(
      '/FileUpload/upload',
      ($1.Chunk value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.UploadStatus.fromBuffer(value));

  FileUploadClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.UploadStatus> upload($async.Stream<$1.Chunk> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$upload, request, options: options).single;
  }
}

abstract class FileUploadServiceBase extends $grpc.Service {
  $core.String get $name => 'FileUpload';

  FileUploadServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.Chunk, $1.UploadStatus>(
        'upload',
        upload,
        true,
        false,
        ($core.List<$core.int> value) => $1.Chunk.fromBuffer(value),
        ($1.UploadStatus value) => value.writeToBuffer()));
  }

  $async.Future<$1.UploadStatus> upload(
      $grpc.ServiceCall call, $async.Stream<$1.Chunk> request);
}
