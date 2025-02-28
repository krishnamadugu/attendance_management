import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../feat/others/no_network_screen/presentation/bloc/no_network_bloc.dart';

class NetworkHelper {
  static void observeNetwork() {
    Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> result) {
        if (result.contains(ConnectivityResult.none)) {
          NoNetworkBloc().add(NoNetworkNotify());
        } else {
          NoNetworkBloc().add(NoNetworkNotify(isConnected: true));
        }
      },
    );
  }
}
