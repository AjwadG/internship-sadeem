import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:internship/core/constant/api_routes.dart';
import 'package:internship/core/constant/constants.dart';
import 'package:internship/core/constant/end_point_parameters.dart';
import 'package:internship/core/enums/http_request_type.dart';
import 'package:internship/core/models/table/table.dart' as T;
import 'package:internship/core/repositories/magical_repository.dart';
import 'package:internship/locator.dart';
import 'package:internship/ui/views/user/main/main_view_model.dart';
import 'package:internship/ui/views/user/vendor/vendor_view_model.dart';
import 'package:internship/ui/widgets/stateful/table_card/view.dart';
import 'package:stacked/stacked.dart';

class TableListView extends StatefulWidget {
  final Map<String, String> parameters;

  const TableListView({Key? key, required this.parameters}) : super(key: key);
  @override
  _TableListViewState createState() => _TableListViewState();
}

class _TableListViewState extends State<TableListView> {
  static const _pageSize = 10;

  final PagingController<int, T.Table> _pagingController =
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
    print(parameters);
    parameters[EndPointParameter.page] = pageKey.toString();
    parameters[EndPointParameter.sorts] = Constants.DEFAULT_SORTS;

    var tables = (await locator<MagicalRepository>().handelRequest(
            model: T.Table(),
            specific_key: EndPointParameter.DATA,
            parameters: parameters,
            methodType: HTTPMethodType.GET,
            route: ApiRoutes.tables))
        .cast<T.Table>();
    final isLastPage = tables.length < _pageSize;
    if (isLastPage) {
      _pagingController.appendLastPage(tables);
    } else {
      final nextPageKey = pageKey + 1;
      _pagingController.appendPage(tables, nextPageKey);
    }
  }

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<VendorViewModel>.reactive(
        viewModelBuilder: () => VendorViewModel(),
        onViewModelReady: (viewModel) async =>
            await viewModel.init(context, null),
        builder: (context, model, child) => PagedGridView<int, T.Table>(
          pagingController: _pagingController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          builderDelegate: PagedChildBuilderDelegate<T.Table>(
            itemBuilder: (context, item, index) => Container(
              child: TableCard(table: item),
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
