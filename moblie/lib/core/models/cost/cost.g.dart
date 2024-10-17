// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cost.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Cost> _$costSerializer = new _$CostSerializer();

class _$CostSerializer implements StructuredSerializer<Cost> {
  @override
  final Iterable<Type> types = const [Cost, _$Cost];
  @override
  final String wireName = 'Cost';

  @override
  Iterable<Object?> serialize(Serializers serializers, Cost object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.area_price;
    if (value != null) {
      result
        ..add('area_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.base_price;
    if (value != null) {
      result
        ..add('base_price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.total_cost;
    if (value != null) {
      result
        ..add('total_cost')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.max_free_extra_meters;
    if (value != null) {
      result
        ..add('max_free_extra_meters')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.extra_meters_rate;
    if (value != null) {
      result
        ..add('extra_meters_rate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.hourly_rate;
    if (value != null) {
      result
        ..add('hourly_rate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.max_driver_wait_minutes;
    if (value != null) {
      result
        ..add('max_driver_wait_minutes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.max_free_customer_cancel_minutes;
    if (value != null) {
      result
        ..add('max_free_customer_cancel_minutes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.luxury_percent;
    if (value != null) {
      result
        ..add('luxury_percent')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.trip_minimum_arrive_distance;
    if (value != null) {
      result
        ..add('trip_minimum_arrive_distance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.trip_minimum_dropoff_distance;
    if (value != null) {
      result
        ..add('trip_minimum_dropoff_distance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    return result;
  }

  @override
  Cost deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CostBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'area_price':
          result.area_price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'base_price':
          result.base_price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'total_cost':
          result.total_cost = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'max_free_extra_meters':
          result.max_free_extra_meters = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'extra_meters_rate':
          result.extra_meters_rate = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'hourly_rate':
          result.hourly_rate = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'max_driver_wait_minutes':
          result.max_driver_wait_minutes = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'max_free_customer_cancel_minutes':
          result.max_free_customer_cancel_minutes = serializers.deserialize(
              value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'luxury_percent':
          result.luxury_percent = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'trip_minimum_arrive_distance':
          result.trip_minimum_arrive_distance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'trip_minimum_dropoff_distance':
          result.trip_minimum_dropoff_distance = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
      }
    }

    return result.build();
  }
}

class _$Cost extends Cost {
  @override
  final double? area_price;
  @override
  final double? base_price;
  @override
  final double? total_cost;
  @override
  final double? max_free_extra_meters;
  @override
  final double? extra_meters_rate;
  @override
  final double? hourly_rate;
  @override
  final double? max_driver_wait_minutes;
  @override
  final double? max_free_customer_cancel_minutes;
  @override
  final double? luxury_percent;
  @override
  final double? trip_minimum_arrive_distance;
  @override
  final double? trip_minimum_dropoff_distance;

  factory _$Cost([void Function(CostBuilder)? updates]) =>
      (new CostBuilder()..update(updates))._build();

  _$Cost._(
      {this.area_price,
      this.base_price,
      this.total_cost,
      this.max_free_extra_meters,
      this.extra_meters_rate,
      this.hourly_rate,
      this.max_driver_wait_minutes,
      this.max_free_customer_cancel_minutes,
      this.luxury_percent,
      this.trip_minimum_arrive_distance,
      this.trip_minimum_dropoff_distance})
      : super._();

  @override
  Cost rebuild(void Function(CostBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CostBuilder toBuilder() => new CostBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Cost &&
        area_price == other.area_price &&
        base_price == other.base_price &&
        total_cost == other.total_cost &&
        max_free_extra_meters == other.max_free_extra_meters &&
        extra_meters_rate == other.extra_meters_rate &&
        hourly_rate == other.hourly_rate &&
        max_driver_wait_minutes == other.max_driver_wait_minutes &&
        max_free_customer_cancel_minutes ==
            other.max_free_customer_cancel_minutes &&
        luxury_percent == other.luxury_percent &&
        trip_minimum_arrive_distance == other.trip_minimum_arrive_distance &&
        trip_minimum_dropoff_distance == other.trip_minimum_dropoff_distance;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, area_price.hashCode);
    _$hash = $jc(_$hash, base_price.hashCode);
    _$hash = $jc(_$hash, total_cost.hashCode);
    _$hash = $jc(_$hash, max_free_extra_meters.hashCode);
    _$hash = $jc(_$hash, extra_meters_rate.hashCode);
    _$hash = $jc(_$hash, hourly_rate.hashCode);
    _$hash = $jc(_$hash, max_driver_wait_minutes.hashCode);
    _$hash = $jc(_$hash, max_free_customer_cancel_minutes.hashCode);
    _$hash = $jc(_$hash, luxury_percent.hashCode);
    _$hash = $jc(_$hash, trip_minimum_arrive_distance.hashCode);
    _$hash = $jc(_$hash, trip_minimum_dropoff_distance.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Cost')
          ..add('area_price', area_price)
          ..add('base_price', base_price)
          ..add('total_cost', total_cost)
          ..add('max_free_extra_meters', max_free_extra_meters)
          ..add('extra_meters_rate', extra_meters_rate)
          ..add('hourly_rate', hourly_rate)
          ..add('max_driver_wait_minutes', max_driver_wait_minutes)
          ..add('max_free_customer_cancel_minutes',
              max_free_customer_cancel_minutes)
          ..add('luxury_percent', luxury_percent)
          ..add('trip_minimum_arrive_distance', trip_minimum_arrive_distance)
          ..add('trip_minimum_dropoff_distance', trip_minimum_dropoff_distance))
        .toString();
  }
}

class CostBuilder implements Builder<Cost, CostBuilder> {
  _$Cost? _$v;

  double? _area_price;
  double? get area_price => _$this._area_price;
  set area_price(double? area_price) => _$this._area_price = area_price;

  double? _base_price;
  double? get base_price => _$this._base_price;
  set base_price(double? base_price) => _$this._base_price = base_price;

  double? _total_cost;
  double? get total_cost => _$this._total_cost;
  set total_cost(double? total_cost) => _$this._total_cost = total_cost;

  double? _max_free_extra_meters;
  double? get max_free_extra_meters => _$this._max_free_extra_meters;
  set max_free_extra_meters(double? max_free_extra_meters) =>
      _$this._max_free_extra_meters = max_free_extra_meters;

  double? _extra_meters_rate;
  double? get extra_meters_rate => _$this._extra_meters_rate;
  set extra_meters_rate(double? extra_meters_rate) =>
      _$this._extra_meters_rate = extra_meters_rate;

  double? _hourly_rate;
  double? get hourly_rate => _$this._hourly_rate;
  set hourly_rate(double? hourly_rate) => _$this._hourly_rate = hourly_rate;

  double? _max_driver_wait_minutes;
  double? get max_driver_wait_minutes => _$this._max_driver_wait_minutes;
  set max_driver_wait_minutes(double? max_driver_wait_minutes) =>
      _$this._max_driver_wait_minutes = max_driver_wait_minutes;

  double? _max_free_customer_cancel_minutes;
  double? get max_free_customer_cancel_minutes =>
      _$this._max_free_customer_cancel_minutes;
  set max_free_customer_cancel_minutes(
          double? max_free_customer_cancel_minutes) =>
      _$this._max_free_customer_cancel_minutes =
          max_free_customer_cancel_minutes;

  double? _luxury_percent;
  double? get luxury_percent => _$this._luxury_percent;
  set luxury_percent(double? luxury_percent) =>
      _$this._luxury_percent = luxury_percent;

  double? _trip_minimum_arrive_distance;
  double? get trip_minimum_arrive_distance =>
      _$this._trip_minimum_arrive_distance;
  set trip_minimum_arrive_distance(double? trip_minimum_arrive_distance) =>
      _$this._trip_minimum_arrive_distance = trip_minimum_arrive_distance;

  double? _trip_minimum_dropoff_distance;
  double? get trip_minimum_dropoff_distance =>
      _$this._trip_minimum_dropoff_distance;
  set trip_minimum_dropoff_distance(double? trip_minimum_dropoff_distance) =>
      _$this._trip_minimum_dropoff_distance = trip_minimum_dropoff_distance;

  CostBuilder();

  CostBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _area_price = $v.area_price;
      _base_price = $v.base_price;
      _total_cost = $v.total_cost;
      _max_free_extra_meters = $v.max_free_extra_meters;
      _extra_meters_rate = $v.extra_meters_rate;
      _hourly_rate = $v.hourly_rate;
      _max_driver_wait_minutes = $v.max_driver_wait_minutes;
      _max_free_customer_cancel_minutes = $v.max_free_customer_cancel_minutes;
      _luxury_percent = $v.luxury_percent;
      _trip_minimum_arrive_distance = $v.trip_minimum_arrive_distance;
      _trip_minimum_dropoff_distance = $v.trip_minimum_dropoff_distance;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Cost other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Cost;
  }

  @override
  void update(void Function(CostBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Cost build() => _build();

  _$Cost _build() {
    final _$result = _$v ??
        new _$Cost._(
            area_price: area_price,
            base_price: base_price,
            total_cost: total_cost,
            max_free_extra_meters: max_free_extra_meters,
            extra_meters_rate: extra_meters_rate,
            hourly_rate: hourly_rate,
            max_driver_wait_minutes: max_driver_wait_minutes,
            max_free_customer_cancel_minutes: max_free_customer_cancel_minutes,
            luxury_percent: luxury_percent,
            trip_minimum_arrive_distance: trip_minimum_arrive_distance,
            trip_minimum_dropoff_distance: trip_minimum_dropoff_distance);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
