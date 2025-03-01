import 'package:attendance_management/src/core/common/common_widgets/common_button_widget.dart';
import 'package:attendance_management/src/core/common/common_widgets/common_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../core/common/common_widgets/common_text_form_field_widget.dart';
import '../../../../core/constants/theme_constants/app_colors.dart';

class ManagementScreen extends StatelessWidget {
  const ManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme txtTheme = Theme.of(context).textTheme;
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        scrolledUnderElevation: 0.0,
        title: Text(
          "Employee List",
          style: txtTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: AppColors.greyColor.withValues(alpha: 0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 14.0),
                  leading: Icon(
                    Icons.person_4_rounded,
                    size: 24.0,
                    color: AppColors.greyColor,
                  ),
                  title: CommonTextWidget(
                    txtVal: 'Bala krishna',
                    textStyle: txtTheme.titleSmall,
                  ),
                  trailing: Icon(
                    Icons.delete_rounded,
                    color: AppColors.redColor,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blackColor.withValues(alpha: 0.6),
        onPressed: () {
          showMaterialModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              controller: ModalScrollController.of(context),
              child: Container(
                height: screenSize.height * 0.3,
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  spacing: 10.0,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 6.0,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonTextWidget(
                              txtVal: 'Add Employee',
                              textStyle: txtTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Transform.rotate(
                                angle: 40.0,
                                child: Icon(
                                  Icons.add_circle_outline_outlined,
                                  color: AppColors.redColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        const Divider(height: 20.0)
                      ],
                    ),
                    CommonTextFormField(
                      labelText: "Employee Name",
                    ),
                    const SizedBox(height: 30.0),
                    SizedBox(
                      width: screenSize.width,
                      height: 50.0,
                      child: CustomTextButton(
                        label: 'Submit',
                        textColor: AppColors.whiteColor,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
