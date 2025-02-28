import 'package:flutter/foundation.dart' hide Key;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../constants/app_constants/app_constants.dart';

void loadAppEnvironment() {
  if (kReleaseMode) {
    EnvConstants.sheetId = dotenv.env['SPREAD_SHEET_ID']!;
    EnvConstants.sheetCredentials = dotenv.env['SHEET_API_CREDS']!;
  } else if (kDebugMode) {
    EnvConstants.sheetId = dotenv.env['SPREAD_SHEET_ID']!;
    EnvConstants.sheetCredentials = dotenv.env['SHEET_API_CREDS']!;
  }
}
