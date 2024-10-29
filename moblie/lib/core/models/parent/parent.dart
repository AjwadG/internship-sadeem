import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '/core/models/serializers.dart';

/// An example post model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///
///
part 'parent.g.dart';

abstract class Parent implements Built<Parent, ParentBuilder> {
  String? get sos;
  // String? get name;

  String toJson() {
    return json.encode(serializers.serializeWith(Parent.serializer, this));
  }

  Map<String, dynamic>? toMap() {
    return serializers.serializeWith(Parent.serializer, this)
        as Map<String, dynamic>?;
  }

  factory Parent.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Parent.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Parent.fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      Parent.serializer,
      map,
    )!;
  }

  Parent._();

  factory Parent([void Function(ParentBuilder)? updates]) = _$Parent;

  static Serializer<Parent> get serializer => _$parentSerializer;
}
