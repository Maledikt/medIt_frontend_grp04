import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../error/failure.dart';

abstract class RestClient {
  Future<Either<ServerFailure, Map<String, dynamic>>> get(Uri url);
}

class RestClientImpl implements RestClient {
  final http.Client client;

  RestClientImpl({required this.client});

  @override
  Future<Either<ServerFailure, Map<String, dynamic>>> get(Uri url) async {
    print("Try to call $url");
    late final http.Response response;
    try {
      response = await client.get(url);
    }on SocketException{
      return const Left(ServerFailure(statusCode: -1, message: "Socket Exception - Server down?"));
    }

    if (response.statusCode == 200) {
      return Right(json.decode(response.body));
    } else {
      final Map<String, dynamic> body = jsonDecode(response.body);
      return Left(ServerFailure(statusCode: response.statusCode, message: body.containsKey("detail") ? body["detail"] : "Unknown error: ${response.body}"));
    }
  }
}
