import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:islamify/app/controller/page_index.dart';
import 'package:islamify/app/modules/editProfile/views/edit_profile_view.dart';
import 'package:islamify/app/modules/login/views/login_view.dart';
import 'package:islamify/core/theme/colors.dart';
import 'package:islamify/core/theme/text_theme.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

  // page controller for home, quran, and profile page
  final pageChange = Get.put<PageIndexController>(
    PageIndexController(),
  );

  // log out confirmation pop up
  void showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Apakah Anda yakin ingin keluar dari akun Anda?",
                  textAlign: TextAlign.center,
                  style: blackBold16,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: opal,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Text(
                              "Tidak",
                              style: blackBold16,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).height / 50,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.to(
                            () => LoginView(),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: sunsetOrange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Text(
                              "Ya",
                              style: whiteBold16,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cultured,
      appBar: AppBar(
        backgroundColor: cultured,
        elevation: 5,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        leading: const Center(
          child: Text(
            "Islamify",
            style: winterDreamBold32,
          ),
        ),
        leadingWidth: MediaQuery.of(context).size.width / 2.5,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            child: IgnorePointer(
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/images/logo.png",
                  scale: 10,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            bottom: 40,
          ),
          child: Column(
            children: [
              // section - profile
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: opal,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: RichText(
                            text: const TextSpan(
                              text: "Dimas\n",
                              style: blackBold24,
                              children: [
                                TextSpan(
                                  text: "dimas.jombang@gmail.com",
                                  style: blackW30012,
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/images/profile.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // section - selesai materi & status level
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: opal,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/iconSelesai.png",
                                scale: 15,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: "Selesai Materi\n",
                                  style: blackW30012,
                                  children: [
                                    TextSpan(
                                      text: "0",
                                      style: blackBold12,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: opal,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/iconStatus.png",
                                scale: 15,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              RichText(
                                text: const TextSpan(
                                  text: "Status Level\n",
                                  style: blackW30012,
                                  children: [
                                    TextSpan(
                                      text: "Pemula",
                                      style: blackBold12,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              // section - information
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Informasi",
                          style: blackBold12,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(
                              () => EditProfileView(),
                            );
                          },
                          child: const Text(
                            "Ubah Data",
                            style: pictonBlueBold12,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: opal,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),

                          // section - nama
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: cultured,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                "Nama",
                                                style: blackBold12,
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                "Dimas Jombang",
                                                style: blackW30012,
                                                textAlign: TextAlign.end,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          // section - email
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: cultured,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                "Email",
                                                style: blackBold12,
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Text(
                                                "dimas.jombang@gmail.com",
                                                style: blackW30012,
                                                textAlign: TextAlign.end,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          // section - gender
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: cultured,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                "Jenis Kelamin",
                                                style: blackBold12,
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                "Laki-laki",
                                                style: blackW30012,
                                                textAlign: TextAlign.end,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          // section - join date
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: cultured,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                "Bergabung",
                                                style: blackBold12,
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                "4 Desember 2023",
                                                style: blackW30012,
                                                textAlign: TextAlign.end,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              // section - log out button
              Container(
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: sunsetOrange,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    10,
                  ),
                  child: InkWell(
                    onTap: () {
                      showLogoutConfirmation(context);
                    },
                    child: const AutoSizeText(
                      "Keluar",
                      style: whiteBold16,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // section - bottom navigation
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: opal,
        style: TabStyle.react,
        height: kToolbarHeight * 0.75,
        items: [
          TabItem(
            icon: Image.asset(
              "assets/images/iconHome.png",
              scale: 15,
            ),
          ),
          TabItem(
            icon: Image.asset(
              "assets/images/iconQuran.png",
              scale: 15,
            ),
          ),
          TabItem(
            icon: Image.asset(
              "assets/images/iconProfile.png",
              scale: 15,
            ),
          ),
        ],
        initialActiveIndex: pageChange.pageIndex.value + 2,
        onTap: (int i) => pageChange.changePage(i),
      ),
    );
  }
}
