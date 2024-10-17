import 'package:flutter/material.dart';
import 'package:internship/core/constant/asset_images.dart';
import 'package:internship/core/models/vendor/vendor.dart';
import 'package:internship/ui/shared/ui_helper.dart';
import 'package:internship/ui/widgets/stateful/vendor_items/view_model.dart';
import 'package:stacked/stacked.dart';

class VendorItemsView extends StatefulWidget {
  final String vendor_id;

  const VendorItemsView({Key? key, required this.vendor_id}) : super(key: key);

  @override
  _VendorItemsViewState createState() => _VendorItemsViewState();
}

class _VendorItemsViewState extends State<VendorItemsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VendorItemsViewModel>.reactive(
      viewModelBuilder: () => VendorItemsViewModel(),
      onViewModelReady: (model) async =>
          await model.init(context, widget.vendor_id),
      builder: (context, viewModel, child) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  'Vendor Items',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: viewModel.isBusy
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: viewModel.items.length,
                          itemBuilder: (context, index) {
                            final item = viewModel.items[index];
                            return ListTile(
                              leading: viewModel.items[index].img == null
                                  ? Image.asset(
                                      AssetImages.sadeem_logo,
                                      width: 50,
                                      height: 50,
                                    )
                                  : Image.network(
                                      viewModel.items[index].img!,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                              title: Text(
                                item.name!,
                                style: const TextStyle(fontSize: 18),
                              ),
                              subtitle: Text(
                                '\$${(item.price! * viewModel.quantitys[index]).toStringAsFixed(2)}',
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () =>
                                        viewModel.decrementQuantity(index),
                                  ),
                                  Text(
                                    '${viewModel.quantitys[index]}',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () =>
                                        viewModel.incrementQuantity(index),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Total: \$${viewModel.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pop(context); // Close modal after adding to cart
                    await viewModel.addToCart();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50), // Full-width button
                  ),
                  child: const Text('الاضافة الي اسلة'),
                ),
                UIHelper.verticalSpaceMedium(),
                ElevatedButton(
                  onPressed: () async {
                    await viewModel.request_service();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50), // Full-width button
                  ),
                  child: const Text(' طلب الخدمة '),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
