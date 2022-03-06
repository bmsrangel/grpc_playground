///
//  Generated code. Do not modify.
//  source: todos.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'todos.pb.dart' as $2;
export 'todos.pb.dart';

class TodosClient extends $grpc.Client {
  static final _$getTodos = $grpc.ClientMethod<$2.TodoRequest, $2.TodoResponse>(
      '/Todos/getTodos',
      ($2.TodoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.TodoResponse.fromBuffer(value));
  static final _$getTodoById =
      $grpc.ClientMethod<$2.TodoRequest, $2.SingleTodoResponse>(
          '/Todos/getTodoById',
          ($2.TodoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $2.SingleTodoResponse.fromBuffer(value));
  static final _$listenTodos =
      $grpc.ClientMethod<$2.TodoRequest, $2.TodoResponse>(
          '/Todos/listenTodos',
          ($2.TodoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $2.TodoResponse.fromBuffer(value));

  TodosClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$2.TodoResponse> getTodos($2.TodoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTodos, request, options: options);
  }

  $grpc.ResponseFuture<$2.SingleTodoResponse> getTodoById(
      $2.TodoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTodoById, request, options: options);
  }

  $grpc.ResponseStream<$2.TodoResponse> listenTodos($2.TodoRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$listenTodos, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class TodosServiceBase extends $grpc.Service {
  $core.String get $name => 'Todos';

  TodosServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.TodoRequest, $2.TodoResponse>(
        'getTodos',
        getTodos_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.TodoRequest.fromBuffer(value),
        ($2.TodoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.TodoRequest, $2.SingleTodoResponse>(
        'getTodoById',
        getTodoById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.TodoRequest.fromBuffer(value),
        ($2.SingleTodoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.TodoRequest, $2.TodoResponse>(
        'listenTodos',
        listenTodos_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $2.TodoRequest.fromBuffer(value),
        ($2.TodoResponse value) => value.writeToBuffer()));
  }

  $async.Future<$2.TodoResponse> getTodos_Pre(
      $grpc.ServiceCall call, $async.Future<$2.TodoRequest> request) async {
    return getTodos(call, await request);
  }

  $async.Future<$2.SingleTodoResponse> getTodoById_Pre(
      $grpc.ServiceCall call, $async.Future<$2.TodoRequest> request) async {
    return getTodoById(call, await request);
  }

  $async.Stream<$2.TodoResponse> listenTodos_Pre(
      $grpc.ServiceCall call, $async.Future<$2.TodoRequest> request) async* {
    yield* listenTodos(call, await request);
  }

  $async.Future<$2.TodoResponse> getTodos(
      $grpc.ServiceCall call, $2.TodoRequest request);
  $async.Future<$2.SingleTodoResponse> getTodoById(
      $grpc.ServiceCall call, $2.TodoRequest request);
  $async.Stream<$2.TodoResponse> listenTodos(
      $grpc.ServiceCall call, $2.TodoRequest request);
}
