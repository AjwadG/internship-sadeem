// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parent.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Parent> _$parentSerializer = new _$ParentSerializer();

class _$ParentSerializer implements StructuredSerializer<Parent> {
  @override
  final Iterable<Type> types = const [Parent, _$Parent];
  @override
  final String wireName = 'Parent';

  @override
  Iterable<Object?> serialize(Serializers serializers, Parent object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.sos;
    if (value != null) {
      result
        ..add('sos')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Parent deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ParentBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'sos':
          result.sos = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$Parent extends Parent {
  @override
  final String? sos;

  factory _$Parent([void Function(ParentBuilder)? updates]) =>
      (new ParentBuilder()..update(updates))._build();

  _$Parent._({this.sos}) : super._();

  @override
  Parent rebuild(void Function(ParentBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ParentBuilder toBuilder() => new ParentBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Parent && sos == other.sos;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, sos.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Parent')..add('sos', sos)).toString();
  }
}

class ParentBuilder implements Builder<Parent, ParentBuilder> {
  _$Parent? _$v;

  String? _sos;
  String? get sos => _$this._sos;
  set sos(String? sos) => _$this._sos = sos;

  ParentBuilder();

  ParentBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sos = $v.sos;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Parent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Parent;
  }

  @override
  void update(void Function(ParentBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Parent build() => _build();

  _$Parent _build() {
    final _$result = _$v ?? new _$Parent._(sos: sos);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
