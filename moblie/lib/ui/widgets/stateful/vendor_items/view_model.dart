import 'package:flutter/material.dart';
import 'package:internship/core/constant/api_routes.dart';
import 'package:internship/core/constant/end_point_parameters.dart';
import 'package:internship/core/enums/http_request_type.dart';
import 'package:internship/core/models/item/item.dart';
import 'package:internship/core/models/table/table.dart' as T;
import 'package:internship/core/repositories/magical_repository.dart';
import 'package:internship/locator.dart';
import 'package:stacked/stacked.dart';

class VendorItemsViewModel extends BaseViewModel {
  List<Item> _items = [];

  List<Item> get items => _items;
  List<int> quantitys = [];

  Future<void> init(BuildContext context, String vendor_id) async {
    setBusy(true);
    notifyListeners();
    _items = (await locator<MagicalRepository>().handelRequest(
            model: Item(),
            specific_key: EndPointParameter.DATA,
            parameters: {"filters": "vendor_id:${vendor_id}"},
            methodType: HTTPMethodType.GET,
            route: ApiRoutes.items))
        .cast<Item>();
    quantitys = List.filled(_items.length, 0);
    print(quantitys);
    print(_items);
    setBusy(false);
  }

  void incrementQuantity(int index) {
    quantitys[index]++;
    notifyListeners();
  }

  void decrementQuantity(int index) {
    if (quantitys[index] > 0) {
      quantitys[index]--;
      notifyListeners();
    }
  }

  double get totalPrice {
    int i = 0;
    return items.fold(0.0, (total, item) {
      return total + (item.price! * quantitys[i++]);
    });
  }

  Future<void> addToCart() async {
    // Implement cart logic here
    for (int i = 0; i < items.length; i++) {
      await locator<MagicalRepository>().handelRequest(
        model: Item(),
        specific_key: EndPointParameter.DATA,
        parameters: {
          "item_id": items[i].id,
          "quantity": quantitys[i],
        },
        methodType: HTTPMethodType.POST_FORM_DATA,
        route: ApiRoutes.add_to_cart,
      );
    }
  }

  Future<void> request_service() async {}
}
