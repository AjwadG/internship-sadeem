// ignore_for_file: unawaited_futures, nullable_type_in_catch_clause, unused_local_variable, deprecated_member_use

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:internship/core/constant/constants.dart';
import '/core/exceptions/network_exception.dart';
import '/core/services/http/http_service.dart';
import '/core/services/key_storage/key_storage_service.dart';
import '/core/utils/file_helper.dart';
import '/core/utils/network_utils.dart' as network_utils;
import '/locator.dart';
import '../../enums/http_request_type.dart';

/// Helper service that abstracts away common HTTP Requests
class HttpServiceImpl implements HttpService {
  final FileHelper? _fileHelper = locator<FileHelper>();

  final _log = Logger('HttpServiceImpl');
  final _dio = Dio();

  @override
  Future<dynamic> getHttp(
      String route, dynamic parameters, bool is_error_dialog) async {
    print('parameters type: ${parameters.runtimeType}');

    Response response;
    parameters ??= {};


    _log.fine('Sending GET to $route with $parameters');


    _dio.options.headers['content-Type'] = 'application/json';

    addToken();

    if (Constants.isHttpLogON) {
      _log.fine('headers => ${_dio.options.headers}');
    }

    try {
      final fullRoute = '$route';
      response = await _dio.get(
        fullRoute,
        queryParameters: parameters,
      );
    } on DioError catch (e) {
      if (Constants.isHttpLogON) {
        _log.severe('HttpService: Failed to GET ${e.message}');
        _log.severe('HttpService: Failed to GET ${e.response}');
      }

      await network_utils.checkForNetworkExceptions(
          e.response!, is_error_dialog);

      throw NetworkException(e.message);
    }

    if (Constants.isHttpLogON) {
      _log.shout(response);
    }

    network_utils.checkForNetworkExceptions(response, is_error_dialog);

    // For this specific API its decodes json for us
    return response.data;
  }

  @override
  Future<dynamic> postHttp(
      String route, dynamic body, bool is_error_dialog) async {
    Response? response;

    print('parameters type: ${body.runtimeType}');

    if (Constants.isHttpLogON) {
      _log.fine('Sending Post to $route with $body');
    }
    _dio.options.headers['content-Type'] = 'application/json';

    addToken();

    try {
      final fullRoute = '$route';

      response = await _dio.post(
        fullRoute,
        data: body,
        //queryParameters: body,
        onSendProgress: network_utils.showLoadingProgress,
        onReceiveProgress: network_utils.showLoadingProgress,
      );
    } on DioError catch (e) {

      if (Constants.isHttpLogON) {
        _log.shout('HttpService:  ${e.message}');
        _log.shout('HttpService:  ${e.response}');
      }

      if (e.response!.statusCode! >= 400 && e.response!.statusCode! <= 500) {
        network_utils.checkForNetworkExceptions(e.response!, is_error_dialog);
      }

      throw NetworkException(e.message);
    }

    if (Constants.isHttpLogON) {
      _log.shout(response);
    }

    // For this specific API its decodes json for us
    return response.data;
  }

  @override
  Future<dynamic> putHttp(String route, dynamic body, is_error_dialog) async {
    Response? response;

    try {
      final fullRoute = '$route';
      response = await _dio.put(
        fullRoute,
        data: body,
        //queryParameters: body,
        onSendProgress: network_utils.showLoadingProgress,
        onReceiveProgress: network_utils.showLoadingProgress,
      );
    } on DioError catch (e) {
      if (Constants.isHttpLogON) {
        _log.shout('HttpService:  ${e.message}');
        _log.shout('HttpService:  ${e.response}');
      }

      network_utils.checkForNetworkExceptions(e.response!, is_error_dialog);

      throw NetworkException(e.message);
    }

    if (Constants.isHttpLogON) {
      _log.shout(response);
    }

    // For this specific API its decodes json for us
    return response.data;
  }

  @override
  Future<dynamic> patchHttp(
      String route, dynamic body, bool is_error_dialog) async {
    Response response;

    if (Constants.isHttpLogON) {
      _log.fine('Sending PATCH $body to $route');
    }
    _dio.options.headers['content-Type'] = 'application/json';
    addToken();

    try {
      final fullRoute = '$route';
      response = await _dio.patch(
        fullRoute,
        data: body,
        queryParameters: body,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        onSendProgress: network_utils.showLoadingProgress,
        onReceiveProgress: network_utils.showLoadingProgress,
      );
    } on DioError catch (e) {
      if (e.response!.statusCode !=
          405) // method is not supported for this route
          {
        if (body != null) {}
      }
      if (Constants.isHttpLogON) {
        _log.severe('HttpService: Failed to POST ${e.message}');
      }

      throw NetworkException(e.message);
    }

    network_utils.checkForNetworkExceptions(response, is_error_dialog);

    return response.data;
  }

