# gRPC Playground

## gRPC?

From the [documentation](https://www.grpc.io):

> gRPC is a modern open source high performance Remote Procedure Call (RPC) framework that can run in any environment. It can efficiently connect services in and across data centers with pluggable support for load balancing, tracing, health checking and authentication. It is also applicable in last mile of distributed computing to connect devices, mobile applications and browsers to backend services.

It can be used as an alternative to REST for API constructions and one of its main benefits is the usage of the HTTP/2. It also provider a higher performance, specially considering applications that handle high amount of simultaneous requests.

### Introduction

gRPC uses [_Protocol Buffers_](https://developers.google.com/protocol-buffers/docs/overview) as both Interface Definition Language (IDL) and as its message interchange format.

In gRPC, client applications can call a method on a server application on a different machine. It's just like if it were a local object from a single code base. This makes easier to create distributed services, which is one of the main applicabilities of the gRPC.

The idea is to create an interface defining a service. Each service will contain the methods that can be executed and their corresponding parameters (normally input arguments type and return type). Then, both server and client have to implement this interface.

As client(s) and service will be constructed based on these interfaces, each one can be implemented using a different language.

<figure>
    <img src=".github/grpc_flow.svg" />
    <figcaption>Source: gRPC official documentation</figcaption>
</figure>

### Protocol Buffers

gRPC uses _Protocol Buffers_ by default. From the [official documentation](https://developers.google.com/protocol-buffers/docs/overview):

> Protocol Buffers provide a language-neutral, platform-neutral, extensible mechanism for serializing structured data in a forward-compatible and backward-compatible way. It's like JSON, except it's smaller and faster, and it generates native language bindings

Basically protocol buffers are a combination of the definition language (`.proto` files), the code the proto compiler generates to interface with data, language-specific runtime libraries, and the serialization format for data that is written to a file (or sent across a network connection).

To work with protocol buffers, first it's necessary to model the data to be serialized in a _proto file_, which is a regular text file with the `.proto` extension.

The data is structured as _messages_, which are structured by a series of name-value pairs called _fields_.

```protobuf
message Todo {
    int32 id = 1;
    string description = 2;
    bool is_completed = 3;
}
```

After specified the structure, it's necessary to use a protocol buffer compliler, called `protoc`. This compiler will generate data access classes in the programming language in use from the proto definition.

In these files the services can also be defined. From the documentation, this is an example of the _Hello World_ application:

```protobuf
// The greeter service definition.
service Greeter {
  // Sends a greeting
  rpc SayHello (HelloRequest) returns (HelloReply) {}
}

// The request message containing the user's name.
message HelloRequest {
  string name = 1;
}

// The response message containing the greetings
message HelloReply {
  string message = 1;
}
```

After compiling the `.proto` files, the messages will be regular classes with their own acessor methods and serialization methods, and the services "interfaces" the developer will implement when developing the service in the server. The client classes are also automatically generated.

For Dart applications, the compilation command for a single file is:

```bash
protoc --dart_out=grpc:lib/src/generated -Iprotos protos/hello_world.proto
```

Where:

- `lib/src/generated` is the output folder where all compiled files will be found;
- `protos/hello_world.proto` is the file to be compiled.

As the project grows, it would be interesting to have a command that compiles all `.proto` files in a folder. And there is:

```bash
protoc --dart_out=grpc:lib/src/generated -Iprotos protos/*.proto
```

Where:

- `protos/*.protos` will cause all files in the folder with the `.proto` extension to be compiled.

#### Scalar Value Types

A list of all supported basic scalar value types can be found [this link](https://developers.google.com/protocol-buffers/docs/proto3#scalar)

#### Default Values

- Strings: empty string;
- Bytes: empty bytes;
- Bools: false;
- Numeric: zero;
- Enums: the **first defined enum value**, which must be 0;
- Message fields: not defined, language dependant.

#### Additional Data Type Support

- [Duration](https://github.com/protocolbuffers/protobuf/blob/master/src/google/protobuf/duration.proto)
- [Timestamp](https://github.com/protocolbuffers/protobuf/blob/master/src/google/protobuf/timestamp.proto)
- [Interval](https://github.com/googleapis/googleapis/blob/master/google/type/interval.proto)
- [Date](https://github.com/googleapis/googleapis/blob/master/google/type/date.proto)
- [DayOfWeek](https://github.com/googleapis/googleapis/blob/master/google/type/dayofweek.proto)
- [TimeOfDay](https://github.com/googleapis/googleapis/blob/master/google/type/timeofday.proto)
- [LatLng](https://github.com/googleapis/googleapis/blob/master/google/type/latlng.proto)
- [Money](https://github.com/googleapis/googleapis/blob/master/google/type/money.proto)
- [PostalAddress](https://github.com/googleapis/googleapis/blob/master/google/type/postal_address.proto)
- [Color](https://github.com/googleapis/googleapis/blob/master/google/type/color.proto)
- [Month](https://github.com/googleapis/googleapis/blob/master/google/type/month.proto)

## Project Structure

This repository contains some code related to gRPC studies.

It is basically divided into 3 parts:

- common: contains all `.proto` files and generated files by `protoc` plugin;
- grpc_server: contains the code related to the gRPC Dart server;
- grpc_client: contains the code for Flutter client application.
- grpc_client_cli: contains the code for terminal client application

This project uses the "monorepo" pattern, and which is useful because both grpc_client, grpc_client_cli and grpc_server need to access all generated files. So, instead of having a copy of these files in both applications, they were concentrated in `common` package and both clients and server depend on it.

## Prerequisites

To run this project you'll need either Dart SDK, if you want to run only the server and CLI application, or the Flutter SDK, if you want to run both server and Flutter client.
**PS: Flutter SDK already contains the Dart SDK, so it's not necessary to install both**.

If you want to compile the `.proto` files, you will also need to install the _protobuf compiler_. The installation process is described in the [documentation](https://www.grpc.io/docs/languages/dart/quickstart/)

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
