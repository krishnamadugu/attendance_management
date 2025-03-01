import '../../../core/constants/app_constants/app_constants.dart';
import '../../../core/constants/app_constants/app_texts.dart';
import '../../../core/utility/helpers/google_sheet_api_helper.dart';

class AttendanceDataProvider {
  /// will provide all attendee info
  Future<Map<String, dynamic>> fetchAllAttendanceData() async {
    try {
      if (AppConstants.isNetworkConnected) {
        final response = await GSheetApiHelper.getAllRowsInfo(
            GSheetApiHelper.attendeeWorkSheet!);

        return response;
      } else {
        throw AppTexts.kPlsInternetConnection;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  /// will provide info by date
  Future<Map<String, dynamic>> fetchAttendanceDataByDate(
      int rowId, String colKey) async {
    try {
      if (AppConstants.isNetworkConnected) {
        final response = await GSheetApiHelper.getValueByKey(
          worksheet: GSheetApiHelper.attendeeWorkSheet!,
          id: rowId,
          key: colKey,
        );

        return response;
      } else {
        throw AppTexts.kPlsInternetConnection;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  ///  will update the check in & check out time of the employee
  Future<Map<String, dynamic>> updateCheckInOutData(
      int rowId, String colKey, String value) async {
    try {
      if (AppConstants.isNetworkConnected) {
        final response = await GSheetApiHelper.updateCellByKey(
          worksheet: GSheetApiHelper.attendeeWorkSheet!,
          id: rowId,
          key: colKey,
          value: value,
        );

        return response;
      } else {
        throw AppTexts.kPlsInternetConnection;
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
