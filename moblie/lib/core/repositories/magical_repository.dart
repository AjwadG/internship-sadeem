import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:logging/logging.dart';
import '/core/exceptions/cache_exception.dart';
import '/core/exceptions/network_exception.dart';
import '/core/exceptions/repository_exception.dart';
import '/locator.dart';
import '../data_sources/magical_remote_data_source.dart';
import '../enums/http_request_type.dart';
import '../models/base_model.dart';

abstract class MagicalRepository {
  Future<dynamic> handelRequest<T extends dynamic>(
      {required BaseModel model,
      required dynamic parameters,
      required HTTPMethodType methodType,
      String? specific_key,
      bool is_error_dialog = true,
      required String route,
      List<PlatformFile> paths});
}

class MagicalRepositoryImpl implements MagicalRepository {
  final MagicalRemoteDataSource? remoteDataSource =
      locator<MagicalRemoteDataSource>();

  final _log = Logger('MagicalRepositoryImpl');

  @override
  Future handelRequest<T extends dynamic>(
      {required BaseModel model,
      required dynamic parameters,
      required HTTPMethodType methodType,
      required String route,
      String? specific_key,
      bool is_error_dialog = true,
      List<PlatformFile>? paths}) async {
    try {
      return await locator<MagicalRemoteDataSource>().handelRequest<BaseModel>(
          model: model,
          parameters: parameters,
          url: route,
          specific_key: specific_key,
          http_method_type: methodType,
          paths: paths,
          is_error_dialog: is_error_dialog,

      );
    } on NetworkException catch (e) {
      _log.severe('Failed to fetch remotely');
      _log.severe(e.message);
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.severe('Failed to fetch locally');
      _log.severe(e.message);
      throw RepositoryException(e.message);
    } on Exception catch (e) {
      _log.severe('Failed to fetch ');
      _log.severe(e);
    }

    throw RepositoryException('Undefined error');
  }
}
