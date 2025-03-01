import 'package:attendance_management/src/core/constants/theme_constants/app_colors.dart';
import 'package:attendance_management/src/feat/bottom_bar/presentation/bloc/bottom_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

import '../../../home_screen/presentation/screen/home_screen.dart';
import '../../../management_screen/presentation/screen/management_screen.dart';
import '../../../others/no_network_screen/presentation/bloc/no_network_bloc.dart';
import '../../../others/no_network_screen/presentation/screen/no_connectivity_screen.dart';

class BottomBarScreen extends StatelessWidget {
  BottomBarScreen({super.key});

  final List<Widget> widgetOptions = <Widget>[
    HomeScreen(),
    ManagementScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomSheetCubit = context.read<BottomBarCubit>();

    return BlocBuilder<NoNetworkBloc, NoNetworkState>(
      builder: (context, state) {
        return state is NoNetworkFailure
            ? NoInternetScreen()
            : Scaffold(
                body: BlocBuilder<BottomBarCubit, int>(
                  builder: (BuildContext context, state) {
                    return widgetOptions.elementAt(state);
                  },
                ),
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
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
                          horizontal: 15.0, vertical: 12),
                      child: BlocBuilder<BottomBarCubit, int>(
                        builder: (BuildContext context, state) {
                          return GNav(
                            rippleColor: Colors.grey[300]!,
                            hoverColor: Colors.grey[100]!,
                            gap: 8,
                            activeColor: Colors.black,
                            iconSize: 24,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            duration: Duration(milliseconds: 400),
                            tabBackgroundColor: Colors.grey[300]!,
                            color: Colors.black,
                            mainAxisAlignment: MainAxisAlignment.center,
                            tabBorderRadius: 12.0,
                            tabMargin: EdgeInsets.symmetric(horizontal: 18.0),
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
                            selectedIndex: state,
                            onTabChange: (index) {
                              bottomSheetCubit.onPressed(index);
                            },
                          );
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
