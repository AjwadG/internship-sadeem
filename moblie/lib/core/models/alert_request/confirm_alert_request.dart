import 'package:built_value/built_value.dart';

import '/core/models/alert_request/alert_request.dart';

part 'confirm_alert_request.g.dart';

abstract class ConfirmAlertRequest extends AlertRequest
    implements Built<ConfirmAlertRequest, ConfirmAlertRequestBuilder> {
  String get title;

  bool? get dismissible;

  String get description;

  String get buttonConfirmTitle;

  String get buttonCancelTitle;

  ConfirmAlertRequest._();

  factory ConfirmAlertRequest(
          [void Function(ConfirmAlertRequestBuilder) updates]) =
      _$ConfirmAlertRequest;
}
