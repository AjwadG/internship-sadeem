import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:internship/ui/views/user/main/vendor_list_view.dart';
import 'package:internship/ui/widgets/stateless/app_bar.dart';
import 'package:stacked/stacked.dart';
import '../../../widgets/stateful/drawer/customer_drawer_menu.dart';
import 'main_view_model.dart';

@RoutePage()
class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  // LocationData? currentLocation;

  @override
  void dispose() {
    super.dispose();
  }

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      onViewModelReady: (model) async {
        await model.init(
          context,
        );
      },
      viewModelBuilder: () => MainViewModel(),
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
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Search...',
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.search),
                                    onPressed: () {
                                      model.search(_searchController.text);
                                    },
                                  ),
                                ),
                                onSubmitted: (value) {
                                  model.search(value);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: VendorListView(parameters: {'q': model.q})),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
