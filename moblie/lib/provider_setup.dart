import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:internship/core/enums/connectivity_status.dart';
import 'package:internship/core/services/connectivity/connectivity_service.dart';
import 'package:internship/locator.dart';

/// List of providers that provider transforms into a widget tree
/// with the main app as the child of that tree, so that the entire
/// app can use these streams anywhere there is a [BuildContext]
List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [];

List<SingleChildWidget> dependentServices = [];

List<SingleChildWidget> uiConsumableProviders = [
  StreamProvider<ConnectivityStatus>(
      create: (context) => locator<ConnectivityService>().connectivity$,
      initialData: ConnectivityStatus.Cellular),
];
