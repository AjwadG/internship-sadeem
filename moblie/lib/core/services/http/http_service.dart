import 'dart:io';

import 'package:file_picker/file_picker.dart';

import '../../enums/http_request_type.dart';

abstract class HttpService {


  Future<dynamic> sendRequest(
    HTTPMethodType requestType,
    String route,
      dynamic parameters,
    List<PlatformFile>? paths,
      bool  is_error_dialog
  );

  /// Send GET request to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if GET fails
  Future<dynamic> getHttp(String route, dynamic parameters,  bool  is_error_dialog);

  /// Send POST request with [body] to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if POST request fails
  Future<dynamic> postHttp(String route, dynamic body,  bool  is_error_dialog);

  Future<dynamic> putHttp(String route, dynamic body,bool is_error_dialog);

  /// Send PATCH request with [body] to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if patch request fails
  Future<dynamic> patchHttp(String route, dynamic body,  bool  is_error_dialog);

  Future<dynamic> deleteHttp(String route, dynamic body,  bool  is_error_dialog);

  /// Send POST request with [files] to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if posting form fails
  Future<dynamic> postHttpForm(
    String route,
    Map<String, dynamic> body,
    List<PlatformFile> paths,
     bool  is_error_dialog);

  Future<dynamic> putHttpForm(
    String route,
    Map<String, dynamic> body,
    List<PlatformFile> paths,
    bool  is_error_dialog);

  /// Download file from [fileUrl] and return the File
  ///
  /// - throws `NetworkException` if file download fails
  Future<File> downloadFile(String fileUrl);

  void dispose();
}