  @override
  Future<dynamic> deleteHttp(
      String route, dynamic body, bool is_error_dialog) async {
    Response response;

    if (Constants.isHttpLogON) {
      _log.fine('Sending DELETE $body to $route');
    }
    _dio.options.headers['content-Type'] = 'application/json';
    addToken();

    try {
      final fullRoute = '$route';
      response = await _dio.delete(
        fullRoute,
        data: body,
        queryParameters: body,
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
    } on DioError catch (e) {
      if (e.response!.statusCode !=
          405) // method is not supported for this route
          {
        if (body != null) {}
      }
      if (Constants.isHttpLogON) {
        _log.severe('HttpService: Failed to DELETE ${e.message}');
      }

      throw NetworkException(e.message);
    }

    network_utils.checkForNetworkExceptions(response, is_error_dialog);

    return response.data;
  }

  @override
  Future<dynamic> postHttpForm(String route, dynamic body,
      List<PlatformFile> paths, bool is_error_dialog) async {
    var index = 0;

    _dio.options.headers['content-Type'] = 'application/json';

    addToken();

    if (Constants.isHttpLogON) {
      _log.fine('Sending POST $body');
      _log.fine('to $route');
      _log.fine('headers => ${_dio.options.headers}');
    }

    final formData = FormData.fromMap(body);

    if (!kIsWeb) {
      paths.forEach((file) async {
        if (file.path != null) {
          final mFile =
          await _fileHelper!.convertFileToMultipartFile(File(file.path!));

          formData.files.add(MapEntry('img', mFile));
        }
        index++;
      });
    } else {
      paths.forEach((file) async {
        formData.files.add(MapEntry(
            'img',
            MultipartFile.fromBytes(
              file.bytes!,
              filename: 'file.png',
            )));
        index++;
      });
    }

    final data = await postHttp(route, formData, is_error_dialog);

    if (Constants.isHttpLogON) {
      _log.shout(data.toString());
    }
    return data;
  }

  @override
  Future<dynamic> putHttpForm(String route, Map<String, dynamic> body,
      List<PlatformFile> paths, bool is_error_dialog) async {
    _dio.options.headers['content-Type'] = 'application/json';

    addToken();

    print('Constants.isHttpLogON');
    if (Constants.isHttpLogON) {
      print('Sending PUT $body');
      _log.fine('to $route');
      _log.fine('headers => ${_dio.options.headers}');
    }

    var index = 0;

    final formData = FormData.fromMap(body);
    if (!kIsWeb) {
      paths.forEach((file) async {
        if (file.path != null) {
          final mFile =
          await _fileHelper!.convertFileToMultipartFile(File(file.path!));

          formData.files.add(MapEntry('img', mFile));
        }
        index++;
      });
    } else {
      paths.forEach((file) async {
        formData.files.add(MapEntry(
            'img',
            MultipartFile.fromBytes(
              file.bytes!,
              filename: 'file.png',
            )));
        index++;
      });
    }

    _log.fine('to ' + formData.files.toString());

    final data = await putHttp(route, formData, is_error_dialog);

    if (Constants.isHttpLogON) {
      _log.shout(data.toString());
    }
    return data;
  }

  @override
  Future<File> downloadFile(String fileUrl) async {
    Response response;

    final file = await _fileHelper!.getFileFromUrl(fileUrl);

    try {
      response = await _dio.download(
        fileUrl,
        file.path,
        onReceiveProgress: network_utils.showLoadingProgress,
      );
    } on DioError catch (e) {
      if (Constants.isHttpLogON) {
        _log.severe('HttpService: Failed to download file ${e.message}');
      }
      throw NetworkException(e.message);
    }

    return file;
  }

  void addToken() async {
    if (locator<KeyStorageService>().token!.isNotEmpty) {
      _dio.options.headers['Authorization'] =
      'Bearer ${locator<KeyStorageService>().token}';
    } else {
      _dio.options.headers.remove('Cookie');
      _dio.options.headers.remove('Authorization');
    }
  }

  @override
  void dispose() {
    _dio.clear();
    _dio.close(force: true);
  }

  @override
  Future sendRequest(HTTPMethodType requestType, String route, parameters,
      List<PlatformFile>? paths, bool is_error_dialog) async {
    Map<String, dynamic> response;

    switch (requestType) {
      case HTTPMethodType.PUT_FORM_DATA:
        response =
        await putHttpForm(route, parameters, paths ?? [], is_error_dialog);
        break;

      case HTTPMethodType.POST:
        response = await postHttp(route, parameters, is_error_dialog);
        break;
      case HTTPMethodType.GET:
        response = await getHttp(route, parameters, is_error_dialog);

        break;
      case HTTPMethodType.PUT:
        response = await putHttp(
          route,
          parameters,
          is_error_dialog,
        );

        break;
      case HTTPMethodType.DELETE:
        response = await deleteHttp(route, parameters, is_error_dialog);
        break;
      case HTTPMethodType.POST_FORM_DATA:
        response =
        await postHttpForm(route, parameters, paths ?? [], is_error_dialog);
        break;
    }

    return response;
  }
}
