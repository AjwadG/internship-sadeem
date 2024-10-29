import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:internship/core/models/vendor/vendor.dart';
import 'package:internship/ui/views/user/main/vendor_list_view.dart';
import 'package:internship/ui/views/user/vendor/table_list_view.dart';
import 'package:internship/ui/widgets/stateful/vendor_card/view.dart';
import 'package:internship/ui/widgets/stateless/app_bar.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/stateful/drawer/customer_drawer_menu.dart';
import 'vendor_view_model.dart';

@RoutePage()
class VendorView extends StatefulWidget {
  final Vendor vendor;

  const VendorView({Key? key, required this.vendor}) : super(key: key);
  @override
  _VendorViewState createState() => _VendorViewState();
}

class _VendorViewState extends State<VendorView> {
  // LocationData? currentLocation;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VendorViewModel>.reactive(
      onViewModelReady: (model) async {
        await model.init(
          context,
          widget.vendor,
        );
      },
      viewModelBuilder: () => VendorViewModel(),
      builder: (context, model, child) => model.isBusy
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              drawer: CustomerDrawerMenu(),
              appBar: MyAppBar(
                toolbarExtraHeight: 0,
              ),
              body: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  child: Column(
                    children: [
                      VendorCard(vendor: model.vendor!),
                      Expanded(
                          child: TableListView(parameters: {
                        'filters': 'vendor_id:${model.vendor!.id}'
                      })),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
