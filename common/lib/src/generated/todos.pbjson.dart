///
//  Generated code. Do not modify.
//  source: todos.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use todoDescriptor instead')
const Todo$json = const {
  '1': 'Todo',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'is_completed', '3': 3, '4': 1, '5': 8, '10': 'isCompleted'},
  ],
};

/// Descriptor for `Todo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List todoDescriptor = $convert.base64Decode('CgRUb2RvEg4KAmlkGAEgASgFUgJpZBIgCgtkZXNjcmlwdGlvbhgCIAEoCVILZGVzY3JpcHRpb24SIQoMaXNfY29tcGxldGVkGAMgASgIUgtpc0NvbXBsZXRlZA==');
@$core.Deprecated('Use todoRequestDescriptor instead')
const TodoRequest$json = const {
  '1': 'TodoRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `TodoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List todoRequestDescriptor = $convert.base64Decode('CgtUb2RvUmVxdWVzdBIOCgJpZBgBIAEoBVICaWQ=');
@$core.Deprecated('Use todoResponseDescriptor instead')
const TodoResponse$json = const {
  '1': 'TodoResponse',
  '2': const [
    const {'1': 'todos', '3': 1, '4': 3, '5': 11, '6': '.Todo', '10': 'todos'},
  ],
};

/// Descriptor for `TodoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List todoResponseDescriptor = $convert.base64Decode('CgxUb2RvUmVzcG9uc2USGwoFdG9kb3MYASADKAsyBS5Ub2RvUgV0b2Rvcw==');
@$core.Deprecated('Use singleTodoResponseDescriptor instead')
const SingleTodoResponse$json = const {
  '1': 'SingleTodoResponse',
  '2': const [
    const {'1': 'todo', '3': 1, '4': 1, '5': 11, '6': '.Todo', '10': 'todo'},
  ],
};

/// Descriptor for `SingleTodoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List singleTodoResponseDescriptor = $convert.base64Decode('ChJTaW5nbGVUb2RvUmVzcG9uc2USGQoEdG9kbxgBIAEoCzIFLlRvZG9SBHRvZG8=');
