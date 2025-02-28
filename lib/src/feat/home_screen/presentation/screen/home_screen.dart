import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

import '../widgets/time_line_btn_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          EasyDateTimeLinePicker(
            focusedDate: _selectedDate,
            firstDate: DateTime(2024, 3, 18),
            lastDate: DateTime(2030, 3, 18),
            onDateChange: (date) {
              // Handle the selected date.
            },
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
      ),
    );
  }
}
