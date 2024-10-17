import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '/core/models/serializers.dart';

part 'settings.g.dart';

/// An example post model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class Settings implements Built<Settings, SettingsBuilder> {
  String? get about;

  String? get rules;

  String toJson() {
    return json.encode(serializers.serializeWith(Settings.serializer, this));
  }

  Map<String, dynamic>? toMap() {
    return serializers.serializeWith(Settings.serializer, this)
        as Map<String, dynamic>?;
  }

  factory Settings.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Settings.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Settings.fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      Settings.serializer,
      map,
    )!;
  }

  Settings._();

  factory Settings([void Function(SettingsBuilder)? updates]) = _$Settings;

  static Serializer<Settings> get serializer => _$settingsSerializer;
}
