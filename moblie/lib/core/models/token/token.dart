import 'dart:convert';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '/core/models/serializers.dart';
import '../base_model.dart';

part 'token.g.dart';

/// An example token model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class Token implements Built<Token, TokenBuilder>, BaseModel<Token> {
  String? get token;

  @override
  String toJson() {
    return json.encode(serializers.serializeWith(Token.serializer, this));
  }

  @override
  Map<String, dynamic>? toMap() {
    return serializers.serializeWith(Token.serializer, this)
        as Map<String, dynamic>?;
  }

  factory Token.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Token.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Token.fromMap(Map<String, dynamic> map) {
    return serializers.deserializeWith(
      Token.serializer,
      map,
    )!;
  }

  @override
  Token fromJson(String jsonString) => Token.fromJson(jsonString);

  @override
  Token fromMap(Map<String, dynamic> map) => Token.fromMap(map);

  Token._();

  static Serializer<Token> get serializer => _$tokenSerializer;

  factory Token([void Function(TokenBuilder)? updates]) = _$Token;
}
