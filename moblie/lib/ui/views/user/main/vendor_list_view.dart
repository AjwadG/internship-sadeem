import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:internship/core/constant/api_routes.dart';
import 'package:internship/core/constant/constants.dart';
import 'package:internship/core/constant/end_point_parameters.dart';
import 'package:internship/core/enums/http_request_type.dart';
import 'package:internship/core/models/vendor/vendor.dart';
import 'package:internship/core/repositories/magical_repository.dart';
import 'package:internship/locator.dart';
import 'package:internship/ui/views/user/main/main_view_model.dart';
import 'package:internship/ui/widgets/stateful/vendor_card/view.dart';
import 'package:stacked/stacked.dart';

class VendorListView extends StatefulWidget {
  final Map<String, String> parameters;

  const VendorListView({Key? key, required this.parameters}) : super(key: key);
  @override
  _VendorListViewState createState() => _VendorListViewState();
}

class _VendorListViewState extends State<VendorListView> {
  static const _pageSize = 10;

  final PagingController<int, Vendor> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    var parameters = widget.parameters;
    parameters[EndPointParameter.page] = pageKey.toString();
    parameters[EndPointParameter.sorts] = Constants.DEFAULT_SORTS;

    var vendors = (await locator<MagicalRepository>().handelRequest(
            model: Vendor(),
            specific_key: EndPointParameter.DATA,
            parameters: parameters,
            methodType: HTTPMethodType.GET,
            route: ApiRoutes.vendors))
        .cast<Vendor>();
    final isLastPage = vendors.length < _pageSize;
    if (isLastPage) {
      _pagingController.appendLastPage(vendors);
    } else {
      final nextPageKey = pageKey + 1;
      _pagingController.appendPage(vendors, nextPageKey);
    }
  }

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<MainViewModel>.reactive(
        viewModelBuilder: () => MainViewModel(),
        onViewModelReady: (viewModel) async => await viewModel.init(context),
        builder: (context, model, child) =>
            PagedListView<int, Vendor>.separated(
          separatorBuilder: (context, index) => Divider(),
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Vendor>(
            itemBuilder: (context, item, index) => Container(
              child: VendorCard(vendor: item),
            ),
          ),
        ),
      );

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
