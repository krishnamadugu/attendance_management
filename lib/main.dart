import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'config/route_config/route_handler.dart';
import 'config/route_config/route_names.dart';
import 'src/core/constants/app_constants/app_texts.dart';
import 'src/core/utility/helpers/google_sheet_api_helper.dart';
import 'src/core/utility/helpers/load_app_environment.dart';
import 'src/feat/others/no_network_screen/presentation/bloc/no_network_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'env_keys.env');
  loadAppEnvironment();
  await GSheetApiHelper.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoNetworkBloc>(
          create: (BuildContext context) =>
              NoNetworkBloc()..add(NoNetworkObserve()),
        ),
      ],
      child: MaterialApp(
        title: AppTexts.kAppTitle,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteHandler.onGenerateRoute,
        initialRoute: RouteNames.splashScreen,
      ),
    );
  }
}
