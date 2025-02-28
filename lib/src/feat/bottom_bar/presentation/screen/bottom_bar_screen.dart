import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../../../home_screen/presentation/screen/home_screen.dart';
import '../../../management_screen/presentation/screen/management_screen.dart';
import '../../../others/no_network_screen/presentation/bloc/no_network_bloc.dart';
import '../../../others/no_network_screen/presentation/screen/no_connectivity_screen.dart';

class BottomBarScreen extends StatelessWidget {
  const BottomBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    final List<Widget> widgetOptions = <Widget>[
      HomeScreen(),
      ManagementScreen(),
    ];

    return BlocBuilder<NoNetworkBloc, NoNetworkState>(
      builder: (context, state) {
        return state is NoNetworkFailure
            ? NoInternetScreen()
            : Scaffold(
                body: widgetOptions.elementAt(selectedIndex),
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: Colors.black.withValues(alpha: 0.1),
                      )
                    ],
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8),
                      child: GNav(
                        rippleColor: Colors.grey[300]!,
                        hoverColor: Colors.grey[100]!,
                        gap: 8,
                        activeColor: Colors.black,
                        iconSize: 24,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        duration: Duration(milliseconds: 400),
                        tabBackgroundColor: Colors.grey[100]!,
                        color: Colors.black,
                        tabs: [
                          GButton(
                            icon: LineIcons.calendarCheck,
                            text: 'Attendance',
                          ),
                          GButton(
                            icon: LineIcons.user,
                            text: 'Manage Employees',
                          ),
                        ],
                        selectedIndex: selectedIndex,
                        onTabChange: (index) {
                          selectedIndex = index;
                        },
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
