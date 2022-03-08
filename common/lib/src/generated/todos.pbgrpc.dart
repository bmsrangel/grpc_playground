///
//  Generated code. Do not modify.
//  source: todos.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'todos.pb.dart' as $3;
export 'todos.pb.dart';

class TodosClient extends $grpc.Client {
  static final _$getTodos = $grpc.ClientMethod<$3.TodoRequest, $3.TodoResponse>(
      '/Todos/getTodos',
      ($3.TodoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.TodoResponse.fromBuffer(value));
  static final _$getTodoById =
      $grpc.ClientMethod<$3.TodoRequest, $3.SingleTodoResponse>(
          '/Todos/getTodoById',
          ($3.TodoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $3.SingleTodoResponse.fromBuffer(value));
  static final _$listenTodos =
      $grpc.ClientMethod<$3.TodoRequest, $3.TodoResponse>(
          '/Todos/listenTodos',
          ($3.TodoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $3.TodoResponse.fromBuffer(value));

  TodosClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$3.TodoResponse> getTodos($3.TodoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTodos, request, options: options);
  }

  $grpc.ResponseFuture<$3.SingleTodoResponse> getTodoById(
      $3.TodoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTodoById, request, options: options);
  }

  $grpc.ResponseStream<$3.TodoResponse> listenTodos($3.TodoRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$listenTodos, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class TodosServiceBase extends $grpc.Service {
  $core.String get $name => 'Todos';

  TodosServiceBase() {
    $addMethod($grpc.ServiceMethod<$3.TodoRequest, $3.TodoResponse>(
        'getTodos',
        getTodos_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.TodoRequest.fromBuffer(value),
        ($3.TodoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.TodoRequest, $3.SingleTodoResponse>(
        'getTodoById',
        getTodoById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.TodoRequest.fromBuffer(value),
        ($3.SingleTodoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.TodoRequest, $3.TodoResponse>(
        'listenTodos',
        listenTodos_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $3.TodoRequest.fromBuffer(value),
        ($3.TodoResponse value) => value.writeToBuffer()));
  }

  $async.Future<$3.TodoResponse> getTodos_Pre(
      $grpc.ServiceCall call, $async.Future<$3.TodoRequest> request) async {
    return getTodos(call, await request);
  }

  $async.Future<$3.SingleTodoResponse> getTodoById_Pre(
      $grpc.ServiceCall call, $async.Future<$3.TodoRequest> request) async {
    return getTodoById(call, await request);
  }

  $async.Stream<$3.TodoResponse> listenTodos_Pre(
      $grpc.ServiceCall call, $async.Future<$3.TodoRequest> request) async* {
    yield* listenTodos(call, await request);
  }

  $async.Future<$3.TodoResponse> getTodos(
      $grpc.ServiceCall call, $3.TodoRequest request);
  $async.Future<$3.SingleTodoResponse> getTodoById(
      $grpc.ServiceCall call, $3.TodoRequest request);
  $async.Stream<$3.TodoResponse> listenTodos(
      $grpc.ServiceCall call, $3.TodoRequest request);
}
