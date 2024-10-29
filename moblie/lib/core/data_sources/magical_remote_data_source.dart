import 'dart:async';

import 'package:file_picker/file_picker.dart';

import '/core/services/http/http_service.dart';
import '/locator.dart';
import '../enums/http_request_type.dart';
import '../models/base_model.dart';

abstract class MagicalRemoteDataSource {
  Future<dynamic> handelRequest<T extends BaseModel>(
      {required BaseModel model,
      required dynamic parameters,
      required HTTPMethodType http_method_type,
      required String url,
      String? specific_key,
      bool is_error_dialog = true,
      List<PlatformFile>? paths});
}

class MagicalRemoteDataSourceImpl implements MagicalRemoteDataSource {
  @override
  Future handelRequest<T extends BaseModel>(
      {required BaseModel model,
      required dynamic parameters,
      required HTTPMethodType http_method_type,
      required String url,
      String? specific_key,
      bool is_error_dialog = true,
      List<PlatformFile>? paths}) async {
    var response = await locator<HttpService>().sendRequest(
        http_method_type, url, parameters, paths, is_error_dialog);

    if (specific_key != null) {
      response = response[specific_key];
    }

    if (response is List) {
      return response.map<T>((itemMap) => model.fromMap(itemMap)).toList();
    } else {
      return model.fromMap(response);
    }
  }
}
