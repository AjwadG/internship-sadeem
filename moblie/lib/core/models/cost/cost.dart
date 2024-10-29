import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:internship/core/models/base_model.dart';

import '/core/models/serializers.dart';

/// An example post model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///
///
part 'cost.g.dart';

abstract class Cost implements Built<Cost, CostBuilder>, BaseModel<Cost> {
  double? get area_price;

  double? get base_price;

  double? get total_cost;

  double? get max_free_extra_meters;

  double? get extra_meters_rate;

  double? get hourly_rate;

  double? get max_driver_wait_minutes;

  double? get max_free_customer_cancel_minutes;

  double? get luxury_percent;

  double? get trip_minimum_arrive_distance;

  double? get trip_minimum_dropoff_distance;

  @override
  String toJson() {
    return json.encode(serializers.serializeWith(Cost.serializer, this));
  }

  @override
  Map<String, dynamic>? toMap() {
    return serializers.serializeWith(Cost.serializer, this)
        as Map<String, dynamic>?;
  }

  factory Cost.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Cost.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Cost.fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(
      Cost.serializer,
      map,
    )!;
  }

  @override
  Cost fromJson(String jsonString) => Cost.fromJson(jsonString);

  @override
  Cost fromMap(Map<String, dynamic> map) => Cost.fromMap(map);

  Cost._();

  static Serializer<Cost> get serializer => _$costSerializer;

  factory Cost([void Function(CostBuilder)? updates]) = _$Cost;
}
