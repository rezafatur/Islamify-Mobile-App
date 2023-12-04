import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:islamify/app/modules/homeStudent/views/home_student_view.dart';
import 'package:islamify/app/modules/register/views/register_view.dart';
import 'package:islamify/core/theme/colors.dart';
import 'package:islamify/core/theme/text_theme.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  @override
  final LoginController controller = Get.put(
    LoginController(),
  );
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Stack(
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

            // section - login form
            SizedBox(
              height: MediaQuery.of(context).size.height,
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
                              "Masuk ke Akun",
                              style: blackBold16,
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

                            // section - button
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
                                  onTap: () {
                                    Get.to(
                                      () => HomeStudentView(),
                                    );
                                  },
                                  child: const AutoSizeText(
                                    "Masuk",
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

                            // section - register button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "Belum punya akun?",
                                  style: blackW30012,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(
                                      () => RegisterView(),
                                    );
                                  },
                                  child: const Text(
                                    "Daftar",
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
      ),
    );
  }
}
