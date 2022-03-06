///
//  Generated code. Do not modify.
//  source: albums.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use albumDescriptor instead')
const Album$json = const {
  '1': 'Album',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
  ],
};

/// Descriptor for `Album`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List albumDescriptor = $convert.base64Decode('CgVBbGJ1bRIOCgJpZBgBIAEoBVICaWQSFAoFdGl0bGUYAiABKAlSBXRpdGxl');
@$core.Deprecated('Use albumsRequestDescriptor instead')
const AlbumsRequest$json = const {
  '1': 'AlbumsRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `AlbumsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List albumsRequestDescriptor = $convert.base64Decode('Cg1BbGJ1bXNSZXF1ZXN0Eg4KAmlkGAEgASgFUgJpZA==');
@$core.Deprecated('Use albumsResponseDescriptor instead')
const AlbumsResponse$json = const {
  '1': 'AlbumsResponse',
  '2': const [
    const {'1': 'albums', '3': 1, '4': 3, '5': 11, '6': '.Album', '10': 'albums'},
  ],
};

/// Descriptor for `AlbumsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List albumsResponseDescriptor = $convert.base64Decode('Cg5BbGJ1bXNSZXNwb25zZRIeCgZhbGJ1bXMYASADKAsyBi5BbGJ1bVIGYWxidW1z');
