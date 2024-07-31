import 'package:flutter/material.dart';
import 'package:table_app/table_widget/models/center_widget_model.dart';

class CenterWidget extends StatelessWidget {
  const CenterWidget({super.key});

  static const TextStyle _boldTextStyle = TextStyle(fontWeight: FontWeight.bold);

  static  final List<DataRowModel> _data = [
    DataRowModel(strike: "24600", iv: "14.36"),
    DataRowModel(strike: "24700", iv: "13.81"),
    DataRowModel(strike: "24200", iv: "14.00"),
    DataRowModel(strike: "24300", iv: "14.20"),
    DataRowModel(strike: "24400", iv: "14.10"),
    DataRowModel(strike: "24500", iv: "14.30"),
    DataRowModel(strike: "24600", iv: "14.40"),
    DataRowModel(strike: "24700", iv: "14.50"),
    DataRowModel(strike: "24800", iv: "14.60"),
 
  ];

  List<DataRow> buildRows(List<DataRowModel> data) {
    return data.map((row) {
      return DataRow(cells: [
        DataCell(Text(row.strike, style: _boldTextStyle)),
        DataCell(Text(row.iv, style: _boldTextStyle)),
      ]);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: DataTable(
        columnSpacing: 15,
        border: TableBorder.all(),
        horizontalMargin: 10,
        columns: const [
          DataColumn(label: Text("Strike")),
          DataColumn(label: Text("IV")),
        ],
        rows: buildRows(_data),
      ),
    );
  }
}