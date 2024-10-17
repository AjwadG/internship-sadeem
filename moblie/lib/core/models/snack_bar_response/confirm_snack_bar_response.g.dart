// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_snack_bar_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConfirmSnackBarResponse extends ConfirmSnackBarResponse {
  @override
  final bool? confirmed;

  factory _$ConfirmSnackBarResponse(
          [void Function(ConfirmSnackBarResponseBuilder)? updates]) =>
      (new ConfirmSnackBarResponseBuilder()..update(updates))._build();

  _$ConfirmSnackBarResponse._({this.confirmed}) : super._();

  @override
  ConfirmSnackBarResponse rebuild(
          void Function(ConfirmSnackBarResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfirmSnackBarResponseBuilder toBuilder() =>
      new ConfirmSnackBarResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfirmSnackBarResponse && confirmed == other.confirmed;
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
    return (newBuiltValueToStringHelper(r'ConfirmSnackBarResponse')
          ..add('confirmed', confirmed))
        .toString();
  }
}

class ConfirmSnackBarResponseBuilder
    implements
        Builder<ConfirmSnackBarResponse, ConfirmSnackBarResponseBuilder> {
  _$ConfirmSnackBarResponse? _$v;

  bool? _confirmed;
  bool? get confirmed => _$this._confirmed;
  set confirmed(bool? confirmed) => _$this._confirmed = confirmed;

  ConfirmSnackBarResponseBuilder();

  ConfirmSnackBarResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _confirmed = $v.confirmed;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConfirmSnackBarResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConfirmSnackBarResponse;
  }

  @override
  void update(void Function(ConfirmSnackBarResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConfirmSnackBarResponse build() => _build();

  _$ConfirmSnackBarResponse _build() {
    final _$result =
        _$v ?? new _$ConfirmSnackBarResponse._(confirmed: confirmed);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
