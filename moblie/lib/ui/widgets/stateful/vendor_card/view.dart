import 'package:flutter/material.dart';
import 'package:internship/core/constant/api_routes.dart';
import 'package:internship/core/constant/asset_images.dart';
import 'package:internship/core/models/vendor/vendor.dart';
import 'package:internship/ui/widgets/stateful/vendor_card/view_model.dart';
import 'package:stacked/stacked.dart';

class VendorCard extends StatefulWidget {
  final Vendor vendor;

  const VendorCard({Key? key, required this.vendor}) : super(key: key);

  @override
  _VendorCardState createState() => _VendorCardState();
}

class _VendorCardState extends State<VendorCard> {
  String fixImg(String oldurl) {
    return oldurl.replaceAll(ApiRoutes.wrong, ApiRoutes.base);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VendorCardViewModel>.reactive(
        viewModelBuilder: () => VendorCardViewModel(),
        onViewModelReady: (model) async =>
            await model.init(context, widget.vendor),
        builder: (context, model, child) => model.isBusy
            ? CircularProgressIndicator()
            : InkWell(
                onTap: () async {
                  await model.moveToVendor();
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 4,
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        // Vendor Image
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: model.vendor!.img != null
                                ? Image.network(
                                    fixImg(model.vendor!.img!),
                                    width: 80,
                                    height: 80,
                                  )
                                : Image.asset(
                                    AssetImages.sadeem_logo,
                                    width: 80,
                                    height: 80,
                                  )),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model.vendor!.name ?? '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                model.vendor!.description ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),

                        // Favorite Icon (Example Action)
                      ],
                    ),
                  ),
                ),
              ));
  }
}
