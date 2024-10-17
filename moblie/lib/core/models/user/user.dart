import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import '/core/models/serializers.dart';
import '../base_model.dart';

part 'user.g.dart';

/// An example user model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class User implements Built<User, UserBuilder>, BaseModel<User> {
  String? get id;

  String? get phone;

  String? get email;

  String? get img;


  String? get password;

  String? get name;

  BuiltList<int>? get roles;

  DateTime? get created_at;

  DateTime? get updated_at;



  @override
  String toJson() {
    return json.encode(serializers.serializeWith(User.serializer, this));
  }

  @override
  Map<String, dynamic>? toMap() {
    return serializers.serializeWith(User.serializer, this)
        as Map<String, dynamic>?;
  }

  factory User.fromJson(String jsonString) {
    return serializers.deserializeWith(
      User.serializer,
      json.decode(jsonString),
    )!;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      User.serializer,
      map,
    )!;
  }

  @override
  User fromJson(String jsonString) => User.fromJson(jsonString);

  @override
  User fromMap(Map<String, dynamic> map) => User.fromMap(map);

  User._();

  static Serializer<User> get serializer => _$userSerializer;

  factory User([void Function(UserBuilder)? updates]) = _$User;
}
