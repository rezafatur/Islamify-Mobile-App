import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:islamify/app/controller/page_index.dart';
import 'package:islamify/core/theme/colors.dart';
import 'package:islamify/core/theme/text_theme.dart';
import '../controllers/schedule_student_controller.dart';

class ScheduleStudentView extends GetView<ScheduleStudentController> {
  ScheduleStudentView({Key? key}) : super(key: key);

  // page controller untuk homeStudent, scheduleStudent, and profileStudent
  final pageStudent = Get.put<PageIndexController>(
    PageIndexController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackGray,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: azureishWhite,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        leading: const Center(
          child: Text(
            "Islamify",
            style: msuGreenBold32,
          ),
        ),
        leadingWidth: MediaQuery.of(context).size.width / 2.5,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            child: InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(
                        0.25,
                      ),
                      offset: Offset.zero,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Image.asset(
                  "assets/images/logo.png",
                  scale: 10,
                ),
              ),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'ScheduleStudentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),

      // section - bottom navigation
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: columbiaBlue,
        style: TabStyle.react,
        height: kToolbarHeight * 0.75,
        items: [
          TabItem(
            icon: Image.asset(
              "assets/images/iconHome.png",
            ),
            activeIcon: Image.asset(
              "assets/images/iconHomeSelected.png",
            ),
          ),
          TabItem(
            icon: Image.asset(
              "assets/images/iconSchedule.png",
            ),
            activeIcon: Image.asset(
              "assets/images/iconScheduleSelected.png",
            ),
          ),
          TabItem(
            icon: Image.asset(
              "assets/images/iconUser.png",
            ),
            activeIcon: Image.asset(
              "assets/images/iconUserSelected.png",
            ),
          ),
        ],
        initialActiveIndex: pageStudent.pageIndex.value + 1,
        onTap: (int i) => pageStudent.changePage(i),
      ),
    );
  }
}
