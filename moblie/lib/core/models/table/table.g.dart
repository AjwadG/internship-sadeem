// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Table> _$tableSerializer = new _$TableSerializer();

class _$TableSerializer implements StructuredSerializer<Table> {
  @override
  final Iterable<Type> types = const [Table, _$Table];
  @override
  final String wireName = 'Table';

  @override
  Iterable<Object?> serialize(Serializers serializers, Table object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.is_available;
    if (value != null) {
      result
        ..add('is_available')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.is_needs_service;
    if (value != null) {
      result
        ..add('is_needs_service')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.vendor_id;
    if (value != null) {
      result
        ..add('vendor_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.customer_id;
    if (value != null) {
      result
        ..add('customer_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Table deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TableBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_available':
          result.is_available = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'is_needs_service':
          result.is_needs_service = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'vendor_id':
          result.vendor_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'customer_id':
          result.customer_id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Table extends Table {
  @override
  final String? id;
  @override
  final bool? is_available;
  @override
  final bool? is_needs_service;
  @override
  final String? name;
  @override
  final String? vendor_id;
  @override
  final String? customer_id;

  factory _$Table([void Function(TableBuilder)? updates]) =>
      (new TableBuilder()..update(updates))._build();

  _$Table._(
      {this.id,
      this.is_available,
      this.is_needs_service,
      this.name,
      this.vendor_id,
      this.customer_id})
      : super._();

  @override
  Table rebuild(void Function(TableBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TableBuilder toBuilder() => new TableBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Table &&
        id == other.id &&
        is_available == other.is_available &&
        is_needs_service == other.is_needs_service &&
        name == other.name &&
        vendor_id == other.vendor_id &&
        customer_id == other.customer_id;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, is_available.hashCode);
    _$hash = $jc(_$hash, is_needs_service.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, vendor_id.hashCode);
    _$hash = $jc(_$hash, customer_id.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Table')
          ..add('id', id)
          ..add('is_available', is_available)
          ..add('is_needs_service', is_needs_service)
          ..add('name', name)
          ..add('vendor_id', vendor_id)
          ..add('customer_id', customer_id))
        .toString();
  }
}

class TableBuilder implements Builder<Table, TableBuilder> {
  _$Table? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _is_available;
  bool? get is_available => _$this._is_available;
  set is_available(bool? is_available) => _$this._is_available = is_available;

  bool? _is_needs_service;
  bool? get is_needs_service => _$this._is_needs_service;
  set is_needs_service(bool? is_needs_service) =>
      _$this._is_needs_service = is_needs_service;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _vendor_id;
  String? get vendor_id => _$this._vendor_id;
  set vendor_id(String? vendor_id) => _$this._vendor_id = vendor_id;

  String? _customer_id;
  String? get customer_id => _$this._customer_id;
  set customer_id(String? customer_id) => _$this._customer_id = customer_id;

  TableBuilder();

  TableBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _is_available = $v.is_available;
      _is_needs_service = $v.is_needs_service;
      _name = $v.name;
      _vendor_id = $v.vendor_id;
      _customer_id = $v.customer_id;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Table other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Table;
  }

  @override
  void update(void Function(TableBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Table build() => _build();

  _$Table _build() {
    final _$result = _$v ??
        new _$Table._(
            id: id,
            is_available: is_available,
            is_needs_service: is_needs_service,
            name: name,
            vendor_id: vendor_id,
            customer_id: customer_id);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
