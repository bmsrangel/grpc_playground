///
//  Generated code. Do not modify.
//  source: file_upload.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class UploadStatusCode extends $pb.ProtobufEnum {
  static const UploadStatusCode unknown = UploadStatusCode._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'unknown');
  static const UploadStatusCode ok = UploadStatusCode._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ok');
  static const UploadStatusCode failed = UploadStatusCode._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'failed');

  static const $core.List<UploadStatusCode> values = <UploadStatusCode> [
    unknown,
    ok,
    failed,
  ];

  static final $core.Map<$core.int, UploadStatusCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UploadStatusCode? valueOf($core.int value) => _byValue[value];

  const UploadStatusCode._($core.int v, $core.String n) : super(v, n);
}

