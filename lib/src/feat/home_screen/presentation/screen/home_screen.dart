import 'package:attendance_management/src/core/constants/theme_constants/app_colors.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/attendance_bloc.dart';
import '../widgets/attendance_item_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final TextTheme txtTheme = Theme.of(context).textTheme;
    final attendanceBloc = context.read<AttendanceBloc>();

    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        scrolledUnderElevation: 0.0,
        title: Text(
          "Check Attendance",
          style: txtTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<AttendanceBloc, AttendanceState>(
          bloc: attendanceBloc,
          builder: (context, state) {
            return ListView(
              children: [
                Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.fromSeed(
                      primary: AppColors.blackColor.withValues(alpha: 0.8),
                      seedColor: AppColors.greyColor,
                    ),
                  ),
                  child: EasyDateTimeLinePicker(
                    focusedDate: _selectedDate,
                    firstDate: DateTime(2024, 3, 18),
                    lastDate: DateTime(2030, 3, 18),
                    onDateChange: (date) {
                      // Handle the selected date.
                    },
                  ),
                ),
                const SizedBox(height: 14.0),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return AttendeeItemWidget(
                      empName: 'Bala Krishna',
                      timeLine: '10:00 AM - 07:00 PM',
                      overTime: "7 hrs 30min",
                      attendeeStatus: "Present",
                      onCheckInPressed: () {},
                      onCheckOutPressed: () {},
                      onUpdatePressed: () {},
                    );
                  },
                ),
              ],
            );
          }),
    );
  }
}
