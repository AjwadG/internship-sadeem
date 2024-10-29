import 'package:flutter/material.dart';
import 'package:internship/core/constant/asset_images.dart';
import 'package:internship/core/models/table/table.dart' as T;
import 'package:internship/ui/widgets/stateful/table_card/view_model.dart';
import 'package:stacked/stacked.dart';

class TableCard extends StatefulWidget {
  final T.Table table;

  const TableCard({Key? key, required this.table}) : super(key: key);

  @override
  _TableCardState createState() => _TableCardState();
}

class _TableCardState extends State<TableCard> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TableCardViewModel>.reactive(
        viewModelBuilder: () => TableCardViewModel(),
        onViewModelReady: (model) async =>
            await model.init(context, widget.table),
        builder: (context, model, child) => model.isBusy
            ? CircularProgressIndicator()
            : InkWell(
                onTap: () {
                  model.moveToTable();
                },
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.table_restaurant,
                          size: 60,
                          color: model.table!.is_available!
                              ? Colors.green
                              : Colors.red,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          model.table!.name!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }
}
