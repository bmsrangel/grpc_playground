# gRPC Playground

## Project Structure

This repository contains some code related to gRPC studies.

It is basically divided into 3 parts:

- common: contains all `.proto` files and generated files by `protoc` plugin;
- grpc_server: contains the code related to the gRPC Dart server;
- grpc_client: contains the code for Flutter client application.
- grpc_client_cli: contains the code for terminal client application

This project uses the "monorepo" pattern, and which is useful because both grpc_client, grpc_client_cli and grpc_server need to access all generated files. So, instead of having a copy of these files in both applications, they were concentrated in `common` package and both clients and server depend on it.

## Requirements

To run this project you'll need either Dart SDK, if you want to run only the server and CLI application, or the Flutter SDK, if you want to run both server and Flutter client.
**PS: Flutter SDK already contains the Dart SDK, so it's not necessary to install both**.

## gRPC?

From the [documentation](https://www.grpc.io):

> gRPC is a modern open source high performance Remote Procedure Call (RPC) framework that can run in any environment. It can efficiently connect services in and across data centers with pluggable support for load balancing, tracing, health checking and authentication. It is also applicable in last mile of distributed computing to connect devices, mobile applications and browsers to backend services.

It can be used as an alternative to REST for API constructions and one of its benefits is the usage of the HTTP/2.

Details about how it works can be found [here](https://www.grpc.io/docs/what-is-grpc/introduction/).

## Running the project

### Loading _common_ package

First, start from the _common_ folder. Navigate to it and run the _pub get_ command:

```bash
cd common
dart pub get
```

### Starting the server

Then, return to the root folder and navigate to the _grpc_server_ folder and once again run the _pub get_ command:

```bash
cd grpc_server
dart pub get
dart bin/grpc_server.dart
```

### Running the Flutter client

Now, return to the root folder and navigate to the _grpc_client_ folder. To start the client, start either iOS Simulator or Android Emulator (it also supports Windows and macOS) and run the commands below:

```bash
cd grpc_client
flutter pub get
flutter run
```

### Running the CLI client

Before starting the CLI client, you should know it expects arguments, and it currently supports the following ones:

```
albums
todos [id]
stream
upload <file_path>
```

```bash
cd grpc_client_cli
dart pub get
dart bin/grpc_client_cli.dart <args>
```

Example:

```bash
dart bin/grpc_client_cli.dart todos
```
