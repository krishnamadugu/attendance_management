import 'package:flutter/material.dart';

import '../../../../core/constants/theme_constants/app_colors.dart';
import 'attendance_info_widget.dart';
import 'time_line_btn_widget.dart';

class AttendeeItemWidget extends StatelessWidget {
  const AttendeeItemWidget({
    super.key,
    required this.empName,
    required this.timeLine,
    required this.overTime,
    required this.attendeeStatus,
    required this.onCheckInPressed,
    required this.onCheckOutPressed,
    required this.onUpdatePressed,
  });

  final String empName;
  final String timeLine;
  final String overTime;
  final String attendeeStatus;
  final GestureTapCallback? onCheckInPressed;
  final GestureTapCallback? onCheckOutPressed;
  final GestureTapCallback? onUpdatePressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 12.0,
        horizontal: 12.0,
      ),
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: AppColors.whiteColor.withValues(alpha: 0.9),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 14.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10.0,
                    children: [
                      AttendanceInfoWidget(
                        empName: empName,
                        title: "Name : ",
                      ),
                      AttendanceInfoWidget(
                        empName: attendeeStatus,
                        title: "Status : ",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    spacing: 10.0,
                    children: [
                      AttendanceInfoWidget(
                        empName: timeLine,
                        title: "Time : ",
                      ),
                      AttendanceInfoWidget(
                        empName: overTime,
                        title: "Over Time : ",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              height: 25.0,
            ),
            Row(
              spacing: 20.0,
              children: [
                Expanded(
                  child: TimeLineBtnWidget(
                    btnTitle: 'Check-In',
                    icon: Icons.arrow_circle_right_outlined,
                    btnColor: AppColors.greenColor,
                    onTapPressed: onCheckInPressed,
                  ),
                ),
                Expanded(
                  child: TimeLineBtnWidget(
                    btnTitle: 'Check-Out',
                    icon: Icons.arrow_circle_left_outlined,
                    btnColor: AppColors.redColor,
                    onTapPressed: onCheckOutPressed,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            TimeLineBtnWidget(
              btnTitle: 'Update Attendance',
              icon: Icons.edit_calendar,
              btnColor: AppColors.greyColor,
              onTapPressed: onUpdatePressed,
            ),
          ],
        ),
      ),
    );
  }
}
