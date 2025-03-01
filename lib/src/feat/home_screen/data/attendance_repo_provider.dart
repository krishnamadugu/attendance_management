import 'package:attendance_management/src/feat/home_screen/data/attendance_data_provider.dart';
import 'package:flutter/material.dart';

import '../../../core/common/common_models/sheet_attendee_model.dart';

class AttendanceRepoProvider {
  AttendanceDataProvider homeDataProvider;
  AttendanceRepoProvider({required this.homeDataProvider});

  Future<List<AttendeeModel>> fetchAllAttendeeInfo() async {
    try {
      final jsonResponse = await homeDataProvider.fetchAllAttendanceData();

      final repoModel = AttendeeModel.fromJson(jsonResponse);
      return [repoModel];
    } catch (e) {
      debugPrint("message $e");
      throw Exception(e.toString());
    }
  }

  Future<AttendeeModel> fetchAttendeeInfoByDate(
      int rowId, String colKey) async {
    try {
      final jsonResponse =
          await homeDataProvider.fetchAttendanceDataByDate(rowId, colKey);

      final repoModel = AttendeeModel.fromJson(jsonResponse);
      return repoModel;
    } catch (e) {
      debugPrint("message $e");
      throw Exception(e.toString());
    }
  }

  Future<List<AttendeeModel>> onCheckInCheckOutUpdate(
      {required int rowId,
      required String colKey,
      required String value}) async {
    try {
      final jsonResponse =
          await homeDataProvider.updateCheckInOutData(rowId, colKey, value);

      final repoModel = AttendeeModel.fromJson(jsonResponse);
      return [repoModel];
    } catch (e) {
      debugPrint("message $e");
      throw Exception(e.toString());
    }
  }
}
