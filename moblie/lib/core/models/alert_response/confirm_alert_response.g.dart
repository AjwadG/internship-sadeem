// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_alert_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConfirmAlertResponse extends ConfirmAlertResponse {
  @override
  final bool confirmed;

  factory _$ConfirmAlertResponse(
          [void Function(ConfirmAlertResponseBuilder)? updates]) =>
      (new ConfirmAlertResponseBuilder()..update(updates))._build();

  _$ConfirmAlertResponse._({required this.confirmed}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        confirmed, r'ConfirmAlertResponse', 'confirmed');
  }

  @override
  ConfirmAlertResponse rebuild(
          void Function(ConfirmAlertResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfirmAlertResponseBuilder toBuilder() =>
      new ConfirmAlertResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfirmAlertResponse && confirmed == other.confirmed;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, confirmed.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConfirmAlertResponse')
          ..add('confirmed', confirmed))
        .toString();
  }
}

class ConfirmAlertResponseBuilder
    implements Builder<ConfirmAlertResponse, ConfirmAlertResponseBuilder> {
  _$ConfirmAlertResponse? _$v;

  bool? _confirmed;
  bool? get confirmed => _$this._confirmed;
  set confirmed(bool? confirmed) => _$this._confirmed = confirmed;

  ConfirmAlertResponseBuilder();

  ConfirmAlertResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _confirmed = $v.confirmed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConfirmAlertResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConfirmAlertResponse;
  }

  @override
  void update(void Function(ConfirmAlertResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConfirmAlertResponse build() => _build();

  _$ConfirmAlertResponse _build() {
    final _$result = _$v ??
        new _$ConfirmAlertResponse._(
            confirmed: BuiltValueNullFieldError.checkNotNull(
                confirmed, r'ConfirmAlertResponse', 'confirmed'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
