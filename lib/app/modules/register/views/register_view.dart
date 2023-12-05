import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:islamify/app/modules/login/views/login_view.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_theme.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);

  @override
  final RegisterController controller = Get.put(
    RegisterController(),
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        leading: const Text(
          "",
        ),
      ),
      body: Stack(
        children: [
          // section - background color
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                40,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(
                    0.25,
                  ),
                  offset: Offset.zero,
                  blurRadius: 10,
                ),
              ],
              color: opal,
            ),
          ),

          // section - register form
          SingleChildScrollView(
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
                  // section - logo
                  Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      scale: 25,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  // section - form
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          20,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(
                            0.25,
                          ),
                          offset: Offset.zero,
                          blurRadius: 10,
                        ),
                      ],
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
                            "Buat Akun",
                            style: blackBold16,
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          // section - full name
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  20,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                    0.25,
                                  ),
                                  offset: Offset.zero,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    20,
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
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  20,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                    0.25,
                                  ),
                                  offset: Offset.zero,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                    20,
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
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  20,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                    0.25,
                                  ),
                                  offset: Offset.zero,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Obx(
                              () => TextField(
                                controller: passwordController,
                                obscureText: controller.showPassword.value,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      20,
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
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  20,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                    0.25,
                                  ),
                                  offset: Offset.zero,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Obx(
                              () => TextField(
                                controller: confirmPasswordController,
                                obscureText:
                                    controller.showConfirmPassword.value,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: opal,
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      controller.showConfirmPassword.value =
                                          !(controller
                                              .showConfirmPassword.value);
                                    },
                                    child: Icon(
                                      controller.showConfirmPassword.value !=
                                              false
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

                          // section - register button
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  20,
                                ),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                    0.25,
                                  ),
                                  offset: Offset.zero,
                                  blurRadius: 5,
                                ),
                              ],
                              color: opal,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(
                                10,
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: const AutoSizeText(
                                  "Daftar",
                                  style: blackBold16,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),

                          // Section - login button
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Sudah punya akun?",
                                style: blackW30012,
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(
                                    () => LoginView(),
                                  );
                                },
                                child: const Text(
                                  "Masuk",
                                  style: pictonBlueBold12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  // section - islamify
                  const Text(
                    "Islamify",
                    style: blackBold16,
                    textAlign: TextAlign.center,
                  ),

                  // section - description
                  const Text(
                    "Membantu Anda Membaca Al-Qur'an",
                    style: blackW30012,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
