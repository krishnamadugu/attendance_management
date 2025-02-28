import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

import '../../common/common_models/sheet_attendee_model.dart';
import '../../common/common_models/sheet_emp_model.dart';
import '../../constants/app_constants/app_constants.dart';

class GSheetApiHelper {
  static final String _sheetId = EnvConstants.sheetId;
  static final String _credentials = EnvConstants.sheetCredentials;

  static final GSheets _gSheets = GSheets(_credentials);

  static Worksheet? _attendeeWorkSheet;
  static Worksheet? _empWorkSheet;

  static Future initialize() async {
    try {
      final spreadSheet = await _gSheets.spreadsheet(_sheetId);
      _attendeeWorkSheet =
          await _getWorkSheet(spreadSheet, title: 'attendance_logs');
      _empWorkSheet = await _getWorkSheet(spreadSheet, title: 'emp_list');

      final attendeeFirstRow = GSheetAttendeeFields.getFields();
      _attendeeWorkSheet!.values.insertRow(1, attendeeFirstRow);

      final empFirstRow = GSheetEmpFields.getFields();
      _empWorkSheet!.values.insertRow(1, empFirstRow);
    } catch (e) {
      debugPrint("GSheet Exception ---> $e");
    }
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet sheet,
      {required String title}) async {
    var workSheet = sheet.worksheetByTitle(title);
    workSheet ??= await sheet.addWorksheet(title);
    return workSheet;
  }

  static Future<int> getSheetRowId(Worksheet worksheet) async {
    final lastRow = await worksheet.values.lastRow();
    return ((lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0) + 1);
  }

  static Future getById({required Worksheet worksheet, required int id}) async {
    final response = worksheet.values.map.rowByKey(id, fromColumn: 1);
    return response;
  }

  static Future getAllRowsInfo(Worksheet worksheet) async {
    final response = worksheet.values.map.allRows();
    return response;
  }

  static Future insertData(
      {required Worksheet workSheet,
      required List<Map<String, dynamic>> dataList}) async {
    try {
      return workSheet.values.map.appendRows(dataList);
    } catch (e) {
      debugPrint("GSheet Insert Exception ---> $e");
      return null;
    }
  }

  static Future updateById(
      {required Worksheet worksheet,
      required int id,
      required Map<String, dynamic> data}) async {
    return worksheet.values.map.insertRowByKey(id, data);
  }

  static Future updateCellByKey(
      {required Worksheet worksheet,
      required int id,
      required String key,
      required String value}) async {
    return worksheet.values.insertValueByKeys(
      value,
      columnKey: key,
      rowKey: id,
    );
  }

  static Future deleteById(
      {required Worksheet workSheet, required int id}) async {
    final index = await workSheet.values.rowIndexOf(id);
    return workSheet.deleteRow(index);
  }
}
