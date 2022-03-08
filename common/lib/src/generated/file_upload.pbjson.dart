///
//  Generated code. Do not modify.
//  source: file_upload.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use uploadStatusCodeDescriptor instead')
const UploadStatusCode$json = const {
  '1': 'UploadStatusCode',
  '2': const [
    const {'1': 'unknown', '2': 0},
    const {'1': 'ok', '2': 1},
    const {'1': 'failed', '2': 2},
  ],
};

/// Descriptor for `UploadStatusCode`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List uploadStatusCodeDescriptor = $convert.base64Decode('ChBVcGxvYWRTdGF0dXNDb2RlEgsKB3Vua25vd24QABIGCgJvaxABEgoKBmZhaWxlZBAC');
@$core.Deprecated('Use chunkDescriptor instead')
const Chunk$json = const {
  '1': 'Chunk',
  '2': const [
    const {'1': 'content', '3': 1, '4': 1, '5': 12, '10': 'content'},
  ],
};

/// Descriptor for `Chunk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chunkDescriptor = $convert.base64Decode('CgVDaHVuaxIYCgdjb250ZW50GAEgASgMUgdjb250ZW50');
@$core.Deprecated('Use uploadStatusDescriptor instead')
const UploadStatus$json = const {
  '1': 'UploadStatus',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'code', '3': 2, '4': 1, '5': 14, '6': '.UploadStatusCode', '10': 'code'},
  ],
};

/// Descriptor for `UploadStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadStatusDescriptor = $convert.base64Decode('CgxVcGxvYWRTdGF0dXMSGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZRIlCgRjb2RlGAIgASgOMhEuVXBsb2FkU3RhdHVzQ29kZVIEY29kZQ==');
