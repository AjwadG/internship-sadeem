import 'package:flutter/material.dart';
import 'package:internship/core/models/table/table.dart' as T;
import 'package:internship/ui/widgets/stateful/vendor_items/view.dart';
import 'package:stacked/stacked.dart';

class TableCardViewModel extends BaseViewModel {
  T.Table? table;
  BuildContext? context;

  Future<void> init(BuildContext context, T.Table table) async {
    setBusy(true);
    notifyListeners();
    this.table = table;
    this.context = context;
    setBusy(false);
  }

  void moveToTable() {
    ///
    showModalBottomSheet(
      context: context!,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => VendorItemsView(vendor_id: table!.vendor_id!),
    );
  }
}
