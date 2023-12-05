import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:islamify/app/modules/profile/views/profile_view.dart';
import 'package:islamify/core/theme/colors.dart';
import 'package:islamify/core/theme/text_theme.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  EditProfileView({Key? key}) : super(key: key);

  @override
  final EditProfileController controller = Get.put(
    EditProfileController(),
  );
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
        iconTheme: const IconThemeData(
          color: wintergreenDream,
        ),
        title: const Text(
          "Ubah Data",
          style: winterDreamBold20,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            kToolbarHeight,
            20,
            kToolbarHeight,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // section - form
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      20,
                    ),
                  ),
                  border: Border.all(
                    color: opal,
                    width: 2,
                  ),
                  color: cultured,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // section - header
                      const Text(
                        "Ubah Data",
                        style: blackBold16,
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // section - full name
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: opal,
                            suffixIcon: const Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 20,
                            ),
                            hintText: "Nama Lengkap",
                            hintStyle: blackW30012italic,
                          ),
                          maxLines: 1,
                          style: blackW30012italic,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // section - email
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: opal,
                            suffixIcon: const Icon(
                              Icons.email,
                              color: Colors.black,
                              size: 20,
                            ),
                            hintText: "Email",
                            hintStyle: blackW30012italic,
                          ),
                          maxLines: 1,
                          style: blackW30012italic,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // section - password
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Obx(
                          () => TextField(
                            controller: passwordController,
                            obscureText: controller.showPassword.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: opal,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.showPassword.value =
                                      !(controller.showPassword.value);
                                },
                                child: Icon(
                                  controller.showPassword.value != false
                                      ? Icons.lock
                                      : Icons.lock_open,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                              hintText: "Kata Sandi",
                              hintStyle: blackW30012italic,
                            ),
                            maxLines: 1,
                            style: blackW30012italic,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // Section - confirm password
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Obx(
                          () => TextField(
                            controller: confirmPasswordController,
                            obscureText: controller.showConfirmPassword.value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: opal,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.showConfirmPassword.value =
                                      !(controller.showConfirmPassword.value);
                                },
                                child: Icon(
                                  controller.showConfirmPassword.value != false
                                      ? Icons.lock
                                      : Icons.lock_open,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                              hintText: "Konfirmasi Kata Sandi",
                              hintStyle: blackW30012italic,
                            ),
                            maxLines: 1,
                            style: blackW30012italic,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      // section - change data button
                      Container(
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              10,
                            ),
                          ),
                          color: opal,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(
                            10,
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.to(
                                () => ProfileView(),
                              );
                            },
                            child: const AutoSizeText(
                              "Ubah",
                              style: blackBold16,
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
            ],
          ),
        ),
      ),
    );
  }
}
