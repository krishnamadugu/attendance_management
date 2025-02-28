import 'package:flutter/material.dart';

import '../../../../core/common/common_widgets/common_text_widget.dart';
import '../../../../core/constants/theme_constants/app_colors.dart';
import 'attendance_item_widget.dart';

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
      margin: EdgeInsets.all(8.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Column(
            spacing: 10.0,
            children: [
              CommonTextWidget(
                txtVal: empName,
              ),
              CommonTextWidget(
                txtVal: timeLine,
              ),
              CommonTextWidget(
                txtVal: "Over Time : $overTime",
              ),
              CommonTextWidget(
                txtVal: "Status : $attendeeStatus",
              ),
            ],
          ),
          const Divider(),
          Row(
            children: [
              Expanded(
                child: TimeLineBtnWidget(
                  btnTitle: 'Check-In',
                  icon: Icons.exit_to_app,
                  btnColor: AppColors.greenColor,
                  onTapPressed: onCheckInPressed,
                ),
              ),
              Expanded(
                child: TimeLineBtnWidget(
                  btnTitle: 'Check-Out',
                  icon: Icons.exit_to_app,
                  btnColor: AppColors.redColor,
                  onTapPressed: onCheckOutPressed,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          TimeLineBtnWidget(
            btnTitle: 'Update Attendance',
            icon: Icons.edit,
            btnColor: AppColors.greyColor,
            onTapPressed: onUpdatePressed,
          ),
        ],
      ),
    );
  }
}
