///
//  Generated code. Do not modify.
//  source: albums.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Album extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Album', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..hasRequiredFields = false
  ;

  Album._() : super();
  factory Album({
    $core.int? id,
    $core.String? title,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    return _result;
  }
  factory Album.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Album.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Album clone() => Album()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Album copyWith(void Function(Album) updates) => super.copyWith((message) => updates(message as Album)) as Album; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Album create() => Album._();
  Album createEmptyInstance() => create();
  static $pb.PbList<Album> createRepeated() => $pb.PbList<Album>();
  @$core.pragma('dart2js:noInline')
  static Album getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Album>(create);
  static Album? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);
}

class AlbumsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AlbumsRequest', createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  AlbumsRequest._() : super();
  factory AlbumsRequest({
    $core.int? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory AlbumsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AlbumsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AlbumsRequest clone() => AlbumsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AlbumsRequest copyWith(void Function(AlbumsRequest) updates) => super.copyWith((message) => updates(message as AlbumsRequest)) as AlbumsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AlbumsRequest create() => AlbumsRequest._();
  AlbumsRequest createEmptyInstance() => create();
  static $pb.PbList<AlbumsRequest> createRepeated() => $pb.PbList<AlbumsRequest>();
  @$core.pragma('dart2js:noInline')
  static AlbumsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AlbumsRequest>(create);
  static AlbumsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class AlbumsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'AlbumsResponse', createEmptyInstance: create)
    ..pc<Album>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'albums', $pb.PbFieldType.PM, subBuilder: Album.create)
    ..hasRequiredFields = false
  ;

  AlbumsResponse._() : super();
  factory AlbumsResponse({
    $core.Iterable<Album>? albums,
  }) {
    final _result = create();
    if (albums != null) {
      _result.albums.addAll(albums);
    }
    return _result;
  }
  factory AlbumsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AlbumsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AlbumsResponse clone() => AlbumsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AlbumsResponse copyWith(void Function(AlbumsResponse) updates) => super.copyWith((message) => updates(message as AlbumsResponse)) as AlbumsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AlbumsResponse create() => AlbumsResponse._();
  AlbumsResponse createEmptyInstance() => create();
  static $pb.PbList<AlbumsResponse> createRepeated() => $pb.PbList<AlbumsResponse>();
  @$core.pragma('dart2js:noInline')
  static AlbumsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AlbumsResponse>(create);
  static AlbumsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Album> get albums => $_getList(0);
}

