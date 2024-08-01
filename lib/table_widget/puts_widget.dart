import 'package:flutter/material.dart';
import 'package:table_app/const.dart';
import 'package:table_app/table_widget/models/data_row_model.dart';

class PutsWidget extends StatelessWidget {
  final ScrollController controller2;
  PutsWidget({super.key, required this.controller2});

  final List<CallsRowModel> _data = [
    CallsRowModel(
      vol: "1.76L",
      oiChgPct: "-3%",
      oi: "13.94L",
      chngChngPct: ["12%", "2%"],
      ltp: "80.9K",
    ),
    CallsRowModel(
      vol: "1.48L",
      oiChgPct: "-1%",
      oi: "47.63K",
      chngChngPct: ["12%", "2%"],
      ltp: "24600",
    ),
    CallsRowModel(
      vol: "79.76K",
      oiChgPct: "2%",
      oi: "19.89K",
      chngChngPct: ["-1%"],
      ltp: "24700",
    ),
    CallsRowModel(
      vol: "2.34L",
      oiChgPct: "-5%",
      oi: "48.35K",
      chngChngPct: ["10%", "3%"],
      ltp: "24800",
    ),
    CallsRowModel(
      vol: "1.20L",
      oiChgPct: "-8%",
      oi: "22.95K",
      chngChngPct: ["5%", "1%"],
      ltp: "24900",
    ),
    CallsRowModel(
      vol: "68.47K",
      oiChgPct: "8%",
      oi: "15.66K",
      chngChngPct: ["9%", "-3%"],
      ltp: "25000",
    ),
    CallsRowModel(
      vol: "42.10K",
      oiChgPct: "2%",
      oi: "12.75K",
      chngChngPct: ["7%", "4%"],
      ltp: "25100",
    ),
    CallsRowModel(
      vol: "1.33L",
      oiChgPct: "-6%",
      oi: "17.60K",
      chngChngPct: ["11%", "5%"],
      ltp: "25200",
    ),
    CallsRowModel(
      vol: "56.70K",
      oiChgPct: "4%",
      oi: "25.30K",
      chngChngPct: ["14%", "-2%"],
      ltp: "25300",
    ),
  ];

  @override 
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller2,
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: const WidgetStatePropertyAll(Colors.blue),
        columnSpacing: 15,
        border: TableBorder.all(),
        columns: const [
          DataColumn(label: Text("LTP")),
          DataColumn(label: Text("Chng\nChng %")),
          DataColumn(label: Text("OI")),
          DataColumn(label: Text("OI\nChg\n%")),
          DataColumn(label: Text("Vol")),
        ],
        rows: buildRows(_data),
      ),
    );
  }
}

List<DataRow> buildRows(List<CallsRowModel> data) {
  return data.map((row) {
    return DataRow(cells: [
      DataCell(Text(row.vol, style: _getColorStyle(row.vol))),
      DataCell(Text(row.oiChgPct, style: _getColorStyle(row.oiChgPct))),
      DataCell(Text(row.oi, style: _getColorStyle(row.oi))),
      DataCell(Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: row.chngChngPct.map((value) {
          return Text(value, style: _getColorStyle(value));
        }).toList(),
      )),
      DataCell(Text(row.ltp, style: _getColorStyle(row.ltp))),
    ]);
  }).toList();
}

TextStyle _getColorStyle(String value) {
  if (value.contains("-")) {
    return TextStyle(color: AppColors.red);
  } else if (value.contains("L")) {
    return TextStyle(color: AppColors.red);
  } else if (value.contains("K")) {
    return TextStyle(color: AppColors.green);
  } else if (value.contains("greenAccent")) {
    return TextStyle(color: AppColors.greenAccent);
  }
  return TextStyle(color: AppColors.black);
}
